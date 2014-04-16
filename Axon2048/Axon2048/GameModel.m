//
//  GameModel.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

// Start the game with a board of the size specified
- (void)startGame:(int)withBoardSize
{
    
}

- (NSMutableArray*) Update:(SWIPE_DIRECTION)withDirection
{
    
    return nil;
}

- (TileIndex) addRandomTile
{
    TileIndex index;
    index.x = -1;
    index.y = -1;
    
    return index;
}

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
