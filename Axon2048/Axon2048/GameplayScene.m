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
#import "CardAction.h"
#import "TileIndex.h"

@implementation GameplayScene


// Constants

const float MOVE_DURATION = 0.25;


// Private members

GameplayViewController* _controller;
GameModel*              _model;
GameplayState           _state;
NSMutableArray*         _moveActions;
NSMutableArray*         _otherActions;
NSMutableArray*         _cardSprites;
int                     _bestScore;
int                     _currentScore;
bool                    _moveStarted;
DIRECTION               _swipeDirection;
NSMutableArray*			_tilesToNull;


// Init

-( void )startWithController: ( GameplayViewController* )controller
{
    // Set the controller reference
    _controller = controller;
    
    // Set the model reference and reset it so we start from scratch
    _model = GameModel.Instance;
    [_model startWithSize: 4];
    
    // Set the initial gameplay state
    _state = BEGIN_TURN;
    
    // Set the initial swipe direction
    _swipeDirection = DOWN;
    
    // Set the move as not started
    _moveStarted = NO;
	
	_tilesToNull = [[NSMutableArray alloc]init];
    
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
            _cardSprites[ row ][ col ] = [NSNull null];
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
    [_swipeLeftGesture setDirection: UISwipeGestureRecognizerDirectionLeft];
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
            {
                // Add a new card to the grid
                TileIndex *newCardIndex = [_model addRandomCard];
                
                // If its index is (-1, -1), a card couldn't be added, so the player loses.
                if ( newCardIndex.x == -1 && newCardIndex.y == -1 )
                {
                    // Player loses -- switch view to the lose screen
					[_controller presentViewController: _controller.loseScreen animated: YES completion: nil];

                }
                
                // Start waiting for the user's swipe
                _state = WAIT_FOR_USER;
            }
            break;
            
            
            
        case WAIT_FOR_USER:
            
            // Don't do anything. Just sit here and wait for the user to swipe.
            
            break;
            
            
            
        case ANIMATE_MOVE_ACTIONS:
            
            // Move over any acted-on tiles by one tile
            if ( !_moveStarted )
            {
                // Flag the move animation as started so animations don't start several times over
                _moveStarted = YES;
                
                // Step the board and get back a set of actions to do
                NSMutableArray* actions = [_model UpdateWithDirection: _swipeDirection];
                
                if ( [actions count] == 0 )
                {
                    // If no actions come back from stepping the board state, the next turn should begin.
                    _state = BEGIN_TURN;
                    return;
                }
                else
                {
                    // If actions were returned, filter them into the move actions list and other actions list.
                    [self filterActions: actions];
                }
                
                // Animate the move actions
                for ( int i = [_moveActions count] - 1; i >= 0; i-- )
                {
                    // Get the new position to move to from the card action
                    CardAction* cardAction = _moveActions[ i ];
                    CGPoint newPosition = [self indexToPosition: cardAction.newIndex];
                    
                    // Determine which sprite to move by reading the index from the card action
                    CardSprite* sprite = _cardSprites[ cardAction.lookupIndex.x ][ cardAction.lookupIndex.y ];
                    
                    // Store the card action with the card it applies to for now
                    sprite.cardAction = cardAction;
                    
                    // Create an SKAction to move the sprite to its new position
                    SKAction* skAction = [SKAction moveTo: newPosition duration: MOVE_DURATION];
                    [sprite.node runAction: skAction completion: ^{
                        
                        // Don't need to set the position -- the SKAction sets that in the node as it goes.
                        
                        // If the card action indicates that this should be deleted, do that now.
                        if ( cardAction.shouldDelete )
                        {
                            SKAction* skAction = [SKAction removeFromParent];
                            [sprite.node runAction: skAction];
                            
                            // Ensure that this card has been removed from the grid
							if ([_tilesToNull indexOfObject:sprite.index] == NSNotFound)
								[_tilesToNull addObject:sprite.index];
							
                        }
                        else
                        {
                            // Set the card sprite's new index in itself and in the grid
                            if ([_tilesToNull indexOfObject:sprite.index] == NSNotFound)
								[_tilesToNull addObject:sprite.index];
							
							sprite.index = cardAction.newIndex;
                            _cardSprites[ sprite.index.x ][ sprite.index.y ] = sprite;
							
							// If the tile the object is moving to is marked to be null remove it.
                            if ([_tilesToNull indexOfObject:sprite.index] != NSNotFound)
								[_tilesToNull removeObject:sprite.index];

							
							
                            // Remove the reference to this card action
                            sprite.cardAction = nil;
                        }
                        
                        // Remove this from the move actions once it reaches the new position
                        [_moveActions removeObject: cardAction];
                        
                    }];
                }
            }
            else if ( [_moveActions count] == 0 )
            {
                // All actions have been completed, so move to the next state
                _state = DO_OTHER_ACTIONS;
                
                // Make sure this is set false for the next time around
                _moveStarted = NO;
				
				// Null all the tiles the update has marked for nulling
				for (TileIndex* tileIndex in _tilesToNull)
				{
					_cardSprites[[tileIndex x]][[tileIndex y]] = [NSNull null];
				}
				
				// clean the array to prep for the next set of tiles to null
				[_tilesToNull removeAllObjects];
            }
            
            break;
            
            
        
        case DO_OTHER_ACTIONS:
            
            // Apply actions that weren't moves instantaneously
            for ( int i = 0; i < [_otherActions count]; i++ )
            {
                // Get the new position to act on to from the card action
                CardAction* cardAction = _otherActions[ i ];
                
                // Determine which sprite to act on by reading the index from the card action
                CardSprite* sprite = _cardSprites[ cardAction.lookupIndex.x ][ cardAction.lookupIndex.y ];
                
                // Store the card action with the card it applies to for now
                sprite.cardAction = cardAction;
                
                if ( cardAction.shouldDelete )
                {
                    // Create an SKAction to remove the card from its parent node
                    SKAction* skAction = [SKAction removeFromParent];
                    [sprite.node runAction: skAction];
                    //sprite.cardAction = nil;
                }
                else
                {
                    // Set the card's value and its texture
                    [sprite setValueAndAppearance: cardAction.newValue];
                }
            }
            
            // Check for winning actions
            for ( int i = 0; i < [_otherActions count]; i++ )
            {
                CardAction* cardAction = _otherActions[ i ];
                if ( cardAction.newValue == 2048 )
                {
                    // If an action has a newValue of 2048, the player wins -- switch view to the win scene
                    [_controller presentViewController: _controller.winScreen animated: YES completion: nil];

                }
            }
            
            // Clear the other actions array to be safe
            [_otherActions removeAllObjects];
            
            // Update the score and push the new values to the view
            [self updateScore];
            
            // Go back to animating moves to get the next set of actions from the board
            _state = ANIMATE_MOVE_ACTIONS;
            
            break;
    }
}


// Cards

-( void )addCardSprite: ( TileIndex *)index
{
    // Create a new card at the given index in the grid
    _cardSprites[ index.x ][ index.y ] = [[CardSprite alloc] init];
    CardSprite* sprite = _cardSprites[ index.x ][ index.y ];
    
    // Set the position of the card to the given index
    [sprite setIndexAndPosition: index];
    
    // Add the new card's node to the scene
    [sprite.node setScale: 0.5];
    [self addChild: sprite.node];
    
    NSLog( @"Pos: %f, %f -- Index: %d, %d", sprite.node.position.x, sprite.node.position.y, sprite.index.x, sprite.index.y );
    
}

-( CGPoint )indexToPosition: ( TileIndex *)index
{
    //return CGPointMake(0,0);
    return CGPointMake( 40 + ( 80 * index.x ), 48 + 40 + ( 80 * ( 3 - index.y ) ) );
}


// Gestures

-( void )handleSwipeDown: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _state = ANIMATE_MOVE_ACTIONS;
        _swipeDirection = DOWN;
    }
}

-( void )handleSwipeLeft: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _state = ANIMATE_MOVE_ACTIONS;
        _swipeDirection = LEFT;
    }
}

-( void )handleSwipeRight: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _state = ANIMATE_MOVE_ACTIONS;
        _swipeDirection = RIGHT;
    }
}

-( void )handleSwipeUp: ( UISwipeGestureRecognizer* )recognizer
{
    if ( _state == WAIT_FOR_USER )
    {
        _state = ANIMATE_MOVE_ACTIONS;
        _swipeDirection = UP;
    }
}


// Actions

-( void )filterActions: ( NSMutableArray* )actions
{
    _otherActions = actions;
    _moveActions = [[NSMutableArray alloc] init];
    for ( int i = [_otherActions count] - 1; i >= 0; i-- )
    {
        // Check if the action is a move -- Move these actions into the _moveActions array.
        CardAction* action = _otherActions[ i ];
        if ( action.lookupIndex.x != action.newIndex.x || action.lookupIndex.y != action.newIndex.y )
        {
            [_moveActions addObject: action];
            [_otherActions removeObject: action];
        }
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
