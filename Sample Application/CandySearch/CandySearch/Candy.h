//
//  Candy.h
//  CandySearch
//
//  Created by Nicolas Martin on 7/5/12.
//  Copyright (c) 2012 University of Illinois at Urbana-Champaign. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Candy : NSObject {
    NSString *category;
    NSString *name;
}

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *name;

+ (id)candyOfCategory:(NSString*)category name:(NSString*)name;

@end
