//
//  Card.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tile;

@interface Card : NSObject

@property (readonly) int Value;
@property (weak) Tile* Tile;

- (id) initWithValue: (int) Value;

- (id) initWithValue: (int) Value AndTile: (Tile*) Tile;

- (void) doubleValue;

@end
