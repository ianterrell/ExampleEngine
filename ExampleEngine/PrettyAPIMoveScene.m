//
//  PrettyAPIMoveScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/19/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "PrettyAPIMoveScene.h"
#import "Tree.h"

@implementation PrettyAPIMoveScene

-(id)init {
  self = [super init];
  if (self) {
    Tree *tree = [[Tree alloc] init];
    tree.position = GLKVector2Make(-1.5,0);
    [tree animateWithDuration:3 animations:^() {
      tree.position = GLKVector2Make(1.5,0);
    }];    
    [self.shapes addObject:tree];
  }
  return self;
}

@end
