//
//  CoreDataInterface.m
//  Zoo
//
//  Created by Ben Smith on 26/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreDataInterface.h"

@implementation CoreDataInterface
/**
 * Add an animal to coredata
 * 
 */
- (void)addAnAnimal
{
    
}

#pragma mark -
#pragma mark managedObjectModel methods

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel 
{    
    if (managedObjectModel_ != nil)
        return managedObjectModel_;
    
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"DataModel" 
                                                          ofType:@"momd"];
    
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"DataModel.db"]];
    NSLog(@"Database location: %@",[storeURL absoluteString]);
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType 
                                                   configuration:nil 
                                                             URL:storeURL 
                                                         options:nil 
                                                           error:&error]) 
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }    
    
    return persistentStoreCoordinator_;
    
}

@end
