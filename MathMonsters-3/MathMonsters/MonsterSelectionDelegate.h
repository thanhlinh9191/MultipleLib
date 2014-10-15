//
//  MonsterSelectionDelegate.h
//  MathMonsters
//
//  Created by Ellen Shapiro on 1/12/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

@class Monster;

@protocol MonsterSelectionDelegate <NSObject>

@required
-(void)selectedMonster:(Monster *)newMonster;
@end
