//
//  Leaderboard.h
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-21.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Leaderboard : NSObject

- (NSMutableArray*) getLeaderboard;

- (void) addEntry: (int) score;

- (void) saveLeaderboard;

@end
