//
//  ForestScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/18/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "ForestScene.h"
#import "Tree.h"

@implementation ForestScene

-(id)init {
  self = [super init];
  if (self) {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        Tree *tree = [[Tree alloc] init];
        tree.scale = GLKVector2Make(0.08+((i+j)%2)*0.04, 0.08+((i+j)%2)*0.04);
        tree.rotation = ((i+j)%12)/12.0*M_TAU;
        tree.position = GLKVector2Make(-2.7+i*0.6,-1.8+j*0.4);
        [self.shapes addObject:tree];
      }
    }
  }
  return self;
}

@end
