//
//  WeaponInputViewController.m
//  MathMonsters
//
//  Created by Transferred on 1/13/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "WeaponInputViewController.h"
#import "Weapon.h"

@interface WeaponInputViewController ()

@end

@implementation WeaponInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
-(IBAction)closeTapped
{
    //Notify the delegate if it exists.
    if (_delegate != nil) {
        [_delegate closeTapped];
    }
}

-(IBAction)weaponButtonTapped:(UIButton *)sender
{
    //Create a variable to hold the selected weapon type.
    WeaponType selectedWeaponType;
    
    //Set the selected weapon based on the button that was pressed.
    if (sender == _blowgunButton) {
        selectedWeaponType = Blowgun;
    } else if (sender == _fireButton) {
        selectedWeaponType = Fire;
    } else if (sender == _ninjaStarButton) {
        selectedWeaponType = NinjaStar;
    } else if (sender == _smokeButton) {
        selectedWeaponType = Smoke;
    } else if (sender == _swordButton) {
        selectedWeaponType = Sword;
    } else {
        NSLog(@"Oops! Unhandled button click.");
    }
    
    //Notify the delegate of the selection, if it exists.
    if (_delegate != nil) {
        [_delegate selectedWeaponType:selectedWeaponType];
    }
}

@end
