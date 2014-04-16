//
//  Board.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Board.h"

@implementation Board

-(id) initWithSize:(int)Size
{
    self = [super init];
    
    return self;
}

- (BOOL)addCardAtIndex:(TileIndex)Index
{
    return false;
}

- (NSMutableArray*) Update:(SWIPE_DIRECTION)Direction
{
    return nil;
}

@end
