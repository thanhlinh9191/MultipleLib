//
//  AppDelegate.h
//  Favorite Things
//
//  Created by Matt Long on 5/11/10.
//  Copyright Skye Road Systems, Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : NSObject <UIApplicationDelegate, NSFetchedResultsControllerDelegate> {
  
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectContext *managedObjectContext;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  
  UIWindow *window;
  UINavigationController *navigationController;
  NSFetchedResultsController *fetchedResultsController;
}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (NSString *)applicationDocumentsDirectory;
- (void)loadFavoriteThingsData;

@end

