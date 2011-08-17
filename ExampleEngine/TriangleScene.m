//
//  TriangleScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "TriangleScene.h"

@implementation TriangleScene

-(id)init {
  self = [super init];
  if (self) {
    triangle = [[EETriangle alloc] init];
    
    triangle.vertices[0] = GLKVector2Make(-1, -1);
    triangle.vertices[1] = GLKVector2Make( 1, -1);
    triangle.vertices[2] = GLKVector2Make( 0,  1);
    
    triangle.useConstantColor = NO;
    triangle.vertexColors[0] = GLKVector4Make(1,0,0,1);
    triangle.vertexColors[1] = GLKVector4Make(0,1,0,1);
    triangle.vertexColors[2] = GLKVector4Make(0,0,1,1);
  }
  return self;
}

-(void)render {
  [super render];
  [triangle renderInScene:self];
}

@end
