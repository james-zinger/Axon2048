//
//  GameModel.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "TileIndex.h"
#import "Direction.h"
#import "Board.h"

@interface GameModel : NSObject

@property (readonly) Board* Board;

// Updates the game model by one step
- (NSMutableArray*) UpdateWithDirection: (DIRECTION) Direction;

// Attempts to add a random tile to the board
- (TileIndex) addRandomCard;

// Gets the score of the current game
- (int) getScore;

// Gets te array of ints for the leader board
- (NSMutableArray*) getLeaderboard;

// Signal the game model to close
- (void) applicationClosing;

- (void) startWithSize: (int) Size;

// The singleton access to the game model
+ (GameModel*) Instance;

@end
