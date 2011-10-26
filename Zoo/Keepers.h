//
//  Keepers.h
//  Zoo
//
//  Created by Ben Smith on 26/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Animals;

@interface Keepers : NSManagedObject

@property (nonatomic, retain) UNKNOWN_TYPE startDateEmployment;
@property (nonatomic, retain) UNKNOWN_TYPE pay;
@property (nonatomic, retain) UNKNOWN_TYPE name;
@property (nonatomic, retain) UNKNOWN_TYPE animalExpertise;
@property (nonatomic, retain) Animals *animals;

@end
