//
//  EEScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEScene.h"

@implementation EEScene

@synthesize clearColor;
@synthesize left, right, bottom, top;

-(void)update {
//  NSLog(@"in EEScene's update");
}

-(void)render {
//  NSLog(@"in EEScene's render");
  glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
  glClear(GL_COLOR_BUFFER_BIT);
  
  float vertices[] = {-1, -1,
                       1, -1,
                       0,  1};
  
  GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
  effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
  [effect prepareToDraw];
  
  glEnableVertexAttribArray(GLKVertexAttribPosition);
  glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
  glDrawArrays(GL_TRIANGLES, 0, 3);
  glDisableVertexAttribArray(GLKVertexAttribPosition);
}

@end
