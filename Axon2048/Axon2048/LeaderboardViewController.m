//
//  LeaderboardViewController.m
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-22.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "LeaderboardViewController.h"

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
    
    // Fill the leaderboard labels with content
    _leader01Label.text = [@"1) " stringByAppendingString: @"Get my score and put it here"];
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
