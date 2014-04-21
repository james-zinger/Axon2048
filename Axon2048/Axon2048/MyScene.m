//
//  MyScene.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "MyScene.h"
#import "GameplayViewController.h"
#import "GameModel.h"

@implementation MyScene

// Private members
GameModel* model;
int bestScore;
int currentScore;


-(id)initWithSize: ( CGSize )size
{
    if ( self = [super initWithSize: size] )
    {
        // Gesture detection for down swipe
        _swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector( handleSwipeDown: )];
        [_swipeDownGesture setDirection: UISwipeGestureRecognizerDirectionDown];
        [self.view addGestureRecognizer: _swipeDownGesture ];
        
        // Gesture detection for left swipe
        _swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector( handleSwipeLeft: )];
        [_swipeRightGesture setDirection: UISwipeGestureRecognizerDirectionLeft];
        [self.view addGestureRecognizer: _swipeLeftGesture ];
        
        // Gesture detection for right swipe
        _swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector( handleSwipeRight: )];
        [_swipeRightGesture setDirection: UISwipeGestureRecognizerDirectionRight];
        [self.view addGestureRecognizer: _swipeRightGesture ];
        
        // Gesture detection for up swipe
        _swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector( handleSwipeUp: )];
        [_swipeUpGesture setDirection: UISwipeGestureRecognizerDirectionUp];
        [self.view addGestureRecognizer: _swipeUpGesture ];
        
        // Set the initial scores to 0
        [_controller setBestScore: 0];
        //[self setBestScore: [model getLeaderboard[ 0 ]]];
        [_controller setCurrentScore: 0];
        
        
    }

    return self;
}

-(void)touchesBegan: ( NSSet * )touches withEvent: ( UIEvent * )event
{
    /* Called when a touch begins */
}

-(void)update: ( CFTimeInterval )currentTime
{
    /* Called before each frame is rendered */
}

-(void)handleSwipeDown: ( UISwipeGestureRecognizer* ) recognizer
{
    // TODO
}

-(void)handleSwipeLeft: ( UISwipeGestureRecognizer* ) recognizer
{
    // TODO
}

-(void)handleSwipeRight: ( UISwipeGestureRecognizer* ) recognizer
{
    // TODO
}

-(void)handleSwipeUp: ( UISwipeGestureRecognizer* ) recognizer
{
    // TODO
}

// Scoring
-(void)updateScore
{
    int currentScore = [model getScore];
    if ( currentScore > bestScore ) {
        [_controller setBestScore: currentScore];
    }
    [_controller setCurrentScore: currentScore];
}

// Animation
-( void )doMoveActions
{
    
}
-( void )doOtherActions
{
    
}

@end
