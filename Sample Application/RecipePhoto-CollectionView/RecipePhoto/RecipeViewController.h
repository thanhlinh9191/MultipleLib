//
//  RecipeViewController.h
//  RecipePhoto
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
- (IBAction)close:(id)sender;
@property (strong, atomic) NSString* recipeImageName;
@end
