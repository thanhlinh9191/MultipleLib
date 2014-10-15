//
//  WeaponSelectorImageView.m
//  MathMonsters
//
//  Created by Transferred on 1/13/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "WeaponSelectorImageView.h"
#import "Weapon.h"

@implementation WeaponSelectorImageView

#pragma mark - Overridden setters
-(void)setWeapon:(Weapon *)weapon
{
    //First make sure we're actually changing the weapon
    if (_weapon != weapon) {
        _weapon = weapon;
        
        //Update our image to use the weapon's image.
        self.image = [_weapon weaponImage];
    }
}

#pragma mark - Superclass overrides
-(BOOL)canBecomeFirstResponder
{
    //Says that this view can show an input view.
    return YES;
}

-(UIView *)inputView
{
    //Make sure the weaponInputController exists, and if not, create it.
    if (_weaponInputController == nil) {
        _weaponInputController = [[WeaponInputViewController alloc] initWithNibName:nil bundle:nil];
        _weaponInputController.delegate = self;
    }
    
    //Return the WeaponInputController's view as the input view.
    return _weaponInputController.view;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Show the input view as soon as the imageView is touched, if it
    //is not already showing.
    if (![self isFirstResponder]) {
        [self becomeFirstResponder];
    }
}


#pragma mark - WeaponInputDelegate methods
-(void)closeTapped
{
    //Dismiss the input view.
    [self resignFirstResponder];
}

-(void)selectedWeaponType:(WeaponType)weaponType
{
    //Set the instance variable.
    [self setWeapon:[Weapon newWeaponOfType:weaponType]];
    
    //Dismiss the input view.
    [self resignFirstResponder];
    
    //Notify the delegate of the change if it exists.
    if (_delegate != nil) {
        [_delegate selectedWeapon:_weapon];
    }
}

@end
