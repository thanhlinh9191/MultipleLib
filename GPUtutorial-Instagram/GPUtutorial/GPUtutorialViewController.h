//
//  GPUtutorialViewController.h
//  GPUtutorial
//
//  Created by Nick Barrowclough on 3/26/13.
//  Copyright (c) 2013 iSoftware Developers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "GPUtutorialCell.h"

@interface GPUtutorialViewController : UIViewController {
    NSMutableArray *filterNames;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *filtersTable;


@end
