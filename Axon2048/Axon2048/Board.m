//
//  Board.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Board.h"

@implementation Board

NSMutableArray* _TileGrid;
int _Size;

-(id) initWithSize:(int)Size
{
    self = [super init];
    
    _Size = Size;
    
    _TileGrid = [[NSMutableArray alloc] initWithCapacity: Size];
    for (int i = 0; i < [_TileGrid count]; i++)
    {
        _TileGrid[i] = [[NSMutableArray alloc] initWithCapacity: Size];
        for (int j = 0; j < [_TileGrid[i] count]; i++)
        {
            TileIndex index;
            index.x = i;
            index.y = j;
            _TileGrid[i][j] = [[Tile alloc]initAtIndex:index];
        }
    }
    
    return self;
}

- (BOOL)addCardAtIndex:(TileIndex)Index
{
    Tile* tile = [self getTileAtIndex:Index];
    
    if (tile.Card != nil)
    {
        return false;
    }
    
    tile.Card = [[Card alloc] initWithValue:2 AndTile:tile];
    
    return true;
}

- (TileIndex) addCardAtRandomIndex
{
    TileIndex index;
    
    NSMutableArray* freeTiles = [self getEmptyTiles];
    
    if ([freeTiles count] == 0)
    {
        index.x = -1;
        index.y = -1;
        return index;
    }
    
    int random = arc4random() % [freeTiles count];
    
    Tile* tile = freeTiles[random];

    Card* newCard = [[Card alloc] initWithValue:2 AndTile:tile];
    
    tile.Card = newCard;
    
    return tile.Index;
}

- (NSMutableArray*) Update:(DIRECTION)Direction
{
    // TODO
    return nil;
}

-(Tile *)getTileAtIndex:(TileIndex)Index
{
    Tile* tile = nil;
    
    if ([self isTileIndexValid:Index])
    {
        return tile;
    }
    
    return _TileGrid[Index.x][Index.y];
}

// Private functions
-(BOOL) isTileIndexValid:(TileIndex)Index
{
    if (Index.x < 0 || Index.x > _Size || Index.y < 0 || Index.y > _Size)
    {
        return false;
    }
    
    return true;
}

-(NSMutableArray*) getEmptyTiles
{
    NSMutableArray* tileArray = [[NSMutableArray alloc] init];
    
    for (int x = 0; x < _Size; x++)
    {
        for (int y = 0; y < _Size; y++)
        {
            if ([_TileGrid[x][y] Card] == nil)
                 [tileArray addObject:_TileGrid[x][y]];
        }
    }
    
    return tileArray;
}

@end
