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

     NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
	_leaderboard = [prefs objectForKey:@"Leaderboard"];
	[self sortLeaderboard];
	return self;
}

- (NSMutableArray*) getLeaderboard
{
    return _leaderboard;
}

- (void) addEntry:(int)score
{
    [_leaderboard addObject:[NSNumber numberWithInt:score]];
    [self sortLeaderboard];
}

- (void) saveLeaderboard
{
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:_leaderboard forKey:@"Leaderboard"];
    [prefs synchronize];
}

//Private functions
- (void) sortLeaderboard
{
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
    [_leaderboard sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}
                                        
@end
