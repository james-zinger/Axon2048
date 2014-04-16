//
//  GameModel.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "TileIndex.h"

typedef enum {
    UP = 0,
    DOWN,
    LEFT,
    RIGHT
} SWIPE_DIRECTION;

@interface GameModel : NSObject

- (void) startGame: (int) withBoardSize;

- (NSMutableArray*) Update: (SWIPE_DIRECTION) withDirection;

- (TileIndex) addRandomTile;

// The singleton access to the game model
+ (GameModel*) Instance;

@end
