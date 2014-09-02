//
//  RecipeCollectionViewController.h
//  RecipePhoto
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCollectionViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;

- (IBAction)shareButtonTouched:(id)sender;

@end
