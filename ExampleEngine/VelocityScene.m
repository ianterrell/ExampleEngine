//
//  VelocityScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "VelocityScene.h"
#import "Tree.h"

@implementation VelocityScene

-(id)init {
  self = [super init];
  if (self) {
    Tree *tree = [[Tree alloc] init];
    tree.scale = GLKVector2Make(0.5,0.5);
    tree.position = GLKVector2Make(-3,-2);
    tree.velocity = GLKVector2Make(1,0.75);
    [self.shapes addObject:tree];
  }
  return self;
}


@end
