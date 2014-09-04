/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk
 */

#pragma mark - Cookbook
#define COOKBOOK_PURPLE_COLOR [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]

#pragma mark - Bar Buttons
#define BARBUTTON(TITLE, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define SYSBARBUTTON(ITEM, SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:self action:SELECTOR]
#define IMGBARBUTTON(IMAGE, SELECTOR) [[UIBarButtonItem alloc] initWithImage:IMAGE style:UIBarButtonItemStylePlain target:self action:SELECTOR]
#define CUSTOMBARBUTTON(VIEW) [[UIBarButtonItem alloc] initWithCustomView:VIEW]

#define SYSBARBUTTON_TARGET(ITEM, TARGET, SELECTOR) [[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:TARGET action:SELECTOR]
#define BARBUTTON_TARGET(TITLE, TARGET, SELECTOR) [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:TARGET action:SELECTOR]

#pragma mark - Platform
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#pragma mark - Orientation
// #define IS_PORTRAIT UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)
// #define IS_PORTRAIT UIDeviceOrientationIsPortrait(self.interfaceOrientation)
// #define IS_PORTRAIT UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) || UIDeviceOrientationIsPortrait(self.interfaceOrientation)

#pragma mark - Debug
#define BOOL_CHECK(TITLE, CHECK_ITEM) printf("%s: %s\n", TITLE, (CHECK_ITEM) ? "Yes" : "No")

#pragma mark - Geometry
#define RECTCENTER(RECT) CGPointMake(CGRectGetMidX(RECT), CGRectGetMidY(RECT))
#define RECT_PT(_X_, _Y_) CGRectMake(_X_, _Y_, 0.0f, 0.0f)
#define RECT_SIZE(_W_, _H_) CGRectMake(0.0f, 0.0f, _W_, _H_)

#pragma mark - Autosizing
#define RESIZABLE(VIEW) [VIEW setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth]

#pragma mark - Strings
#define STREQ(STRING1, STRING2) ([STRING1 caseInsensitiveCompare:STRING2] == NSOrderedSame)
#define PREFIXED(STRING1, STRING2) ([[STRING1 uppercaseString] hasPrefix:[STRING2 uppercaseString]])
#define TRIMSTRING(STRING) ([STRING stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])
#define PADSTRING(STRING) ([NSString stringWithFormat:@" %@ ", TRIMSTRING(STRING)])

#define STRDATA(STRING) ([STRING dataUsingEncoding:NSUTF8StringEncoding])
#define DATASTR(DATA) ([[NSString alloc] initWithData:DATA encoding:NSUTF8StringEncoding])

#define RECTSTRING(_aRect_)		NSStringFromCGRect(_aRect_)
#define POINTSTRING(_aPoint_)	NSStringFromCGPoint(_aPoint_)
#define SIZESTRING(_aSize_)		NSStringFromCGSize(_aSize_)

#pragma mark - Constraints
#define PREPCONSTRAINTS(VIEW) [VIEW setTranslatesAutoresizingMaskIntoConstraints:NO]
#define CONSTRAIN(PARENT, VIEW, FORMAT) [PARENT addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:(FORMAT) options:0 metrics:nil views:NSDictionaryOfVariableBindings(VIEW)]]
#define CONSTRAIN_VIEWS(PARENT, FORMAT, BINDINGS) [PARENT addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:(FORMAT) options:0 metrics:nil views:BINDINGS]]

// Stretch across axes
#define STRETCH_VIEW_H(PARENT, VIEW) CONSTRAIN(PARENT, VIEW, @"H:|["#VIEW"(>=0)]|")
#define STRETCH_VIEW_V(PARENT, VIEW) CONSTRAIN(PARENT, VIEW, @"V:|["#VIEW"(>=0)]|")
#define STRETCH_VIEW(PARENT, VIEW) {STRETCH_VIEW_H(PARENT, VIEW); STRETCH_VIEW_V(PARENT, VIEW);}

// Center along axes
#define CENTER_VIEW_H(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]]
#define CENTER_VIEW_V(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]]
#define CENTER_VIEW(PARENT, VIEW) {CENTER_VIEW_H(PARENT, VIEW); CENTER_VIEW_V(PARENT, VIEW);}

// Align to parent
#define ALIGN_VIEW_LEFT(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]]
#define ALIGN_VIEW_RIGHT(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]]
#define ALIGN_VIEW_TOP(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]]
#define ALIGN_VIEW_BOTTOM(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]]

// Set Size
#define CONSTRAIN_WIDTH(VIEW, WIDTH) CONSTRAIN(VIEW, VIEW, @"H:["#VIEW"(=="#WIDTH")]")
#define CONSTRAIN_HEIGHT(VIEW, HEIGHT) CONSTRAIN(VIEW, VIEW, @"V:["#VIEW"(=="#HEIGHT")]")
#define CONSTRAIN_SIZE(VIEW, HEIGHT, WIDTH) {CONSTRAIN_WIDTH(VIEW, WIDTH); CONSTRAIN_HEIGHT(VIEW, HEIGHT);}

// Set Aspect
#define CONSTRAIN_ASPECT(VIEW, ASPECT) [VIEW addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:VIEW attribute:NSLayoutAttributeHeight multiplier:(ASPECT) constant:0.0f]]

// Order items
#define CONSTRAIN_ORDER_H(PARENT, VIEW1, VIEW2) [PARENT addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:(@"H:["#VIEW1"]->=0-["#VIEW2"]") options:0 metrics:nil views:NSDictionaryOfVariableBindings(VIEW1, VIEW2)]]
#define CONSTRAIN_ORDER_V(PARENT, VIEW1, VIEW2) [PARENT addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:(@"V:["#VIEW1"]->=0-["#VIEW2"]") options:0 metrics:nil views:NSDictionaryOfVariableBindings(VIEW1, VIEW2)]]

#pragma mark - Defaults

// Defaults
#define DEFAULT_INT(_KEY_) [[NSUserDefaults standardUserDefaults] integerForKey:_KEY_]
#define DEFAULT_OBJ(_KEY_) [[NSUserDefaults standardUserDefaults] objectForKey:_KEY_]

#pragma mark - Util

// Bail with complaint
#define COMPLAIN_AND_BAIL(_COMPLAINT_, _ARG_) {NSLog(_COMPLAINT_, _ARG_); return;}
#define COMPLAIN_AND_BAIL_NIL(_COMPLAINT_, _ARG_) {NSLog(_COMPLAINT_, _ARG_); return nil;}

#pragma mark - Delegates and Controls

// Delegate
#define SAFE_PERFORM_WITH_ARG(THE_OBJECT, THE_SELECTOR, THE_ARG) (([THE_OBJECT respondsToSelector:THE_SELECTOR]) ? [THE_OBJECT performSelector:THE_SELECTOR withObject:THE_ARG] : nil)

// Controls
#define CALLBACK_VAL(_CONTROL_, _SELECTOR_) [_CONTROL_ addTarget:self action:_SELECTOR_ forControlEvents:UIControlEventValueChanged]
#define CALLBACK_PRESS(_CONTROL_, _SELECTOR_) [_CONTROL_ addTarget:self action:_SELECTOR_ forControlEvents:UIControlEventTouchUpInside]
#define SAFE_CALLBACK_VAL(_CONTROL_, _SELECTOR_) {if ([self respondsToSelector:_SELECTOR_]) CALLBACK_VAL(_CONTROL_, _SELECTOR_);}
#define SAFE_CALLBACK_PRESS(_CONTROL_, _SELECTOR_) {if ([self respondsToSelector:_SELECTOR_]) CALLBACK_PRESS(_CONTROL_, _SELECTOR_);}


