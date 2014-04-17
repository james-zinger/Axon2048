//
//  Board.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Tileindex.h"
#import "Direction.h"
#import "Tile.h"

@interface Board : NSObject

- (Tile*) getTileAtIndex:(TileIndex)Index;

- (BOOL) addCardAtIndex:(TileIndex)Index;

- (TileIndex) addCardAtRandomIndex;

- (id) initWithSize: (int) Size;

- (int) getScore;

- (NSMutableArray*) Update:(DIRECTION) Direction;

@end
