//
//  EEShape.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@implementation EEShape

@synthesize color, useConstantColor, position, rotation;

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


-(void)renderInScene:(EEScene *)scene {
  // Set up our rendering effect
  GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
  
  // Set up the constant color effect if set
  if (useConstantColor) {
    effect.useConstantColor = YES;
    effect.constantColor = color;
  }
  
  // Set up our texture effect if set
  if (texture != nil) {
    effect.texturingEnabled = YES;
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.target = GLKTextureTarget2D;
    effect.texture2d0.glName = texture.glName;
  }
  
  // Create a modelview matrix to position and rotate the object
  effect.transform.modelviewMatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(position.x, position.y, 0),
                                                        GLKMatrix4MakeRotation(rotation, 0, 0, 1));
  
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
  if (texture != nil)
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
  
  // Cleanup: Done with the current blend function
  glDisable(GL_BLEND);
}

-(void)setTextureImage:(UIImage *)image {
  NSError *error;
  texture = [GLKTextureLoader textureWithCGImage:image.CGImage options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:GLKTextureLoaderOriginBottomLeft] error:&error];
  if (error) {
    NSLog(@"Error loading texture from image: %@",error);
  }
}

@end
