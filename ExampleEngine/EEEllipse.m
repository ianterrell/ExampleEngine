//
//  EEEllipse.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEEllipse.h"

#define EE_ELLIPSE_RESOLUTION 64

@implementation EEEllipse

-(int)numVertices {
  return EE_ELLIPSE_RESOLUTION;
}

-(void)updateVertices {
  for (int i = 0; i < EE_ELLIPSE_RESOLUTION; i++){
    float theta = ((float)i) / EE_ELLIPSE_RESOLUTION * M_TAU;
    self.vertices[i] = GLKVector2Make(cos(theta)*radiusX, sin(theta)*radiusY);
  }
}

-(float)radiusX {
  return radiusX;
}

-(void)setRadiusX:(float)_radiusX {
  radiusX = _radiusX;
  [self updateVertices];
}

-(float)radiusY {
  return radiusY;
}

-(void)setRadiusY:(float)_radiusY {
  radiusY = _radiusY;
  [self updateVertices];
}

@end
