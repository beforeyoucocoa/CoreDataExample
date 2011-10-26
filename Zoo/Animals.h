//
//  Animals.h
//  Zoo
//
//  Created by Ben Smith on 26/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Animals : NSManagedObject

@property (nonatomic, retain) UNKNOWN_TYPE food;
@property (nonatomic, retain) UNKNOWN_TYPE specificMarkings;
@property (nonatomic, retain) UNKNOWN_TYPE name;
@property (nonatomic, retain) UNKNOWN_TYPE type;
@property (nonatomic, retain) UNKNOWN_TYPE DOB;
@property (nonatomic, retain) NSSet *keeper;
@end

@interface Animals (CoreDataGeneratedAccessors)

- (void)addKeeperObject:(NSManagedObject *)value;
- (void)removeKeeperObject:(NSManagedObject *)value;
- (void)addKeeper:(NSSet *)values;
- (void)removeKeeper:(NSSet *)values;
@end
