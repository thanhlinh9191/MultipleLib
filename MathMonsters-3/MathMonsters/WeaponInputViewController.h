//
//  WeaponInputViewController.h
//  MathMonsters
//
//  Created by Transferred on 1/13/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weapon.h" //Provides access to the WeaponType enum.

@protocol WeaponInputDelegate <NSObject>
@required
-(void)selectedWeaponType:(WeaponType)weaponType;
-(void)closeTapped;
@end

@interface WeaponInputViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *blowgunButton;
@property (nonatomic, weak) IBOutlet UIButton *fireButton;
@property (nonatomic, weak) IBOutlet UIButton *ninjaStarButton;
@property (nonatomic, weak) IBOutlet UIButton *smokeButton;
@property (nonatomic, weak) IBOutlet UIButton *swordButton;
@property (nonatomic, weak) id<WeaponInputDelegate> delegate;

-(IBAction)weaponButtonTapped:(UIButton *)sender;
-(IBAction)closeTapped;
@end
