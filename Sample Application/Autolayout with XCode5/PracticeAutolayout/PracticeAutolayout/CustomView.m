//
//  CustomView.m
//  PracticeAutolayout
//
//  Created by csnguyen on 5/22/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (void)setMySize:(CGSize)mySize {
    _mySize = mySize;
    [self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize {
    return self.mySize;
}
@end
