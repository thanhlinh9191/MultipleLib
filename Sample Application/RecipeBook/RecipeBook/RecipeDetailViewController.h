//
//  RecipeDetailViewController.h
//  RecipeBook
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
@interface RecipeDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *recipePhoto;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientTextView;
@property (strong,atomic) Recipe *recipe;
@end
