//
//  CandyTableViewController.m
//  CandySearch
//
//  Created by Nicolas Martin on 7/5/12.
//  Copyright (c) 2012 University of Illinois at Urbana-Champaign. All rights reserved.
//

#import "CandyTableViewController.h"
#import "Candy.h"

@interface CandyTableViewController ()

@end

@implementation CandyTableViewController
@synthesize candyArray;
@synthesize filteredCandyArray;
@synthesize candySearchBar;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Don't show the scope bar or cancel button until editing begins
    [candySearchBar setShowsScopeBar:NO];
    [candySearchBar sizeToFit];
    
    // Hide the search bar until user scrolls up
    CGRect newBounds = [[self tableView] bounds];
    newBounds.origin.y = newBounds.origin.y + candySearchBar.bounds.size.height;
    [[self tableView] setBounds:newBounds];

    /*** Sample Data for candyArray ***/
    
    candyArray = [NSArray arrayWithObjects:
                  [Candy candyOfCategory:@"chocolate" name:@"chocolate bar"],
                  [Candy candyOfCategory:@"chocolate" name:@"chocolate chip"],
                  [Candy candyOfCategory:@"chocolate" name:@"dark chocolate"],
                  [Candy candyOfCategory:@"hard" name:@"lollipop"],
                  [Candy candyOfCategory:@"hard" name:@"candy cane"],
                  [Candy candyOfCategory:@"hard" name:@"jaw breaker"],
                  [Candy candyOfCategory:@"other" name:@"caramel"],
                  [Candy candyOfCategory:@"other" name:@"sour chew"],
                  [Candy candyOfCategory:@"other" name:@"peanut butter cup"],
                  [Candy candyOfCategory:@"other" name:@"gummi bear"], nil];
    
    // Initialize the filteredCandyArray with a capacity equal to the candyArray's capacity
    filteredCandyArray = [NSMutableArray arrayWithCapacity:[candyArray count]];
    
    // Reload the table
    [[self tableView] reloadData];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [filteredCandyArray count];
    }
	else
	{
        return [candyArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Create a new Candy Object
    Candy *candy = nil;
    
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        candy = [filteredCandyArray objectAtIndex:[indexPath row]];
    }
	else
	{
        candy = [candyArray objectAtIndex:[indexPath row]];
    }
    
    // Configure the cell
    [[cell textLabel] setText:[candy name]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Perform segue to candy detail
    [self performSegueWithIdentifier:@"candyDetail" sender:tableView];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString:@"candyDetail"] ) {
        UIViewController *candyDetailViewController = [segue destinationViewController];
        
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[filteredCandyArray objectAtIndex:[indexPath row]] name];
            [candyDetailViewController setTitle:destinationTitle];
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *destinationTitle = [[candyArray objectAtIndex:[indexPath row]] name];
            [candyDetailViewController setTitle:destinationTitle];
        }
        
    }
}

#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	// Update the filtered array based on the search text and scope.
	
    // Remove all objects from the filtered search array
	[self.filteredCandyArray removeAllObjects];
    
	// Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    NSArray *tempArray = [candyArray filteredArrayUsingPredicate:predicate];
    
    if(![scope isEqualToString:@"All"]) {
        // Further filter the array with the scope
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"SELF.category contains[c] %@",scope];
        tempArray = [tempArray filteredArrayUsingPredicate:scopePredicate];
    }
    
    filteredCandyArray = [NSMutableArray arrayWithArray:tempArray];
}


#pragma mark - UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark - Search Button

- (IBAction)goToSearch:(id)sender
{
    // If you're worried that your users might not catch on to the fact that a search bar is available if they scroll to reveal it, a search icon will help them
    // Note that if you didn't hide your search bar, you should probably not include this, as it would be redundant
    [candySearchBar becomeFirstResponder];
}



















@end
