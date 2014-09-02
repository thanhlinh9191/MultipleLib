//
//  Money.m
//  
//
//  Created by ben on 7/23/13.
//
//

#import "Money.h"

@interface Money ()

@end

@implementation Money

+ (id)dollarWithAmount:(NSInteger)amount {
    return [[self alloc] initWithAmount:amount currency:@"USD"];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {
    self = [super init];
    if (self) {
        _amount = amount;
        _currency = currency;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%d %@", self.amount, self.currency];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[Money class]]) {
        Money *other = object;
        return self.amount == other.amount && [self.currency isEqualToString:other.currency];
    }
    
    return NO;
}

+ (id)euroWithAmount:(NSInteger)amount {
    return [[self alloc] initWithAmount:amount currency:@"EUR"];
}

- (Money *)times:(NSInteger)multiplier {
    return [[Money alloc] initWithAmount:self.amount * multiplier currency:self.currency];
}

@end
