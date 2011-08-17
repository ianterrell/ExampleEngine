//
//  EEScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEScene.h"

@implementation EEScene

@synthesize clearColor;
@synthesize left, right, bottom, top;

-(void)update {
//  NSLog(@"in EEScene's update");
}

-(void)render {
//  NSLog(@"in EEScene's render");
  glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
  glClear(GL_COLOR_BUFFER_BIT);
  
  GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
  effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
  [effect prepareToDraw];
}

@end
