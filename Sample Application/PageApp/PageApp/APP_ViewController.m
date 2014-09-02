//
//  APP_ViewController.m
//  PageApp
//
//  Created by ThanhLinh on 2/23/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import "APP_ViewController.h"
#import "AppChildController.h"
@interface APP_ViewController ()

@end

@implementation APP_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.pageViewController=[[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource=self;
    [self.pageViewController.view setFrame:[self.view bounds]];
    
    AppChildController *child = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:child];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(AppChildController*) viewControllerAtIndex:(NSInteger) index{
    AppChildController *viewController =[[AppChildController alloc] initWithNibName:@"AppChildController" bundle:nil];
    viewController.index=index;
    return viewController;
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [(AppChildController*)viewController index];
    index++;
    if(index==5){
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
     NSInteger index = [(AppChildController*)viewController index];
    if(index==0){
        return nil;
    }
return  [self viewControllerAtIndex:--index];
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return 5;
}
-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}
@end
