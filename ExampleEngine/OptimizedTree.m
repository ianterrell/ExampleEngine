//
//  OptimizedTree.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/18/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "OptimizedTree.h"

@implementation OptimizedShape
-(int)numVertices {
  return prototype.numVertices;
}
- (GLKVector2 *)vertices {
  return prototype.vertices;
}
-(GLKVector4)color {
  return prototype.color;
}
- (GLKVector4 *)vertexColors {
  return prototype.vertexColors;
}
-(GLKTextureInfo *)texture {
  return prototype.texture;
}
- (GLKVector2 *)textureCoordinates {
  return prototype.textureCoordinates;
}
@end

@implementation OptimizedTrunk
-(id)init {
  self = [super init];
  if (self) {
    prototype = [[EERectangle alloc] init];
    ((EERectangle*)prototype).width = 0.4;
    ((EERectangle*)prototype).height = 1;
    prototype.position = GLKVector2Make(0, -1.25);
    prototype.color = GLKVector4Make(0.4, 0.1, 0, 1);
  }
  return self;
}
@end

@implementation OptimizedLeaves
-(id)init {
  self = [super init];
  if (self) {
    prototype = [[EETriangle alloc] init];
    prototype.vertices[0] = GLKVector2Make(-1, 0);
    prototype.vertices[1] = GLKVector2Make( 1, 0);
    prototype.vertices[2] = GLKVector2Make( 0, 3);
    prototype.position = GLKVector2Make(0,-1.2);
    prototype.color = GLKVector4Make(0, 0.5, 0, 1);
  }
  return self;
}
@end

@implementation OptimizedTree
-(id)init {
  self = [super init];
  if (self) {
    [self addChild:[[OptimizedTrunk alloc] init]];
    [self addChild:[[OptimizedLeaves alloc] init]];
  }
  return self;
}
@end
