//
//  Leaderboard.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-21.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Leaderboard.h"

@implementation Leaderboard

NSMutableArray* _leaderboard;

- (id) init
{
    self = [super init];
    
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
	NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
	NSData* data = [prefs dataForKey:@"Leaderboards"];
	_leaderboard = (NSMutableArray*) data;
	_leaderboard =
	
    return self;
}

- (NSMutableArray*) getLeaderboard
{
    return _leaderboard;
}

- (void) addEntry:(int)score
{
        [_leaderboard addObject:[NSNumber numberWithInt:score]];
}
                                        
@end
