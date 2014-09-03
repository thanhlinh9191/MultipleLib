//
//  AppDelegate.m
//  Favorite Things
//
//  Created by Matt Long on 5/11/10.
//  Copyright Skye Road Systems, Inc. 2010. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"


@interface AppDelegate (PrivateCoreDataStack)
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end


@implementation AppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize fetchedResultsController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Fetch the data to see if we ought to pre-populate
  NSError *error = nil;
  if (![[self fetchedResultsController] performFetch:&error]) {
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
  
  [self loadFavoriteThingsData];
  
  RootViewController *rootViewController = (RootViewController *)[navigationController topViewController];
  [rootViewController setManagedObjectContext:[self managedObjectContext]];
  
  [window addSubview:[navigationController view]];
  [window makeKeyAndVisible];
  return YES;
}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
  
  NSError *error = nil;
  if (managedObjectContext != nil) {
    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
      /*
       Replace this implementation with code to handle the error appropriately.
       
       abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
       */
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    } 
  }
}

#pragma mark -
#pragma mark Populate Data Store
- (void)loadFavoriteThingsData;
{
  if ([[fetchedResultsController fetchedObjects] count] > 0)
    return;
  
  NSManagedObject *favoriteThing = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteThing" inManagedObjectContext:[self managedObjectContext]];
  
  [favoriteThing setValue:@"MacBook Pro" forKey:@"thingName"];
  [favoriteThing setValue:@"A powerful computer that will burn your lap." forKey:@"thingDescription"];
  [favoriteThing setValue:[NSNumber numberWithInt:0] forKey:@"displayOrder"];
  
  favoriteThing = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteThing" inManagedObjectContext:[self managedObjectContext]];
  
  [favoriteThing setValue:@"iPad" forKey:@"thingName"];
  [favoriteThing setValue:@"That's a really big iPod!" forKey:@"thingDescription"];
  [favoriteThing setValue:[NSNumber numberWithInt:1] forKey:@"displayOrder"];

  favoriteThing = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteThing" inManagedObjectContext:[self managedObjectContext]];
  
  [favoriteThing setValue:@"iPhone" forKey:@"thingName"];
  [favoriteThing setValue:@"A computer that thinks it's a phone." forKey:@"thingDescription"];
  [favoriteThing setValue:[NSNumber numberWithInt:2] forKey:@"displayOrder"];
  
  favoriteThing = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteThing" inManagedObjectContext:[self managedObjectContext]];
  
  [favoriteThing setValue:@"iPod" forKey:@"thingName"];
  [favoriteThing setValue:@"Also known as the iPad nano." forKey:@"thingDescription"];
  [favoriteThing setValue:[NSNumber numberWithInt:3] forKey:@"displayOrder"];
    
  favoriteThing = [NSEntityDescription insertNewObjectForEntityForName:@"FavoriteThing" inManagedObjectContext:[self managedObjectContext]];
  
  [favoriteThing setValue:@"WWDC Ticket" forKey:@"thingName"];
  [favoriteThing setValue:@"It sold out in eight days this year, you know?" forKey:@"thingDescription"];
  [favoriteThing setValue:[NSNumber numberWithInt:4] forKey:@"displayOrder"];
  
  [managedObjectContext save:nil];
}

#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
  
  if (managedObjectContext != nil) {
    return managedObjectContext;
  }
  
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (coordinator != nil) {
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator: coordinator];
  }
  return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
  
  if (managedObjectModel != nil) {
    return managedObjectModel;
  }
  managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
  return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  
  if (persistentStoreCoordinator != nil) {
    return persistentStoreCoordinator;
  }
  
  NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"DataModel.sqlite"]];
  
  NSError *error = nil;
  persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
  if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
    /*
     Replace this implementation with code to handle the error appropriately.
     
     abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
     
     Typical reasons for an error here include:
     * The persistent store is not accessible
     * The schema for the persistent store is incompatible with current managed object model
     Check the error message to determine what the actual problem was.
     */
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }    
  
  return persistentStoreCoordinator;
}

#pragma mark -
#pragma mark Fetched results controller
- (NSFetchedResultsController *)fetchedResultsController
{  
  if (fetchedResultsController != nil) return fetchedResultsController;
  
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"FavoriteThing" inManagedObjectContext:[self managedObjectContext]];
  [fetchRequest setEntity:entity];
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"displayOrder" ascending:YES];
  NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];  
  [fetchRequest setSortDescriptors:sortDescriptors];
  
  NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
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


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
  return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
  
  [managedObjectContext release];
  [managedObjectModel release];
  [persistentStoreCoordinator release];
  
  [navigationController release];
  [window release];
  [super dealloc];
}


@end

