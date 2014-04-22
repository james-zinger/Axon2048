//
//  GameplayViewController.m
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-17.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameplayViewController.h"
#import "GameplayScene.h"

@implementation GameplayViewController



// Private members

SKView* _skView;
SKSpriteNode* _background;


// Init

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set fonts for the score display labels (this can't be done through XCode's UI)
    _bestScoreLabel.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 24];
    _currentScoreLabel.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 24];

    // Configure the view
    _skView = [[SKView alloc] initWithFrame: _gameplayView.bounds];
    [_gameplayView addSubview: _skView];
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    
    // Create and configure the scene
    GameplayScene* scene = [GameplayScene sceneWithSize: _skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [_skView presentScene: scene];
    
    // Create a background image for the scene
    _background = [SKSpriteNode spriteNodeWithImageNamed: @"Gameplay-Background-SKView.png"];
    _background.position = CGPointMake( CGRectGetMidX( _skView.frame ), CGRectGetMidY( _skView.frame ) );
    [_background setScale: 0.5];
    [scene addChild: _background];
    
    // startWithController() is a custom initialization we need to run to start the game
    [scene startWithController: self];
}


// Scoring

-(void)setBestScore: ( int )value
{
    _bestScoreLabel.text = [NSString stringWithFormat: @"%d", value];
}

-(void)setCurrentScore: ( int )value
{
    _currentScoreLabel.text = [NSString stringWithFormat: @"%d", value];
}


// iOS Crazy Stuff

- (id)initWithNibName: ( NSString * )nibNameOrNil bundle: ( NSBundle * )nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if ( self )
    {
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
