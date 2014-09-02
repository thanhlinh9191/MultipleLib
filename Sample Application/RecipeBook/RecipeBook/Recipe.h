//
//  Recipe.h
//  RecipeBook
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject
@property (strong, atomic) NSString *name;
@property (strong,atomic) NSString  *prepTime;
@property  (strong, atomic) NSString *imageFile;
@property (strong,atomic) NSArray *ingredients;
@end
