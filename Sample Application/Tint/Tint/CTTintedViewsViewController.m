//
//  CTTintedViewsViewController.m
//  Tint
//
//  Created by Steven Beyers on 8/26/13.
//  Copyright (c) 2013 CapTech. All rights reserved.
//

#import "CTTintedViewsViewController.h"

@interface CTTintedViewsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *renderingModeController;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CTTintedViewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // add the default image into the image view using the automatic rendering mode
    _imageView.image = [[UIImage imageNamed:@"apple-large.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // make sure the keyboard closes if we hit return on the keyboard
    [textField resignFirstResponder];
    return YES;
}

/// Executed when the button that says "Red" is tapped. If the tintColor for the view is red, clear the tintColor and if it is already cleared, set the tintColor to red.
- (IBAction)setViewRed:(id)sender {
    
    if (self.view.tintColor == [UIColor redColor]) {
        self.view.tintColor = nil;
    } else {
        self.view.tintColor = [UIColor redColor];
    }
}

/// Executed when the button that says "Blue" is tapped. If the tintColor for the calling button is blue, clear the tintColor of the view and the barTintColor of the tab bar controller, otherwise set the tintColor of the button and the barTintColor of the tab bar to blue
- (IBAction)setViewBlue:(id)sender {
    if (((UIButton *)sender).tintColor == [UIColor blueColor]) {
        ((UIButton *)sender).tintColor = nil;
        self.tabBarController.tabBar.barTintColor = nil;
    } else {
        ((UIButton *)sender).tintColor = [UIColor blueColor];
        self.tabBarController.tabBar.barTintColor = [UIColor blueColor];
    }
}

/// Handle changing the value of the segmented view controller.
- (IBAction)toggled:(id)sender {
    // start with using automatic as the default rendering mode.
    UIImageRenderingMode renderingMode = UIImageRenderingModeAutomatic;
    
    switch (_renderingModeController.selectedSegmentIndex) {
        case 1:
            // if we have moved to the segment in position 1 (center segment) use the "original" rendering mode
            renderingMode = UIImageRenderingModeAlwaysOriginal;
            break;
        case 2:
            // if we have moved to the segment in position 2 (right sigment) use the template rendering mode
            renderingMode = UIImageRenderingModeAlwaysTemplate;
            
        default:
            break;
    }
    
    // set the image in the image view by using the image that is already in the image view but assigning a new rendering mode.
    _imageView.image = [_imageView.image imageWithRenderingMode:renderingMode];
}


// Executed every time the stepper control changes value
- (IBAction)stepperDidStep:(id)sender {
    // Show an alert indicating that the stepper value has been modified.
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo Message" message:@"Stepper value changed!" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
