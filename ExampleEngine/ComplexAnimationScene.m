//
//  ComplexAnimationScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "ComplexAnimationScene.h"
#import "EERectangle.h"
#import "EEAnimation.h"

@implementation ComplexAnimationScene

-(id)init {
  self = [super init];
  if (self) {
    EERectangle *rectangle = [[EERectangle alloc] init];
    rectangle.position = GLKVector2Make(-1, -1);
    rectangle.width = 2;
    rectangle.height = 1;
    rectangle.scale = GLKVector2Make(0.5, 1);
    rectangle.color = GLKVector4Make(1, 0, 0, 0);
    
    EEAnimation *complexAnimation = [[EEAnimation alloc] init];
    complexAnimation.positionDelta = GLKVector2Make(2, 2);
    complexAnimation.scaleDelta = GLKVector2Make(1, -0.5);
    complexAnimation.rotationDelta = M_TAU;
    complexAnimation.colorDelta = GLKVector4Make(0, 0, 0, 1);
    complexAnimation.duration = 3;
    [rectangle.animations addObject:complexAnimation];
    
    EEAnimation *secondAnimation = [[EEAnimation alloc] init];
    secondAnimation.positionDelta = GLKVector2Make(-1,-1);
    secondAnimation.rotationDelta = M_TAU;
    secondAnimation.colorDelta = GLKVector4Make(0, 1, 0, 0);
    secondAnimation.duration = 2;
    [rectangle.animations addObject:secondAnimation];
    
    [self.shapes addObject:rectangle];
  }
  return self;
}

@end
