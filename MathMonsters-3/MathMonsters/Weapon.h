//
//  Weapon.h
//  MathMonsters
//
//  Created by Transferred on 1/13/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Blowgun = 0,
    NinjaStar,
    Fire,
    Sword,
    Smoke,
} WeaponType;

@interface Weapon : NSObject

@property (nonatomic, assign) WeaponType weaponType;

//Factory method to make a new weapon object with a particular type.
+(Weapon *)newWeaponOfType:(WeaponType)weaponType;

//Convenience instance method to get the UIImage representing the weapon.
-(UIImage *)weaponImage;

@end
