//
//  MyController.m
//  SampleFireParticleAnimation
//
//  Created by Peter Chen on 1/9/14.
//  Copyright (c) 2014 Peter Chen. All rights reserved.
//

#import "MyController.h"

@interface MyController ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation MyController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Fire Particle Emitter";
    
    // I used the tutorial at http://enharmonichq.com/tutorial-particle-systems-in-core-animation-with-caemitterlayer/ as a starting point for this sample project.
    
    self.emitterLayer = [CAEmitterLayer layer];
    //self.emitterLayer.renderMode = kCAEmitterLayerAdditive;
    self.emitterLayer.emitterShape = kCAEmitterLayerSphere;
    self.emitterLayer.emitterPosition = CGPointMake(160, 300);
    self.emitterLayer.emitterSize = CGSizeMake(10, 10);
    [self.view.layer addSublayer:self.emitterLayer];
    
    CAEmitterCell *emitterCell = [[CAEmitterCell alloc] init];
    emitterCell.contents = (id) [UIImage imageNamed:@"Smoke.png"].CGImage;
    emitterCell.scale = 0.3;
    emitterCell.scaleRange = 1;
    emitterCell.scaleSpeed = -0.2;
    emitterCell.lifetime = 1;
    emitterCell.lifetimeRange = 0.5;
    emitterCell.birthRate = 500;
    emitterCell.velocity = 100;
    emitterCell.velocityRange = 50;
    emitterCell.yAcceleration = -50;
    emitterCell.emissionLongitude = -M_PI_2;
    emitterCell.emissionRange = 45 * M_PI / 180;
    //emitterCell.spin = 20 * M_PI / 180;
    //emitterCell.spinRange = 10 * M_PI / 180;
    emitterCell.color = [UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor;
    
    self.emitterLayer.emitterCells = @[ emitterCell ];
}

@end
