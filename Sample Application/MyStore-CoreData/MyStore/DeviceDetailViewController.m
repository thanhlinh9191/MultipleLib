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
