//
//  CTButtonControlledViewController.m
//  Tint
//
//  Created by Steven Beyers on 8/19/13.
//  Copyright (c) 2013 CapTech. All rights reserved.
//

#import "CTButtonControlledViewController.h"

@interface CTButtonControlledViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CTButtonControlledViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // set the image  in the image view to use template mode.
    _imageView.image = [[UIImage imageNamed:@"captech_img"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
}

- (IBAction)setRedTint:(id)sender {
    // set the window's tent color to red
   // [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor redColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor greenColor], UITextAttributeTextColor, nil]
                                             forState:UIControlStateNormal];
[[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor greenColor]} forState:UIControlStateNormal];
    /*
    // this will generate a black tab bar
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
    // this will give selected icons and text your apps tint color
    tabBarController.tabBar.tintColor = appTintColor;  // appTintColor is a UIColor
     //or [[UITabBar appearance] setTintColor:[UIColor greenColor]];
 */
    //http://stackoverflow.com/questions/18688189/how-to-change-tab-bar-item-text-color
    /*[performanceItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaLTStd-Roman" size:10.0f], NSFontAttributeName,  [UIColor yellowColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
     
     [performanceItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaLTStd-Roman" size:10.0f], NSFontAttributeName,  [UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateHighlighted];
     */
    
    //http://stackoverflow.com/questions/11512783/unselected-uitabbar-color/18433996#18433996
    /*
     // set color of selected icons and text to red
     self.tabBar.tintColor = [UIColor redColor];
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor redColor], UITextAttributeTextColor, nil] forState:UIControlStateSelected];
     
     
     // set color of unselected text to green
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor greenColor], UITextAttributeTextColor, nil]
     forState:UIControlStateNormal];
     
     // set selected and unselected icons
     UITabBarItem *item0 = [self.tabBar.items objectAtIndex:0];
     
     // this way, the icon gets rendered as it is (thus, it needs to be green in this example)
     item0.image = [[UIImage imageNamed:@"unselected-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
     // this icon is used for selected tab and it will get tinted as defined in self.tabBar.tintColor
     item0.selectedImage = [UIImage imageNamed:@"selected-icon.png"];
     */
}

- (IBAction)setBlueTint:(id)sender {
    // set the window's tent color to blue
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor blueColor];
}

- (IBAction)setOrangeTint:(id)sender {
    // set the window's tent color to orange
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor orangeColor];
}

- (IBAction)setBlackTint:(id)sender {
    // set the window's tent color to black
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor blackColor];
}

- (IBAction)setPurpleTint:(id)sender {
    // set the window's tent color to purple
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor purpleColor];
}

- (IBAction)setGreenTint:(id)sender {
    // set the window's tent color to green
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor greenColor];
}

@end
