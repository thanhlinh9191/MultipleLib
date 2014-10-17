//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import "DeviceDetailViewController.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //fix for status bar overlaps view in ios 7
    //http://blog.ijasoneverett.com/2013/09/ios-7-bugs-the-status-bar-and-modal-view-controllers/
    float currentVersion = 7.0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= currentVersion)    {
        UIView *fixbar = [[UIView alloc] init];
        fixbar.frame = CGRectMake(0, 0, 320, 20);
        fixbar.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1]; // the default color of iOS7 bacground or any color suits your design
        [self.view addSubview:fixbar];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSManagedObjectContext*) managedObjectContext{
    NSManagedObjectContext *context=nil;
    id delegate =[[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity =  [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [entity setValue:self.nameTextField.text forKey:@"name"];
    [entity setValue:self.versionTextField.text forKey:@"version"];
    [entity setValue:self.companyTextField.text forKey:@"company"];
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Can't save %@: %@",error,error.localizedDescription);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
