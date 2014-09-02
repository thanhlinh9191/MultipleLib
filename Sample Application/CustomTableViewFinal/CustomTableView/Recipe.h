//
//  Recipe.h
//  RecipeBook
//
//  Created by Simon on 12/8/12.
//
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *name; // name of recipe
@property (nonatomic, strong) NSString *detail; // recipe detail
@property (nonatomic, strong) NSString *imageFile; // image filename of recipe

@end
