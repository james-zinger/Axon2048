//
//  Card.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Card.h"



@implementation Card

- (id) initWithValue:(int)Value
{
    self = [super init];

    _Value = Value;
    
    _Tile = nil;
    
    return self;
}

- (id) initWithValue:(int)Value AndTile:(Tile *)Tile
{
    self = [super init];
    
    _Value = Value;

    _Tile = Tile;
    
    return self;
}

- (void)doubleValue
{
    _Value *= 2;
}

@end
