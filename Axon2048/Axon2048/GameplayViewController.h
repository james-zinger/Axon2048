//
//  GameplayViewController.h
//  Axon2048
//
//  Created by ROSE JEFFREY D. on 2014-04-17.
//  Copyright (c) 2014 Axon Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface GameplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bestScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentScoreLabel;
@property (weak, nonatomic) IBOutlet UIView *gameplayView;
@property (weak, nonatomic) UIViewController *winScreen;
@property (weak, nonatomic) UIViewController *loseScreen;

-(void)setBestScore: ( int )value;
-(void)setCurrentScore: ( int )value;

@end
