//
//  GameplayViewController.m
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-17.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import "GameplayViewController.h"
#import "MyScene.h"

@implementation GameplayViewController

SKView* skView;
SKSpriteNode* background;

- (id)initWithNibName: ( NSString * )nibNameOrNil bundle: ( NSBundle * )nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if ( self )
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
    
    // Configure the view
    skView = [[SKView alloc] initWithFrame: _gameplayView.bounds];
    [_gameplayView addSubview: skView];
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    
    // Create and configure the scene
    MyScene* scene = [MyScene sceneWithSize: skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [scene controller: self];
    [scene controller: self];
    [skView presentScene: scene];
=======
>>>>>>> 0b7369900d1379ef1509358de94192d70cc1fa69
    
    // Create a background image for the scene
    background = [SKSpriteNode spriteNodeWithImageNamed: @"Gameplay-Background-SKView.png"];
    background.position = CGPointMake( CGRectGetMidX( skView.frame ), CGRectGetMidY( skView.frame ) );
    [background setScale: 0.5];
    [scene addChild: background];
    
    // Set fonts for the score display labels (this can't be done through XCode's UI)
    _bestScoreLabel.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 24];
    _currentScoreLabel.font = [UIFont fontWithName: @"Ubuntu-Bold" size: 24];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
