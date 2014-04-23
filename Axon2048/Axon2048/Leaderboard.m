    // Trim the list to length and store the final array as the new leaderboard
//
//  Leaderboard.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-21.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "Leaderboard.h"

@implementation Leaderboard


// Constants

const int NUMBER_OF_ENTRIES = 10;


// Private members

NSArray* _entries;
NSRange _range;


// Init

-( id ) init
{
    self = [super init];
    
    // Initialize the leaderboard array
    _entries = [[NSArray alloc] init];
    
    // Configure the range of the leaderboard -- used in addEntry to trim the list to n elements.
    _range.location = 0;
    _range.length = NUMBER_OF_ENTRIES;
    
    // Load in the leaderboard as stored to the device's preferences
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    NSData* data = [prefs dataForKey: @"Leaderboard"];
    _entries = ( NSArray* )data;
    
    if (_entries == nil)
        _entries = [[NSArray alloc] init];
    
    // If the data provided by the leaderboard has less than NUMBER_OF_ENTRIES, pad it with zeroes and resave it.
    if ( [_entries count] < NUMBER_OF_ENTRIES )
    {
        while ( [_entries count] < NUMBER_OF_ENTRIES )
        {
            [self addEntry: 0];
        }
        [self saveLeaderboard];
    }
	
    return self;
}


// Utilities

-( NSArray* ) retrieveLeaderboard
{
    return _entries;
}

-( void ) saveLeaderboard
{
    // Store the leaderboard to the device's preferences
    NSUserDefaults* prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject: _entries forKey: @"Leaderboard"];
}

-( void )addEntry: ( int )score
{
    // Add the new score to the leaderboard and get the resulatant mutated array back
    NSArray* newArray = [_entries arrayByAddingObject: [NSNumber numberWithInt: score]];
    
    // Sort the data in descending order, and get the resultant mutated array back
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey: nil ascending: NO selector: @selector( localizedCompare: )];
    NSArray* sortedArray = [newArray sortedArrayUsingDescriptors:[NSArray arrayWithObject: sortDescriptor]];
    
    // Trim the list to length and store the final array as the new leaderboard
    if ([sortedArray count] <= NUMBER_OF_ENTRIES)
        _entries = sortedArray;
    else
        _entries = [sortedArray subarrayWithRange: _range];
}
                                        
@end
