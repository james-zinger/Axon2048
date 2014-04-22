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
    
    _Board = nil;
    
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
    if (![self isBoardInitalized])
        [NSException raise:@"Board is not initalized" format:@"Value of board is nil"];
    
    return [_Board addCardAtRandomIndex];
}

- (int) getScore
{
    if (![self isBoardInitalized])
        [NSException raise:@"Board is not initalized" format:@"Value of board is nil"];

    return [_Board score];
}

- (NSMutableArray*) getLeaderboard
{
    return [_leaderboard getLeaderboard];
}

- (void) applicationClosing
{
    [_leaderboard saveLeaderboard];
}

- (void) startWithSize:(int)Size
{
    if ([self isBoardInitalized])
        _Board = nil;
    
    _Board = [[Board alloc] initWithGridSize:Size];
}

// Pirvate functions

- (BOOL) isBoardInitalized
{
    return (_Board != nil);
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
