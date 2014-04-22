//
//  CardSprite.h
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-21.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "TileIndex.h"
#import "CardAction.h"

@interface CardSprite : NSObject

@property (nonatomic) int value;
@property (nonatomic) TileIndex index;
@property (strong, nonatomic) SKSpriteNode* node;
@property (strong, nonatomic) CardAction* cardAction;

-( void )setValueAndAppearance: ( int )value;
-( void )setIndexAndPosition: ( TileIndex )index;

@end
