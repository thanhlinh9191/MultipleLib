//
//  Weapon.m
//  MathMonsters
//
//  Created by Transferred on 1/13/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon

+(Weapon *)newWeaponOfType:(WeaponType)weaponType
{
    Weapon *weapon = [[Weapon alloc] init];
    weapon.weaponType = weaponType;
    
    return weapon;
}

-(UIImage *)weaponImage
{
    switch (self.weaponType) {
        case Blowgun:
            return [UIImage imageNamed:@"blowgun.png"];
            break;
        case Fire:
            return [UIImage imageNamed:@"fire.png"];
            break;
        case NinjaStar:
            return [UIImage imageNamed:@"ninjastar.png"];
            break;
        case Smoke:
            return [UIImage imageNamed:@"smoke.png"];
            break;
        case Sword:
            return [UIImage imageNamed:@"sword.png"];
        default:
            //Anything not named in the enum.
            return nil;
            break;
    }
}

@end
