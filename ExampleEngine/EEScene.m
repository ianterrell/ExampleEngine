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

-(void)update {
//  NSLog(@"in EEScene's update");
}

-(void)render {
//  NSLog(@"in EEScene's update");
  glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
  glClear(GL_COLOR_BUFFER_BIT);
}

@end
