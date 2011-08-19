//
//  EEShape.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@implementation EEShape

@synthesize color, useConstantColor, position, velocity, acceleration, rotation, scale, children, parent, texture;

-(id)init {
  self = [super init];
  if (self) {
    // Draw with the color white
    useConstantColor = YES;
    color = GLKVector4Make(1,1,1,1);
    
    // No texture
    texture = nil;
    
    // Center on the origin
    position = GLKVector2Make(0,0);
    
    // Don't rotate
    rotation = 0;
    
    // Scale to original size
    scale = GLKVector2Make(1,1);
    
    // No children by default
    children = [[NSMutableArray alloc] init];
  }
  return self;
}

-(int)numVertices {
  return 0;
}

- (GLKVector2 *)vertices {
  if (vertexData == nil)
    vertexData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
  return [vertexData mutableBytes];
}

- (GLKVector4 *)vertexColors {
  if (vertexColorData == nil)
    vertexColorData = [NSMutableData dataWithLength:sizeof(GLKVector4)*self.numVertices];
  return [vertexColorData mutableBytes];
}

- (GLKVector2 *)textureCoordinates {
  if (textureCoordinateData == nil)
    textureCoordinateData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
  return [textureCoordinateData mutableBytes];
}

-(GLKMatrix4)modelviewMatrix {
  GLKMatrix4 modelviewMatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(position.x, position.y, 0),
                                                  GLKMatrix4MakeRotation(rotation, 0, 0, 1));
  modelviewMatrix = GLKMatrix4Multiply(modelviewMatrix, GLKMatrix4MakeScale(scale.x, scale.y, 1));

  if (parent != nil)
    modelviewMatrix = GLKMatrix4Multiply(parent.modelviewMatrix, modelviewMatrix);
  
  return modelviewMatrix;
}

-(void)update:(NSTimeInterval)dt {
  GLKVector2 changeInVelocity = GLKVector2MultiplyScalar(self.acceleration, dt);
  self.velocity = GLKVector2Add(self.velocity, changeInVelocity);
  
  GLKVector2 distanceTraveled = GLKVector2MultiplyScalar(self.velocity, dt);
  self.position = GLKVector2Add(self.position, distanceTraveled);
}

-(void)renderInScene:(EEScene *)scene {
  // Set up our rendering effect
  GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
  
  // Set up the constant color effect if set
  if (useConstantColor) {
    effect.useConstantColor = YES;
    effect.constantColor = self.color;
  }
  
  // Set up our texture effect if set
  if (self.texture != nil) {
    effect.texturingEnabled = YES;
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.target = GLKTextureTarget2D;
    effect.texture2d0.glName = self.texture.glName;
  }
  
  // Create a modelview matrix to position and rotate the object
  effect.transform.modelviewMatrix = self.modelviewMatrix;
  
  // Set up the projection matrix to fit the scene's boundaries
  effect.transform.projectionMatrix = scene.projectionMatrix;
  
  // Tell OpenGL that we're going to use this effect for our upcoming drawing
  [effect prepareToDraw];
  
  // Enable transparency
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  
  // Tell OpenGL that we'll be using vertex position data
  glEnableVertexAttribArray(GLKVertexAttribPosition);
  glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
  
  // If we're using vertex coloring, tell OpenGL that we'll be using vertex color data
  if (!useConstantColor) {
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.vertexColors);
  }
  
  // If we have a texture, tell OpenGL that we'll be using texture coordinate data
  if (texture != nil) {
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.textureCoordinates);
  }

  // Draw our primitives!
  glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);

  // Cleanup: Done with position data
  glDisableVertexAttribArray(GLKVertexAttribPosition);

  // Cleanup: Done with color data (only if we used it)
  if (!useConstantColor)
    glDisableVertexAttribArray(GLKVertexAttribColor);

  // Cleanup: Done with texture data (only if we used it)
  if (self.texture != nil)
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
  
  // Cleanup: Done with the current blend function
  glDisable(GL_BLEND);
  
  // Draw our children
  [children makeObjectsPerformSelector:@selector(renderInScene:) withObject:scene];
}

-(void)setTextureImage:(UIImage *)image {
  NSError *error;
  texture = [GLKTextureLoader textureWithCGImage:image.CGImage options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:GLKTextureLoaderOriginBottomLeft] error:&error];
  if (error) {
    NSLog(@"Error loading texture from image: %@",error);
  }
}

-(void)addChild:(EEShape *)child {
  child.parent = self;
  [children addObject:child];
}

@end
