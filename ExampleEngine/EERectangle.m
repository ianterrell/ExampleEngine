//
//  EERectangle.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EERectangle.h"

@implementation EERectangle

-(int)numVertices {
  return 4;
}

-(void)updateVertices {
  self.vertices[0] = GLKVector2Make( width/2.0, -height/2.0);
  self.vertices[1] = GLKVector2Make( width/2.0,  height/2.0);
  self.vertices[2] = GLKVector2Make(-width/2.0,  height/2.0);
  self.vertices[3] = GLKVector2Make(-width/2.0, -height/2.0);
}

-(float)width {
  return width;
}

-(void)setWidth:(float)_width {
  width = _width;
  [self updateVertices];
}

-(float)height {
  return height;
}

-(void)setHeight:(float)_height {
  height = _height;
  [self updateVertices];
}

@end
