//
//  RotatingTreeScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "RotatingTreeScene.h"
#import "Tree.h"

@implementation RotatingTreeScene

-(id)init {
  self = [super init];
  if (self) {
    Tree *tree = [[Tree alloc] init];
    tree.rotation = 0;
    tree.angularVelocity = M_TAU;
    tree.angularAcceleration = 0.1*M_TAU;
    [self.shapes addObject:tree];
  }
  return self;
}


@end
