//
//  EEScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEScene.h"
#import "EEShape.h"

@implementation EEScene

@synthesize clearColor;
@synthesize left, right, bottom, top;
@synthesize shapes;

-(id)init {
  self = [super init];
  if (self) {
    shapes = [[NSMutableArray alloc] init];
  }
  return self;
}

-(void)update:(NSTimeInterval)dt {
//  NSLog(@"in EEScene's update");
  [shapes enumerateObjectsUsingBlock:^(EEShape *shape, NSUInteger idx, BOOL *stop) {
    [shape update:dt];
  }];
}

-(void)render {
//  NSLog(@"in EEScene's render");
  glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
  glClear(GL_COLOR_BUFFER_BIT);
  
  [shapes makeObjectsPerformSelector:@selector(renderInScene:) withObject:self];
}

-(GLKMatrix4)projectionMatrix {
  return GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
}

@end
