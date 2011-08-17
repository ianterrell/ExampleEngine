//
//  EllipseScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EllipseScene.h"

@implementation EllipseScene

-(id)init {
  self = [super init];
  if (self) {
    ellipse = [[EEEllipse alloc] init];
    ellipse.radiusX = 2;
    ellipse.radiusY = 1;
  }
  return self;
}

-(void)render {
  [super render];
  [ellipse render];
}

@end
