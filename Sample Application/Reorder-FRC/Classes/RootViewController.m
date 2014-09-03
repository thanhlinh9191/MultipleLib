//
//  RootViewController.m
//  Favorite Things
//
//  Created by Matt Long on 5/11/10.
//  Copyright Skye Road Systems, Inc. 2010. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end


@implementation RootViewController

@synthesize fetchedResultsController, managedObjectContext;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"Favorite Things"];
  [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
  
  NSError *error = nil;
  if (![[self fetchedResultsController] performFetch:&error])
  {
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
  NSManagedObject *managedObject = [fetchedResultsController objectAtIndexPath:indexPath];
  [[cell textLabel] setText:[[managedObject valueForKey:@"thingName"] description]];
  [[cell detailTextLabel] setText:[[managedObject valueForKey:@"thingDescription"] description]];
  [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [[fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
  return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
  {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                   reuseIdentifier:@"Cell"] autorelease];
  }
  
  [self configureCell:cell atIndexPath:indexPath];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete)
  {
    NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
    [context deleteObject:[fetchedResultsController objectAtIndexPath:indexPath]];
    
    NSError *error = nil;
    if (![context save:&error])
    {
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    }
  }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
  return YES;
}

- (void)tableView:(UITableView *)tableView 
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
      toIndexPath:(NSIndexPath *)destinationIndexPath;
{  
  NSMutableArray *things = [[fetchedResultsController fetchedObjects] mutableCopy];
  
  // Grab the item we're moving.
  NSManagedObject *thing = [[self fetchedResultsController] objectAtIndexPath:sourceIndexPath];
  
  // Remove the object we're moving from the array.
  [things removeObject:thing];
  // Now re-insert it at the destination.
  [things insertObject:thing atIndex:[destinationIndexPath row]];
  
  // All of the objects are now in their correct order. Update each
  // object's displayOrder field by iterating through the array.
  int i = 0;
  for (NSManagedObject *mo in things)
  {
    [mo setValue:[NSNumber numberWithInt:i++] forKey:@"displayOrder"];
  }
  
  [things release], things = nil;
  
  [managedObjectContext save:nil];
}


#pragma mark -
#pragma mark Fetched results controller
- (NSFetchedResultsController *)fetchedResultsController
{
  if (fetchedResultsController) return fetchedResultsController;
  
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = 
               [NSEntityDescription entityForName:@"FavoriteThing" 
                           inManagedObjectContext:managedObjectContext];
  
  [fetchRequest setEntity:entity];
  
  NSSortDescriptor *sortDescriptor = 
              [[NSSortDescriptor alloc] initWithKey:@"displayOrder" 
                                          ascending:YES];
  
  NSArray *sortDescriptors = [[NSArray alloc] 
                              initWithObjects:sortDescriptor, nil];  
  [fetchRequest setSortDescriptors:sortDescriptors];
  
  NSFetchedResultsController *aFetchedResultsController = 
              [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                                  managedObjectContext:managedObjectContext
                                                    sectionNameKeyPath:nil cacheName:@"ThingsCache"];
  aFetchedResultsController.delegate = self;
  [self setFetchedResultsController:aFetchedResultsController];
  
  [aFetchedResultsController release];
  [fetchRequest release];
  [sortDescriptor release];
  [sortDescriptors release];
  
  return fetchedResultsController;
}    

- (void)dealloc {
  [fetchedResultsController release];
  [managedObjectContext release];
  [super dealloc];
}


@end

