//
//  EEShape.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@implementation EEShape

@synthesize color;

-(int)numVertices {
  return 0;
}

- (GLKVector2 *)vertices {
  if (vertexData == nil)
    vertexData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
  return [vertexData mutableBytes];
}

-(void)renderInScene:(EEScene *)scene {
  GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
  effect.useConstantColor = YES;
  effect.constantColor = color;
  effect.transform.projectionMatrix = scene.projectionMatrix;
  [effect prepareToDraw];
  
  glEnableVertexAttribArray(GLKVertexAttribPosition);
  glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
  glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
  glDisableVertexAttribArray(GLKVertexAttribPosition);
}

@end
