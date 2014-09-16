//
//  RWViewController.m
//  RWReactivePlayground
//
//  Created by Colin Eberhardt on 18/12/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "RWViewController.h"
#import "RWDummySignInService.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RWViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UILabel *signInFailureText;

@property (strong, nonatomic) RWDummySignInService *signInService;

@end

@implementation RWViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    /*
    [self.usernameTextField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    [[self.usernameTextField.rac_textSignal
      filter:^BOOL(id value) {
          NSString *text = value;
          return text.length > 3;
      }]
     subscribeNext:^(id x) {
         NSLog(@"%@", x);
     }];*/
    /* //A Little Cast
     RACSignal *usernameSourceSignal =
     self.usernameTextField.rac_textSignal;
     
     RACSignal *filteredUsername = [usernameSourceSignal
     filter:^BOOL(id value) {
     NSString *text = value;
     return text.length > 3;
     }];
     
     [filteredUsername subscribeNext:^(id x) {
     NSLog(@"%@", x);
     }];*/
    
    /*
     [[self.usernameTextField.rac_textSignal
     filter:^BOOL(id value) {
     NSString *text = value; // implicit cast
     return text.length > 3;
     }]
     subscribeNext:^(id x) {
     NSLog(@"%@", x);
     }];
     [[self.usernameTextField.rac_textSignal
     filter:^BOOL(NSString *text) {
     return text.length > 3;
     }]
     subscribeNext:^(id x) {
     NSLog(@"%@", x);
     }];
     */
    
    //The newly added map operation transforms the event data using the supplied block.
   /* [[[self.usernameTextField.rac_textSignal
       map:^id(NSString *text) {
           return @(text.length);
       }]
      filter:^BOOL(NSNumber *length) {
          return [length integerValue] > 3;
      }]
     subscribeNext:^(id x) {
         NSLog(@"%@", x);
     }];*/
    
    
  self.signInService = [RWDummySignInService new];
  
  // initially hide the failure message
  self.signInFailureText.hidden = YES;
  
  
  RACSignal *validUsernameSignal =
    [self.usernameTextField.rac_textSignal
      map:^id(NSString *text) {
        return @([self isValidUsername:text]);
      }];
  
  RACSignal *validPasswordSignal =
    [self.passwordTextField.rac_textSignal
      map:^id(NSString *text) {
        return @([self isValidPassword:text]);
      }];
  //Please don’t add this code, there’s a much more elegant solution coming!)
   /* [[validPasswordSignal
      map:^id(NSNumber *passwordValid) {
          return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
      }]
     subscribeNext:^(UIColor *color) {
         self.passwordTextField.backgroundColor = color;
     }];*/
  RAC(self.passwordTextField, backgroundColor) =
    [validPasswordSignal
      map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
      }];

  RAC(self.usernameTextField, backgroundColor) =
    [validUsernameSignal
      map:^id(NSNumber *passwordValid) {
       return [passwordValid boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
      }];

  //Combining signals
  RACSignal *signUpActiveSignal =
    [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal]
                      reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid) {
                        return @([usernameValid boolValue] && [passwordValid boolValue]);
                      }];
  //get value  at last
  [signUpActiveSignal subscribeNext:^(NSNumber *signupActive) {
     self.signInButton.enabled = [signupActive boolValue];
   }];
  
    
    /*
     [[self.signInButton
     rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
     NSLog(@"button clicked");
     }];
     */
  [[[[self.signInButton
    rac_signalForControlEvents:UIControlEventTouchUpInside]
     //Did you notice there is one small user experience issue with the current application? When the sign-in service validates the supplied credentials, is should disable the Sign In button. This prevents the user from repeating the same sign-in. Furthermore, if a failed sign-in attempt occurred, the error message should be hidden when the user tries to sign-in once again.
    doNext:^(id x) {
      self.signInButton.enabled = NO;
      self.signInFailureText.hidden = YES;
    }]
    
    //he following code uses the map method used earlier to transform the button touch signal into the sign-in signal. The subscriber simply logs the result.
    //e situation below is sometimes called the signal of signals; in other words an outer signal that contains an inner signal. If you really wanted to, you could subscribe to the inner signal within the outer signal’s subscribeNext: bloc
    /*
     [[[self.signInButton
     rac_signalForControlEvents:UIControlEventTouchUpInside]
     map:^id(id x) {
     return [self signInSignal];
     }]
     subscribeNext:^(id x) {
     NSLog(@"Sign in result: %@", x);
     }];*/
    //This maps the button touch event to a sign-in signal as before, but also flattens it by sending the events from the inner signal to the outer signal.
   /* [[[self.signInButton
       rac_signalForControlEvents:UIControlEventTouchUpInside]
      flattenMap:^id(id x) {
          return [self signInSignal];
      }]
     subscribeNext:^(id x) {
         NSLog(@"Sign in result: %@", x);
     }];
    */
    
    flattenMap:^id(id x) {
      return [self signInSignal];
    }]
    subscribeNext:^(NSNumber *signedIn) {
      self.signInButton.enabled = YES;
      BOOL success = [signedIn boolValue];
      self.signInFailureText.hidden = success;
      if (success) {
        [self performSegueWithIdentifier:@"signInSuccess" sender:self];
      }
    }];
}

- (BOOL)isValidUsername:(NSString *)username {
  return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
  return password.length > 3;
}
//The following code uses the createSignal: method on RACSignal for signal creation. The block that describes this signal is a single argument, and is passed to this method. When this signal has a subscriber, the code within this block executes.
//The block is passed a single subscriber instance that adopts the RACSubscriber protocol, which has methods you invoke in order to emit events; you may also send any number of next events, terminated with either an error or complete event. In this case, it sends a single next event to indicate whether the sign-in was a success, followed by a complete event.
-(RACSignal *)signInSignal {
  return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [self.signInService
     signInWithUsername:self.usernameTextField.text
     password:self.passwordTextField.text
     complete:^(BOOL success) {
       [subscriber sendNext:@(success)];
       [subscriber sendCompleted];
     }];
    return nil;
  }];
}


@end
