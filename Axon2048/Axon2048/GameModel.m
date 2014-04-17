//
//  GameModel.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel


-(id) init
{
    self = [super init];
    
    _Board = [[Board alloc] initWithSize:4];
    
    return self;
}

// Update the game model by one step
- (NSMutableArray*) UpdateWithDirection:(DIRECTION)Direction
{
    return [_Board Update:Direction];
}

// Adds a random tile
- (TileIndex) AddRandomCard
{
    return [_Board addCardAtRandomIndex];
}

- (int) GetScore
{
    return [_Board Score];
}

- (BOOL) CheckLoseCondition
{
    return [_Board isBoardFull];
}

- (BOOL) CheckWinCondition
{
    return [_Board checkForValue:2048];
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
