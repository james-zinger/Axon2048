//
//  CardSprite.m
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-21.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "CardSprite.h"

@implementation CardSprite


// Private members

static NSMutableDictionary* _images = nil;


// Static load images function

+( void )loadImages
{
    _images = [[NSMutableDictionary alloc] initWithCapacity:11];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-2.png"] forKey: [NSNumber numberWithInt: 2]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-4.png"] forKey: [NSNumber numberWithInt: 4]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-8.png"] forKey: [NSNumber numberWithInt: 8]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-16.png"] forKey: [NSNumber numberWithInt: 16]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-32.png"] forKey: [NSNumber numberWithInt: 32]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-64.png"] forKey: [NSNumber numberWithInt: 64]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-128.png"] forKey: [NSNumber numberWithInt: 128]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-256.png"] forKey: [NSNumber numberWithInt: 256]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-512.png"] forKey: [NSNumber numberWithInt: 512]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-1024.png"] forKey: [NSNumber numberWithInt: 1024]];
    [_images setObject: [SKTexture textureWithImageNamed: @"Tile-2048.png"] forKey: [NSNumber numberWithInt: 2048]];
}


// Init

-( id )init
{
    self = [super init];
    
    if ( _images == nil )
    {
        [CardSprite loadImages];
    }
    
    // Initialize to starting value and appearance
    self.value = 2;
    self.node = [SKSpriteNode spriteNodeWithTexture: [_images objectForKey: [NSNumber numberWithInt: 2]]];
    self.cardAction = nil;
    
    return self;
}


// Utilities

-( void )setValueAndAppearance: ( int )value
{
    SKTexture* image = [_images objectForKey: [NSNumber numberWithInt: value]];
    if ( image == nil )
    {
        [NSException raise: @"No image at that key." format: @"No card image for the given key exists at value %d.", value];
    }
    else
    {
        // Set the value and texture
        self.value = value;
        self.node.texture = image;
    }
}

-( void )setIndexAndPosition: ( TileIndex *)index
{
    self.index = index;
    //self.node.position = CGPointMake(0,0);
    self.node.position = CGPointMake( 40 + 80 * index.x, 48 + 40 + 80 * ( 3 - index.y ) );
}

@end
