//
//  ViewController.m
//  dropball
//
//  Created by Apple on 12/28/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIImageView *ball;
    float radius,velocity,accelarator,maxheight;
    NSTimer *timer;
}

- (void) initproject{
    radius = 64;
    velocity= 0;
    accelarator =9.8;
    maxheight = self.view.bounds.size.height - radius;

    self.edgesForExtendedLayout = UIRectEdgeNone;
    // delete the upside part
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initproject];
    [self ballcreating];
    [self balldropping];
    
}

- (void) ballcreating{
    ball = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ball.png"]];
    ball.frame = CGRectMake(0, 0, 128, 128);
    ball.center = CGPointMake(self.view.bounds.size.width/2,radius);
    [self.view addSubview:ball];
    
}
- (void) balldropping{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(doballdropping) userInfo:nil repeats:true];
    
}
- (void) doballdropping{
    ball.center = CGPointMake(ball.center.x, ball.center.y + [self goingdistance]);
    
    if (ball.center.y>=self.view.bounds.size.height-radius){
        velocity = -velocity;
        velocity = velocity * 0.9;
        ball.center = CGPointMake(ball.center.x, self.view.bounds.size.height - radius);
    }
  
    
    
}
- (float) goingdistance{
    velocity = velocity + accelarator*0.01;
    return  velocity*0.01 *500; // it may have to multiple more but just 500
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
