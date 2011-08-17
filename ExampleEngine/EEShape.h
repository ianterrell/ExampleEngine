//
//  EEShape.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "EEScene.h"

@interface EEShape : NSObject {
  NSMutableData *vertexData, *vertexColorData;
  GLKVector4 color;
  BOOL useConstantColor;
}

@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;
@property GLKVector4 color;
@property BOOL useConstantColor;

-(void)renderInScene:(EEScene *)scene;

@end