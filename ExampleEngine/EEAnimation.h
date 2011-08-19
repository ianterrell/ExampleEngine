//
//  EEAnimation.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

#import "EEShape.h"

@interface EEAnimation : NSObject {
  NSTimeInterval duration, elapsedTime;
  GLKVector2 positionDelta, scaleDelta;
  float rotationDelta;
  GLKVector4 colorDelta;
}

@property NSTimeInterval duration;
@property(readonly) NSTimeInterval elapsedTime;
@property GLKVector2 positionDelta, scaleDelta;
@property float rotationDelta;
@property GLKVector4 colorDelta;

-(void)animateShape:(EEShape *)shape dt:(NSTimeInterval)dt;

@end
