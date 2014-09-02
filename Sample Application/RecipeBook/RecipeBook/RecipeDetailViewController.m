//
//  RecipeDetailViewController.m
//  RecipeBook
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController
@synthesize recipe;
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
    self.title= self.recipe.name;
    self.recipePhoto.image=[UIImage imageNamed:self.recipe.imageFile];
    self.prepTimeLabel.text=self.recipe.prepTime;
    NSMutableString *ingredientString = [[NSMutableString alloc] init];
    for(NSString *string in self.recipe.ingredients){
        [ingredientString appendFormat:@"%@\n",string];
    }
    self.ingredientTextView.text=ingredientString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
