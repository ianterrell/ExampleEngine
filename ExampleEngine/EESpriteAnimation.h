//
//  EESpriteAnimation.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/22/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EESpriteAnimation : NSObject {
  NSArray *frames;
  float timePerFrame, elapsedTime;
}

-(id)initWithTimePerFrame:(float)timePerFrame framesNamed:(NSArray *)frameNames;
-(void)update:(NSTimeInterval)dt;
-(GLKTextureInfo *)currentFrame;

@end
