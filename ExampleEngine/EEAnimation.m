//
//  EEAnimation.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEAnimation.h"

@implementation EEAnimation

@synthesize duration, elapsedTime, positionDelta;

-(id)init {
  self = [super init];
  if (self) {
    elapsedTime = 0;
    duration = 0;
    positionDelta = GLKVector2Make(0,0);
  }
  return self;
}

-(void)animateShape:(EEShape *)shape dt:(NSTimeInterval)dt {
  elapsedTime += dt;
  
  if (elapsedTime > duration)
    dt -= elapsedTime - duration;
  
  float fractionOfDuration = dt/duration;
  GLKVector2 positionIncrement = GLKVector2MultiplyScalar(positionDelta, fractionOfDuration);
  shape.position = GLKVector2Add(shape.position, positionIncrement);
}

@end
