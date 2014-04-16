//
//  Card.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Tile.h"

@interface Card : NSObject

@property int Value;
@property (weak) Tile* Tile;

- (id) initWithValue: (int) Value;

- (id) initWithValue: (int) Value AndTile: (Tile*) Tile;

@end
