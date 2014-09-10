//
//  DiscogsViewController.m
//  DTOAuth
//
//  Created by Oliver Drobnik on 6/24/14.
//  Copyright (c) 2014 Cocoanetics. All rights reserved.
//

#import "DiscogsViewController.h"
#import "DiscogsOAuthClient.h"
#import "DTOAuthWebViewController.h"
#import "OAuthSettings.h"

@interface DiscogsViewController () <OAuthResultDelegate>

@end

@implementation DiscogsViewController
{
	DiscogsOAuthClient *auth;
	BOOL startedAuth;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// create the client
	auth = [[DiscogsOAuthClient alloc] initWithConsumerKey:DISCOGS_CONSUMER_KEY consumerSecret:DISCOGS_CONSUMER_SECRET];
}

- (void)_showAlertWithTitle:(NSString *)title message:(NSString *)message
{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		
		[alert show];
	});
}


- (void)_testConnection
{
	NSURL *protectedURL = [NSURL URLWithString:@"http://api.discogs.com/oauth/identity"];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:protectedURL];
	[request addValue:[auth authenticationHeaderForRequest:request] forHTTPHeaderField:@"Authorization"];
	
	
	NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
	
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (error)
		{
			[self _showAlertWithTitle:@"Something went wrong" message:[error localizedDescription]];
			return;
		}
		
		NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
		
		NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
		
		if (httpResponse.statusCode==200)
		{
			dispatch_async(dispatch_get_main_queue(), ^{
				self.appLabel.text = result[@"consumer_name"];
				self.userLabel.text = result[@"username"];
				self.protectedResourceLabel.text = @"✔";
			});
		}
		else
		{
			dispatch_async(dispatch_get_main_queue(), ^{
				NSString *msg = result[@"message"];
				
				[self _showAlertWithTitle:@"Problem" message:msg];
				self.appLabel.text = @"-";
				self.userLabel.text = @"-";
				self.protectedResourceLabel.text = @"✖️";
			});
		}
	}];
	
	[task resume];
}


- (IBAction)authorizeUser:(id)sender
{
	if (startedAuth)
	{
		// prevent doing it again returning from web view
		return;
	}
    //The typical authentication flow has 3 legs which is why it is often referred to as 3-legged OAuth:
   //1. App sends HTTP POST for requesting a request token.
	//1. get request token, save it to autho.token
	[auth requestTokenWithCompletion:^(NSError *error) {
		
		if (error)
		{
			[self _showAlertWithTitle:@"Error requesting Token" message:[error localizedDescription]];
			
			return;
		}
		
        dispatch_async(dispatch_get_main_queue(), ^{
            if (auth.token)
            {
                NSURLRequest *request = [auth userTokenAuthorizationRequest];
                
                DTOAuthWebViewController *webViewVC = [[DTOAuthWebViewController alloc] init];
                
                UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:webViewVC];
                
                webViewVC.authorizationDelegate = self;
                //[webViewVC startAuthorizationFlowWithRequest:request];
                
                [self presentViewController:navVC animated:YES completion:NULL];
                //2. App opens an authorization URL in a web view where the user can authorize your app for access. Once this is done you can catch a certain redirection which yields a verifier value.
                [webViewVC startAuthorizationFlowWithRequest:request
                                                  completion:^(BOOL isAuthenticated, NSString *verifier) {
                                                      // dismiss the web view
                                                      [self dismissViewControllerAnimated:YES completion:NO];
                                                      
                                                      if (!isAuthenticated)
                                                      {
                                                          NSLog(@"User did not authorize app");
                                                          return;
                                                      }
                                                      //3. App sends HTTP POST including the verifier value and signed with request token. Service returns an access token+secret.
                                                     // Once you have the new access token and matching secret you can create a valid signature for any API request.
                                                      [auth authorizeTokenWithVerifier:verifier
                                                                            completion:^(NSError *error) {
                                                                                
                                                                                if (error)
                                                                                {
                                                                                    NSLog(@"Unable to get access token: %@",
                                                                                          [error localizedDescription]);
                                                                                    return;
                                                                                }
                                                                                
                                                                                //block();
                                                                            }];//[autho
                                                  }];//[webView VC
                
                startedAuth = YES;
            }//if (auth.token)
        });//dispatch_async(dispatch_get_main_queue()
		
	}];
}

- (IBAction)accessProtectedResource:(id)sender
{
	[self _testConnection];
}

#pragma mark - OAuth

- (void)authorizationWasDenied:(DTOAuthWebViewController *)webViewController
{
	[self dismissViewControllerAnimated:YES completion:NULL];
	startedAuth = NO;
	
	self.tokenLabel.text = @"✖️";
}

- (void)authorizationWasGranted:(DTOAuthWebViewController *)webViewController forToken:(NSString *)token withVerifier:(NSString *)verifier
{
	[self dismissViewControllerAnimated:YES completion:NULL];
	startedAuth = NO;
	
	if ([token isEqualToString:auth.token])
	{
		[auth authorizeTokenWithVerifier:verifier completion:^(NSError *error) {
			if (error)
			{
				NSLog(@"Error authorizing token: %@", [error localizedDescription]);
				return;
			}
			else
			{
				dispatch_async(dispatch_get_main_queue(), ^{
					self.tokenLabel.text = @"✔";
				});
			}
		}];
	}
	else
	{
		NSLog(@"Received authorization for token '%@' instead of requested token '%@", token, auth.token);
	}
}

@end
