//
//  Board.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TileIndex.h"
#import "Direction.h"
#import "Tile.h"

@interface Board : NSObject

@property (readonly) int score;

- (Tile*) getTileAtIndex:(TileIndex)Index;

- (BOOL) addCardAtIndex:(TileIndex)Index;

- (TileIndex) addCardAtRandomIndex;

- (id) initWithGridSize: (int) Size;

- (NSMutableArray*) Update:(DIRECTION) Direction;

@end
