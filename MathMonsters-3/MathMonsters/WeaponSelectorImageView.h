//
//  WeaponSelectorImageView.h
//  MathMonsters
//
//  Created by Transferred on 1/13/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeaponInputViewController.h" //Has delegate as well.
@class Weapon;

@protocol WeaponSelectorDelegate <NSObject>
-(void)selectedWeapon:(Weapon *)weapon;
@end

@interface WeaponSelectorImageView : UIImageView <WeaponInputDelegate>

@property (nonatomic, strong) Weapon *weapon;
@property (nonatomic, strong) WeaponInputViewController *weaponInputController;
@property (nonatomic, strong) IBOutlet id<WeaponSelectorDelegate> delegate;

@end
