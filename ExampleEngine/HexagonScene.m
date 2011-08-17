//
//  HexagonScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "HexagonScene.h"

@implementation HexagonScene

-(id)init {
  self = [super init];
  if (self) {
    polygon = [[EERegularPolygon alloc] initWithNumSides:6];
    polygon.radius = 1;
  }
  return self;
}

-(void)render {
  [super render];
  [polygon render];
}

@end
