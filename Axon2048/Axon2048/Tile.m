//
//  Tile.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Tile.h"

#import "Board.h"
#import "GameModel.h"

@implementation Tile

Board* _board;

- (id) init
{
    self = [super init];

    _Card = nil;
    
    TileIndex index;
    index.x = -1;
    index.y = -1;
    
    _Index = index;
    
    return self;
}

- (id) initAtIndex:(TileIndex)Index
{
    self = [super init];
    
    _Card = nil;

    _Index = Index;
    
    return self;
}

- (Tile*)getNeightbourInDirection:(DIRECTION)Direction
{
    Tile* tile = nil;
    TileIndex lookup;
    
    lookup.x = _Index.x;
    lookup.y = _Index.y;
    
    switch (Direction) {
        case UP:
            lookup.y = _Index.y - 1;
            break;
            
        case DOWN:
            lookup.y = _Index.y + 1;
            break;
         
        case RIGHT:
            lookup.x = _Index.x + 1;
            break;
            
        case LEFT:
            lookup.x = _Index.x - 1;
            break;
    }
    
    tile = [[self getBoard] getTileAtIndex:lookup];
    
    return tile;
}

- (Board*) getBoard
{
    if (_board == nil)
        _board = [[GameModel Instance] Board];

    return _board;
}
@end
