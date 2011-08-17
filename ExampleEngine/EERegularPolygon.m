//
//  EERegularPolygon.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EERegularPolygon.h"

@implementation EERegularPolygon

@synthesize numSides;

-(id)initWithNumSides:(int)_numSides {
  self = [super init];
  if (self) {
    numSides = _numSides;
  }
  return self;
}

-(int)numVertices {
  return numSides;
}

-(void)updateVertices {
  for (int i = 0; i < numSides; i++){
    float theta = ((float)i) / numSides * M_TAU;
    self.vertices[i] = GLKVector2Make(cos(theta)*radius, sin(theta)*radius);
  }
}

-(float)radius {
  return radius;
}

-(void)setRadius:(float)_radius {
  radius = _radius;
  [self updateVertices];
}

@end
