//
//  EERegularPolygon.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@interface EERegularPolygon : EEShape {
  int numSides;
  float radius;
}

@property(readonly) int numSides;
@property float radius;

-(id)initWithNumSides:(int)numSides;

@end
