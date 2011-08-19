//
//  ColorChangeScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "ColorChangeScene.h"
#import "EEEllipse.h"

@implementation ColorChangeScene

-(id)init {
  self = [super init];
  if (self) {
    EEEllipse *ball = [[EEEllipse alloc] init];
    ball.radiusX = 1;
    ball.radiusY = 1;
    ball.color = GLKVector4Make(0.9, 0.1, 0.1, 1);
    [ball animateWithDuration:3 animations:^() {
      ball.color = GLKVector4Make(0, 0.4, 0.9, 1);
    }];
    [self.shapes addObject:ball];
  }
  return self;
}

@end
