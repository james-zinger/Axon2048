//
//  LeaderboardViewController.m
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-22.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "LeaderboardViewController.h"
#import "GameModel.h"

@implementation LeaderboardViewController


// Init

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Set fonts for the leaderboard labels (this can't be done through XCode's UI)
    _leader01Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader02Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader03Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader04Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader05Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader06Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader07Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader08Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader09Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    _leader10Label.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 18];
    
    // Fetch the array of scores from the model
    GameModel* model = [GameModel Instance];
    NSMutableArray* scores = [model getLeaderboard];
    
    // Fill the leaderboard labels with content
    _leader01Label.text = [@"1)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 0]]];
    _leader02Label.text = [@"2)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 1]]];
    _leader03Label.text = [@"3)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 2]]];
    _leader04Label.text = [@"4)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 3]]];
    _leader05Label.text = [@"5)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 4]]];
    _leader06Label.text = [@"6)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 5]]];
    _leader07Label.text = [@"7)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 6]]];
    _leader08Label.text = [@"8)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 7]]];
    _leader09Label.text = [@"9)  " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 8]]];
    _leader10Label.text = [@"10) " stringByAppendingString: [NSString stringWithFormat: @"%d", (int)[scores objectAtIndex: 9]]];
}


// iOS Crazy Stuff

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
