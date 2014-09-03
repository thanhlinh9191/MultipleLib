//
//  CTButtonControlledViewController.m
//  Tint
//
//  Created by Steven Beyers on 8/19/13.
//  Copyright (c) 2013 CapTech. All rights reserved.
//

#import "CTButtonControlledViewController.h"
@interface UIImage(Overlay)
@end

@implementation UIImage(Overlay)

- (UIImage *)imageWithColor:(UIColor *)color1
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color1 setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
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
   [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor redColor];
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
     // set the selected colors
     [self.tabBarController.tabBar setTintColor:[UIColor whiteColor]];
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
     
     
     UIColor * unselectedColor = [UIColor colorWithRed:184/255.0f green:224/255.0f blue:242/255.0f alpha:1.0f];
     
     // set color of unselected text
     [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:unselectedColor, NSForegroundColorAttributeName, nil]
     forState:UIControlStateNormal];
     
     // generate a tinted unselected image based on image passed via the storyboard
     for(UITabBarItem *item in self.tabBarController.tabBar.items) {
     // use the UIImage category code for the imageWithColor: method
     item.image = [[item.selectedImage imageWithColor:unselectedColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     }
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
