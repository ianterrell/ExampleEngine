//
//  EESpriteAnimation.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/22/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EESpriteAnimation.h"

@implementation EESpriteAnimation

-(id)initWithTimePerFrame:(float)time framesNamed:(NSArray *)frameNames {
  self = [super init];
  if (self) {
    elapsedTime = 0;
    timePerFrame = time;
    frames = [NSMutableArray arrayWithCapacity:[frameNames count]];
    for (NSString *name in frameNames)
      [(NSMutableArray*)frames addObject:
      [GLKTextureLoader textureWithCGImage:[UIImage imageNamed:name].CGImage 
                                   options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:GLKTextureLoaderOriginBottomLeft] 
                                     error:nil]];
  }
  return self;
}

-(void)update:(NSTimeInterval)dt {
  elapsedTime += dt;
}

-(GLKTextureInfo *)currentFrame {
  NSLog(@"index is %d", ((int)(elapsedTime/timePerFrame))%[frames count]);
  return [frames objectAtIndex:((int)(elapsedTime/timePerFrame))%[frames count]];
}

@end
