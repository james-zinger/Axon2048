//
//  GameModel.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "Tileindex.h"
#import "Direction.h"
#import "Board.h"

@interface GameModel : NSObject

@property (readonly) Board* Board;

// Initalize the game model
- (void) startGame: (int) WithBoardSize;

// Updates the game model by one step
- (NSMutableArray*) UpdateWithDirection: (DIRECTION) Direction;

// Attempts to add a random tile to the board
- (TileIndex) addRandomCard;

// The singleton access to the game model
+ (GameModel*) Instance;

@end
