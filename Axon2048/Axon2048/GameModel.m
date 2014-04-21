//
//  GameModel.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameModel.h"
#import "Leaderboard.h"
@implementation GameModel

Leaderboard* _leaderboard;

-(id) init
{
    self = [super init];
    
    _Board = [[Board alloc] initWithSize:4];
    
    _leaderboard = [[Leaderboard alloc] init];
    
    return self;
}

// Update the game model by one step
- (NSMutableArray*) UpdateWithDirection:(DIRECTION)Direction
{
    return [_Board Update:Direction];
}

// Adds a random tile
- (TileIndex) addRandomCard
{
    return [_Board addCardAtRandomIndex];
}

- (int) getScore
{
    return [_Board getScore];
}

- (NSMutableArray*) getLeaderboard
{
    
    return nil;
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
