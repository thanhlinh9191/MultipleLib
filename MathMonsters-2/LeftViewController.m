//
//  LeftViewController.m
//  MathMonsters
//
//  Created by Ellen Shapiro on 1/8/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "LeftViewController.h"
#import "Monster.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        //Initialize the array of monsters for display.
        _monsters = [NSMutableArray array];
        
        //Create monster objects then add them to the array.
        [_monsters addObject:[Monster newMonsterWithName:@"Cat-Bot" description:@"MEE-OW" iconName:@"meetcatbot.png" weapon:Sword]];
        [_monsters addObject:[Monster newMonsterWithName:@"Dog-Bot" description:@"BOW-WOW" iconName:@"meetdogbot.png" weapon:Blowgun]];
        [_monsters addObject:[Monster newMonsterWithName:@"Explode-Bot" description:@"Tick, tick, BOOM!" iconName:@"meetexplodebot.png" weapon:Smoke]];
        [_monsters addObject:[Monster newMonsterWithName:@"Fire-Bot" description:@"Will Make You Steamed" iconName:@"meetfirebot.png" weapon:NinjaStar]];
        [_monsters addObject:[Monster newMonsterWithName:@"Ice-Bot" description:@"Has A Chilling Effect" iconName:@"meeticebot.png" weapon:Fire]];
        [_monsters addObject:[Monster newMonsterWithName:@"Mini-Tomato-Bot" description:@"Extremely Handsome" iconName:@"meetminitomatobot.png" weapon:NinjaStar]];        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_monsters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Monster *monster = _monsters[indexPath.row];
    cell.textLabel.text = monster.name;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Monster *selectedMonster = [_monsters objectAtIndex:indexPath.row];
    if (_delegate) {
        [_delegate selectedMonster:selectedMonster];
    }
}

@end