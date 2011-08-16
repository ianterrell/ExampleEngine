//
//  EEScene.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EEScene : NSObject {
  GLKVector4 clearColor;
  float left, right, bottom, top;
}

@property GLKVector4 clearColor;
@property float left, right, bottom, top;

-(void)update;
-(void)render;

@end
