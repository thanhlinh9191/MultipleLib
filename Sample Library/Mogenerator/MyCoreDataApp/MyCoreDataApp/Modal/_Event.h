// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Event.h instead.

#import <CoreData/CoreData.h>


extern const struct EventAttributes {
} EventAttributes;

extern const struct EventRelationships {
} EventRelationships;

extern const struct EventFetchedProperties {
} EventFetchedProperties;



@interface EventID : NSManagedObjectID {}
@end

@interface _Event : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EventID*)objectID;






@end

@interface _Event (CoreDataGeneratedAccessors)

@end

@interface _Event (CoreDataGeneratedPrimitiveAccessors)


@end
