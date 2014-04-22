//
//  Tile.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Direction.h"
#import "TileIndex.h"
#import "Card.h"

@interface Tile : NSObject

@property Card* Card;
@property TileIndex* Index;

- (id) initAtIndex: (TileIndex*) Index;

- (Tile*) getNeightbourInDirection: (DIRECTION) Direction;

@end
