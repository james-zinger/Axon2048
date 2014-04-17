//
//  Board.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Board.h"
#import "Cardaction.h"

@implementation Board

NSMutableArray* _Cards;
NSMutableArray* _TileGrid;
int _Size;

-(id) initWithSize:(int)Size
{
    self = [super init];
    
    _Score = 0;
    
    _Size = Size;
    
    _TileGrid = [[NSMutableArray alloc] initWithCapacity: Size];
    for (int i = 0; i < Size; i++)
    {
        [_TileGrid addObject:[[NSMutableArray alloc] initWithCapacity: Size]];
        for (int j = 0; j < Size; j++)
        {
            
            TileIndex index;
            index.x = i;
            index.y = j;
            _TileGrid[i][j] = [[Tile alloc]initAtIndex:index];
        }
    }
    
    _Cards = [[NSMutableArray alloc] initWithCapacity:Size*Size];
    
    return self;
}

- (BOOL)addCardAtIndex:(TileIndex)Index
{
    Tile* tile = [self getTileAtIndex:Index];
    
    if (tile.Card != nil)
    {
        return false;
    }
    
    Card* card = [[Card alloc] initWithValue:2 AndTile:tile];
    
    [_Cards addObject:card];
    
    tile.Card = card;
    
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
    
    [_Cards addObject:newCard];
    
    tile.Card = newCard;
    
    return tile.Index;
}

- (BOOL) checkForValue:(int)Value
{
    for (int i = 0; i < _Cards.count; i++)
    {
        Card* card = _Cards[i];
        
        if (card.Value == Value)
            return  true;
    }
    
    return false;
}

- (NSMutableArray*) Update:(DIRECTION)Direction
{
    NSMutableArray* array;
    
    switch (Direction) {
        case UP:
            array = [self UpdateUp];
            break;
        
        case DOWN:
            array = [self UpdateDown];
            break;
            
        case RIGHT:
            array = [self UpdateRight];
            break;
            
        case LEFT:
            array = [self UpdateLeft];
            break;
    }
    
    return array;
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

- (BOOL) isBoardFull
{
    return ([_Cards count] == _Size*_Size);
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

// Adds the two card values to the score sum
- (void) MergeCard: (Card*) Card1 WithCard: (Card*) Card2
{
    _Score += Card1.Value;
    _Score += Card2.Value;
}

// Update
// Forward   0    -  Size
// Backward Size  -  0
// Row - X
// Col - Y

// Updates the gamestate based on an upward flick
- (NSMutableArray*) UpdateUp
{
    NSMutableArray* changes = [[NSMutableArray alloc] init];
 
    // Row Forward
    // Col Forward
    for (int x = 0; x < _Size; x++)
    {
        for (int y = 0; y < _Size; y++)
        {
            Tile* tile = _TileGrid[x][y];
            if ([tile Card] == nil)
                continue;
            
            
            Tile* tileContext = [tile getNeightbourInDirection: UP];
            if (tileContext == nil)
                continue;
            
            [self ResolveTile:tile WithTile:tileContext ActionCollection:changes];
        }
    }
    
    return changes;
}

// Updates the gamestate based on an upward flick
- (NSMutableArray*) UpdateDown
{
    NSMutableArray* changes = [[NSMutableArray alloc] init];
    
    // Row Backward
    // Col Forward
    for (int x = _Size - 1; x < 0; x--)
    {
        for (int y = 0; y < _Size; y++)
        {
            Tile* tile = _TileGrid[x][y];
            if ([tile Card] == nil)
                continue;
            
            
            Tile* tileContext = [tile getNeightbourInDirection: DOWN];
            if (tileContext == nil)
                continue;
            
            [self ResolveTile:tile WithTile:tileContext ActionCollection:changes];
        }
    }
    
    return changes;
}

// Updates the game state based on a left ward swipe
- (NSMutableArray*) UpdateLeft
{
    NSMutableArray* changes = [[NSMutableArray alloc] init];
    
    // Col Forward
    // Row Forward
    for (int y = 0; y < _Size; y++)
    {
        for (int x = 0; x < _Size; x++)
        {
            Tile* tile = _TileGrid[x][y];
            if ([tile Card] == nil)
                continue;
            
            Tile* tileContext = [tile getNeightbourInDirection: LEFT];
            if(tileContext == nil)
                continue;
            
            [self ResolveTile:tile WithTile:tileContext ActionCollection:changes];
        }
    }
    
    return changes;
}

// Updates the gamestate based on a rightward flick
- (NSMutableArray*) UpdateRight
{
    NSMutableArray* changes = [[NSMutableArray alloc] init];
   
    //Col Backward
    //Row Forward
    for (int y = _Size - 1; y < 0; y--)
    {
        for (int x = 0; x < _Size; x++)
        {
            Tile* tile = _TileGrid[x][y];
            if ([tile Card] == nil)
                continue;
            
            Tile* tileContext = [tile getNeightbourInDirection: RIGHT];
            if (tileContext == nil)
                continue;
            
            [self ResolveTile:tile WithTile:tileContext ActionCollection:changes];
            
        }
    }
    
    return changes;
}

- (void) ResolveTile: (Tile*) tile1 WithTile: (Tile*) tile2 ActionCollection: (NSMutableArray*) changes
{
    Card* card = [tile1 Card];
    Card* targetCard = [tile2 Card];
    
    // Move up one index
    if ( targetCard == nil)
    {
        
        card.Tile = tile2;
        tile1.Card = nil;
        
        CardAction* action  = [[CardAction alloc] init];
        action.lookupIndex  = tile1.Index;
        action.shouldDelete = NO;
        action.newValue     = card.Value;
        action.newIndex     = tile2.Index;
        [changes addObject:action];

    }
    
    // Merge the two cards
    else if ([targetCard Value] == [card Value])
    {
        [self MergeCard:card WithCard:targetCard];
        
        [targetCard doubleValue];
        
        CardAction* action1  = [[CardAction alloc] init];
        action1.lookupIndex  = tile1.Index;
        action1.newIndex     = tile2.Index;
        action1.newValue     = card.Value;
        action1.shouldDelete = YES;
        [changes addObject:action1];
        
        tile1.Card = nil;
        [_Cards removeObject:card];
        
        CardAction* action2  = [[CardAction alloc]init];
        action2.lookupIndex  = tile2.Index;
        action2.newIndex     = tile2.Index;
        action2.newValue     = targetCard.Value;
        action2.shouldDelete = NO;
        [changes addObject:action2];
        
    }
}

@end
