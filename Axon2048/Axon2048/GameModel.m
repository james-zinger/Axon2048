//
//  GameModel.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

bool isInitalized = NO;

// Start the game with a board of the size specified
- (void)startGame:(int)WithBoardSize
{
    _Board = [[Board alloc] initWithSize:3];
    isInitalized = YES;
}

// Update the game model by one step
- (NSMutableArray*) UpdateWithDirection:(DIRECTION)Direction
{
    if (!isInitalized)
    {
        printf("Cannot update if the game is not initalized");
        return nil;
    }
    
    return [_Board Update:Direction];
}

// Adds a random tile
- (TileIndex) addRandomCard
{
    return [_Board addCardAtRandomIndex];
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
