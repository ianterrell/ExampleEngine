//
//  ManuallyMovedTree.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "ManuallyMovedTree.h"
#import "Tree.h"
#import "EEAnimation.h"

@implementation ManuallyMovedTree

-(id)init {
  self = [super init];
  if (self) {
    Tree *tree = [[Tree alloc] init];
    tree.position = GLKVector2Make(-1.5,0);
    
    EEAnimation *moveRightAnimation = [[EEAnimation alloc] init];
    moveRightAnimation.positionDelta = GLKVector2Make(3, 0);
    moveRightAnimation.duration = 3;
    [tree.animations addObject:moveRightAnimation];
    
    [self.shapes addObject:tree];
  }
  return self;
}

@end
