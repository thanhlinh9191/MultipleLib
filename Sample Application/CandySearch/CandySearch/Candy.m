//
//  Candy.m
//  CandySearch
//
//  Created by Nicolas Martin on 7/5/12.
//  Copyright (c) 2012 University of Illinois at Urbana-Champaign. All rights reserved.
//

#import "Candy.h"

@implementation Candy
@synthesize category;
@synthesize name;

+ (id)candyOfCategory:(NSString *)category name:(NSString *)name
{
    Candy *newCandy = [[self alloc] init];
    [newCandy setCategory:category];
    [newCandy setName:name];
    return newCandy;
}

@end

