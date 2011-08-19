//
//  AccelerationScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "AccelerationScene.h"
#import "EEEllipse.h"

@implementation AccelerationScene

-(id)init {
  self = [super init];
  if (self) {
    EEEllipse *ball = [[EEEllipse alloc] init];
    ball.radiusX = 0.2;
    ball.radiusY = 0.2;
    ball.color = GLKVector4Make(1, 0, 0, 1);
    ball.position = GLKVector2Make(-3,-2);
    ball.velocity = GLKVector2Make(1,2.5);
    ball.acceleration = GLKVector2Make(0,-1);
    
    [self.shapes addObject:ball];
  }
  return self;
}

@end
