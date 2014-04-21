//
//  MyScene.m
//  Axon2048
//
//  Created by ZINGER JAMES J. on 2014-04-16.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameplayScene.h"
#import "GameplayViewController.h"
#import "GameModel.h"
#import "GameplayState.h"
#import "CardSprite.h"

@implementation GameplayScene


// Private members

GameplayViewController* _controller;
GameModel* _model;
GameplayState _state;
NSMutableArray* _actions;
NSMutableArray* _cardSprites;
int _bestScore;
int _currentScore;


// Init

-( void )startWithController: ( GameplayViewController* )controller
{
    // Set the controller reference
    _controller = controller;
    
    // Set the model reference and reset it so we start from scratch
    _model = GameModel.Instance;
    // [_model reset];
    
    // Set the initial gameplay state
    _state = BEGIN_TURN;
    
    // Set the initial scores to 0
    [_controller setBestScore: 0];
    [_controller setCurrentScore: 0];
    
    // Allocate memory for the card sprite grid
    _cardSprites = [[NSMutableArray alloc] initWithCapacity: 4];
    for (int row = 0; row < 4; row++)
    {
        [_cardSprites addObject:[[NSMutableArray alloc] initWithCapacity: 4]];
        for (int col = 0; col < 4; col++)
        {
            _cardSprites[ row ][ col ] = nil;
        }
    }
    
    // Add a random card to the card sprite grid
    [self addCardSprite: [_model addRandomCard]];
    
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
}


// Update

-( void )update: ( CFTimeInterval )currentTime
{
    switch ( _state )
    {
        case BEGIN_TURN:
            
            [self addCardSprite: [_model addRandomCard]];
            _state = WAIT_FOR_USER;
            break;
            
            
        case ANIMATE_NEW_CARD:
            
            // TODO
            break;
            
            
        case WAIT_FOR_USER:
            
            // Don't do anything. Just sit here and wait for the user to swipe.
            break;
            
            
        case ANIMATE_ACTIONS:
            
            // TODO
            break;
    }
}


// Cards

-( void )addCardSprite: ( TileIndex )index
{
    _cardSprites[ index.x ][ index.y ] = [[CardSprite alloc] initWithIndex: index];
}


// Gestures

-( void )handleSwipeDown: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _actions = [_model UpdateWithDirection: DOWN];
        _state = ANIMATING;
    }
}

-( void )handleSwipeLeft: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _actions = [_model UpdateWithDirection: LEFT];
        _state = ANIMATING;
    }
}

-( void )handleSwipeRight: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _actions = [_model UpdateWithDirection: RIGHT];
        _state = ANIMATING;
    }
}

-( void )handleSwipeUp: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _actions = [_model UpdateWithDirection: UP];
        _state = ANIMATING;
    }
}


// Scoring

-( void )updateScore
{
    int _currentScore = [_model getScore];
    [_controller setCurrentScore: _currentScore];
    if ( _currentScore > _bestScore )
    {
        [_controller setBestScore: _currentScore];
    }
}


// Animation

-( void )doMoveActions
{
    
}
-( void )doOtherActions
{
    
}


// SK Crazy Stuff

-(id)initWithSize: ( CGSize )size
{
    if ( self = [super initWithSize: size] ) {}
    return self;
}
-(void)touchesBegan: ( NSSet * )touches withEvent: ( UIEvent * )event
{
    /* Called when a touch begins */
}

@end
