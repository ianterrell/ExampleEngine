//
//  EEShape.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/17/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EEShape : NSObject {
  NSMutableData *vertexData;
}

@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;

@end
