//
//  AddToDoViewController.h
//  ToDoApp
//
//  Created by ThanhLinh on 2/23/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToDoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
