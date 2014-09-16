//
//  RWSearchFormViewController.m
//  TwitterInstant
//
//  Created by Colin Eberhardt on 02/12/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "RWSearchFormViewController.h"
#import "RWSearchResultsViewController.h"
#import "RACEXTScope.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "RWTweet.h"
#import "NSArray+LinqExtensions.h"

typedef NS_ENUM(NSInteger, RWTwitterInstantError) {
  RWTwitterInstantErrorAccessDenied,
  RWTwitterInstantErrorNoTwitterAccounts,
  RWTwitterInstantErrorInvalidResponse
};

static NSString * const RWTwitterInstantDomain = @"TwitterInstant";

@interface RWSearchFormViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchText;

@property (strong, nonatomic) RWSearchResultsViewController *resultsViewController;

@property (strong, nonatomic) ACAccountStore *accountStore;
@property (strong, nonatomic) ACAccountType *twitterAccountType;

@end

@implementation RWSearchFormViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.title = @"Twitter Instant";
  
  [self styleTextField:self.searchText];
  
  self.resultsViewController = self.splitViewController.viewControllers[1];
  //  The subscribeNext: block uses self in order to obtain a reference to the text field. Blocks capture and retain values from the enclosing scope, therefore if a strong reference exists between self and this signal, it will result in a retain cycle. Whether this matters or not depends on the lifecycle of the self object. If its lifetime is the duration of the application, as is the case here, it doesn’t really matter. But in more complex applications, this is rarely the case.
    //n order to avoid this potential retain cycle, the Apple documentation for Working With Blocks recommends capturing a weak reference to self. With the current code you can achieve this as follows:
  /*
   __weak RWSearchFormViewController *bself = self; // Capture the weak reference
   
   [[self.searchText.rac_textSignal
   map:^id(NSString *text) {
   return [self isValidSearchText:text] ?
   [UIColor whiteColor] : [UIColor yellowColor];
   }]
   subscribeNext:^(UIColor *color) {
   bself.searchText.backgroundColor = color;
   }];
   */
    //he ReactiveCocoa framework inlcudes a little trick you can use in place of the above code. Add the following import to the top of the file:
  @weakify(self)
  [[self.searchText.rac_textSignal
    map:^id(NSString *text) {
      return [self isValidSearchText:text] ?
        [UIColor whiteColor] : [UIColor yellowColor];
    }]
    subscribeNext:^(UIColor *color) {
      @strongify(self)
      self.searchText.backgroundColor = color;
    }];
  
  self.accountStore = [[ACAccountStore alloc] init];
  self.twitterAccountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
  /*
   [[self requestAccessToTwitterSignal]
   subscribeNext:^(id x) {
   NSLog(@"Access granted");
   } error:^(NSError *error) {
   NSLog(@"An error occurred: %@", error);
   }];
   */
    /*
    [[[self requestAccessToTwitterSignal]
      then:^RACSignal *{
          @strongify(self)
          return self.searchText.rac_textSignal;
      }]
     subscribeNext:^(id x) {
         NSLog(@"%@", x);
     } error:^(NSError *error) {
         NSLog(@"An error occurred: %@", error);
     }];
     */
    //he then method waits until a completed event is emitted, then subscribes to the signal returned by its block parameter. This effectively passes control from one signal to the next.
    /*
     [[[self requestAccessToTwitterSignal]
     then:^RACSignal *{
     @strongify(self)
     return self.searchText.rac_textSignal;
     }]
     subscribeNext:^(id x) {
     NSLog(@"%@", x);
     } error:^(NSError *error) {
     NSLog(@"An error occurred: %@", error);
     }];
     */
    //Next, add a filter operation to the pipeline to remove any invalid search strings. In this instance, they are strings comprised of less than three characters:
    /*
     [[[[self requestAccessToTwitterSignal]
     then:^RACSignal *{
     @strongify(self)
     return self.searchText.rac_textSignal;
     }]
     filter:^BOOL(NSString *text) {
     @strongify(self)
     return [self isValidSearchText:text];
     }]
     subscribeNext:^(id x) {
     NSLog(@"%@", x);
     } error:^(NSError *error) {
     NSLog(@"An error occurred: %@", error);
     }];
     */
  [[[[[[[self requestAccessToTwitterSignal]
    then:^RACSignal *{
      @strongify(self)
      return self.searchText.rac_textSignal;
    }]
    filter:^BOOL(NSString *text) {
      @strongify(self)
      return [self isValidSearchText:text];
    }]
     // You might have noticed that every time you type a new character, a Twitter search executes immediately. If you’re a fast typer (or simply hold down the delete key), this can result in the application performing several searches a second. This is not ideal for a couple of reasons: firstly, you’re hammering the Twitter search API and simultaneously throwing away most of the results. Secondly, you’re constantly updating the results which is rather distracting for the user!
     // A better approach would be to perform a search only if the search text is unchanged for a short amount of time, say 500 milliseconds.
      //The throttle operation will only send a next event if another next event isn’t received within the given time period. It’s really that simple!
    throttle:0.5]
    flattenMap:^RACStream *(NSString *text) {
      @strongify(self)
      return [self signalForSearchWithText:text];
    }]
    deliverOn:[RACScheduler mainThreadScheduler]]
    subscribeNext:^(NSDictionary *jsonSearchResult) {
      //  This illustrates an important point about the ReactiveCocoa framework. The operations shown above execute on the thread where the signal originally emitted its events. Try adding breakpoints at the other pipeline steps, you might be surprised to find they execute on more than one different thread!
        //So how do you go about updating the UI? The typical approach is to use operation queues (see the tutorial How To Use NSOperations and NSOperationQueues elsewhere on this site for more details), however ReactiveCocoa has a much simpler solution to this problem.
      NSArray *statuses = jsonSearchResult[@"statuses"];
      NSArray *tweets = [statuses linq_select:^id(id tweet) {
        return [RWTweet tweetWithStatus:tweet];
      }];
      [self.resultsViewController displayTweets:tweets];
    } error:^(NSError *error) {
      NSLog(@"An error occurred: %@", error);
    }];
}

- (RACSignal *)requestAccessToTwitterSignal {
  
  // 1 - define an error
  NSError *accessError = [NSError errorWithDomain:RWTwitterInstantDomain
                                             code:RWTwitterInstantErrorAccessDenied
                                         userInfo:nil];
  
  // 2 - create the signal
  @weakify(self)
  return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    // 3 - request access to twitter
    @strongify(self)
    [self.accountStore
       requestAccessToAccountsWithType:self.twitterAccountType
         options:nil
      completion:^(BOOL granted, NSError *error) {
          // 4 - handle the response
          if (!granted) {
            [subscriber sendError:accessError];
          } else {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
          }
        }];
    return nil;
  }];
}

- (SLRequest *)requestforTwitterSearchWithText:(NSString *)text {
  NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json"];
  NSDictionary *params = @{@"q" : text};
  
  SLRequest *request =  [SLRequest requestForServiceType:SLServiceTypeTwitter
                                           requestMethod:SLRequestMethodGET
                                                     URL:url
                                              parameters:params];
  return request;
}

- (RACSignal *)signalForSearchWithText:(NSString *)text {

  // 1 - define the errors
  NSError *noAccountsError = [NSError errorWithDomain:RWTwitterInstantDomain
                                                 code:RWTwitterInstantErrorNoTwitterAccounts
                                             userInfo:nil];
  
  NSError *invalidResponseError = [NSError errorWithDomain:RWTwitterInstantDomain
                                                      code:RWTwitterInstantErrorInvalidResponse
                                                  userInfo:nil];
  
  // 2 - create the signal block
  @weakify(self)
  void (^signalBlock)(RACSubject *subject) = ^(RACSubject *subject) {
    @strongify(self);
    
    // 3 - create the request
    SLRequest *request = [self requestforTwitterSearchWithText:text];
    
    // 4 - supply a twitter account
    NSArray *twitterAccounts = [self.accountStore accountsWithAccountType:self.twitterAccountType];
    if (twitterAccounts.count == 0) {
      [subject sendError:noAccountsError];
      return;
    }
    [request setAccount:[twitterAccounts lastObject]];
    
    // 5 - perform the request
    [request performRequestWithHandler: ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
      if (urlResponse.statusCode == 200) {
        
        // 6 - on success, parse the response
        NSDictionary *timelineData = [NSJSONSerialization JSONObjectWithData:responseData
                                                                     options:NSJSONReadingAllowFragments
                                                                       error:nil];
        [subject sendNext:timelineData];
        [subject sendCompleted];
      }
      else {
        // 7 - send an error on failure
        [subject sendError:invalidResponseError];
      }
    }];
  };
  
  RACSignal *signal = [RACSignal startLazilyWithScheduler:[RACScheduler scheduler]
                                                    block:signalBlock];
  
  return signal;
}



- (BOOL)isValidSearchText:(NSString *)text {
  return text.length > 2;
}

- (void)styleTextField:(UITextField *)textField {
  CALayer *textFieldLayer = textField.layer;
  textFieldLayer.borderColor = [UIColor grayColor].CGColor;
  textFieldLayer.borderWidth = 2.0f;
  textFieldLayer.cornerRadius = 0.0f;
}

@end
