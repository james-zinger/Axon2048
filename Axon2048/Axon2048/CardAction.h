//
//  CardAction.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TileIndex.h"

@interface CardAction : NSObject

@property (nonatomic) TileIndex*    lookupIndex;
@property (nonatomic) TileIndex*    updatedIndex;
@property             int           updatedValue;
@property             BOOL          shouldDelete;

@end
