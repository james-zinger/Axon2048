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
    NSArray* scores = [model retrieveLeaderboard];
    
    // Fill the leaderboard labels with content
    _leader01Label.text = [@"1)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 0] integerValue]]];
    _leader02Label.text = [@"2)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 1] integerValue]]];
    _leader03Label.text = [@"3)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 2] integerValue]]];
    _leader04Label.text = [@"4)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 3] integerValue]]];
    _leader05Label.text = [@"5)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 4] integerValue]]];
    _leader06Label.text = [@"6)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 5] integerValue]]];
    _leader07Label.text = [@"7)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 6] integerValue]]];
    _leader08Label.text = [@"8)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 7] integerValue]]];
    _leader09Label.text = [@"9)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 8] integerValue]]];
    _leader10Label.text = [@"10)\t\t" stringByAppendingString: [NSString stringWithFormat: @"%d", [(NSNumber*)[scores objectAtIndex: 9] integerValue]]];
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
