//
//  SpriteScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/18/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "SpriteScene.h"

@implementation SpriteScene

-(id)init {
  self = [super init];
  if (self) {
    sprite = [[EESprite alloc] initWithImage:[UIImage imageNamed:@"boy-sprite.png"] pointRatio:100];
    sprite.position = GLKVector2Make(2,-1);
    sprite.rotation = 0.25*M_TAU;
  }
  return self;
}

-(void)render {
  [super render];
  [sprite renderInScene:self];
}

@end
