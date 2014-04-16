//
//  Board.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "Tileindex.h"
#include "Direction.h"

@interface Board : NSObject

- (BOOL) addCardAtIndex:(TileIndex)Index;

- (id) initWithSize: (int) Size;

- (NSMutableArray*) Update:(SWIPE_DIRECTION) Direction;

@end
