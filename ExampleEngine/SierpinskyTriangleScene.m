//
//  SierpinskyTriangleScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/18/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "SierpinskyTriangleScene.h"

@implementation SierpinskyTriangleScene

-(id)init {
  self = [super init];
  if (self) {
    triangle = [[EETriangle alloc] init];
    
    triangle.vertices[0] = GLKVector2Make(-1, -1);
    triangle.vertices[1] = GLKVector2Make( 1, -1);
    triangle.vertices[2] = GLKVector2Make( 0,  -1+2*sin(M_TAU/6));
    
    [triangle setTextureImage:[UIImage imageNamed:@"sierpinksy.jpg"]];
    triangle.textureCoordinates[0] = GLKVector2Make(  0,0);
    triangle.textureCoordinates[1] = GLKVector2Make(  1,0);
    triangle.textureCoordinates[2] = GLKVector2Make(0.5,1);
  }
  return self;
}

-(void)render {
  [super render];
  [triangle renderInScene:self];
}

@end
