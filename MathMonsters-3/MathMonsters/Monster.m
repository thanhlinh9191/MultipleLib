//
//  Monster.m
//  MathMonsters
//
//  Created by Ellen Shapiro on 1/8/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "Monster.h"

@implementation Monster

+(Monster *)newMonsterWithName:(NSString *)name description:(NSString *)description iconName:(NSString *)iconName weapon:(Weapon *)weapon
{
    Monster *monster = [[Monster alloc] init];
    monster.name = name;
    monster.description = description;
    monster.iconName = iconName;
    monster.weapon = weapon;
    
    return monster;
}

@end
