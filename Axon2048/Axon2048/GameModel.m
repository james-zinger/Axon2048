//
//  GameModel.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameModel.h"

#include "Board.h"

@implementation GameModel

Board* board;
bool isInitalized = NO;

// Start the game with a board of the size specified
- (void)startGame:(int)WithBoardSize
{
    board = [[Board alloc] initWithSize:3];
    isInitalized = YES;
}

// Update the game model by one step
- (NSMutableArray*) UpdateWithDirection:(SWIPE_DIRECTION)Direction
{
    if (!isInitalized)
    {
        printf("Cannot update if the game is not initalized");
        return nil;
    }
    
    return [board Update:Direction];
}

// Adds a random tile
- (TileIndex) addRandomTile
{
    TileIndex index;
    index.x = -1;
    index.y = -1;
    
    return index;
}

// Singleton instance variable
static GameModel* instance = nil;

// Singleton method
+ (GameModel*) Instance
{
    if (instance == nil)
    {
        instance = [[GameModel alloc] init];
    }
    
    return instance;
}

@end
