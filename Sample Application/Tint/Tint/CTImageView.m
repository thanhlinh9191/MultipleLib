//
//  CTImageView.m
//  Tint
//
//  Created by Steven Beyers on 9/4/13.
//  Copyright (c) 2013 CapTech. All rights reserved.
//

#import "CTImageView.h"

@implementation CTImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
}

@end
