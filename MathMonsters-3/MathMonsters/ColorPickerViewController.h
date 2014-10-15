//
//  ColorPickerViewController.h
//  MathMonsters
//
//  Created by Transferred on 1/12/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPickerDelegate <NSObject>
@required
-(void)selectedColor:(UIColor *)newColor;
@end

@interface ColorPickerViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *colorNames;
@property (nonatomic, weak) id<ColorPickerDelegate> delegate;
@end
