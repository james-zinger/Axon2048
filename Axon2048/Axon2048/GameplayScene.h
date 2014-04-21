//
//  MyScene.h
//  Axon2048
//

//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class GameplayViewController;

@interface GameplayScene : SKScene <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UISwipeGestureRecognizer* swipeDownGesture;
@property (strong, nonatomic) UISwipeGestureRecognizer* swipeLeftGesture;
@property (strong, nonatomic) UISwipeGestureRecognizer* swipeRightGesture;
@property (strong, nonatomic) UISwipeGestureRecognizer* swipeUpGesture;

-(void)startWithController: ( GameplayViewController* )controller;

@end
