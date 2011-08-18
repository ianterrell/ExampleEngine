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
  }
  return self;
}

-(void)render {
  [super render];
  [sprite renderInScene:self];
}

@end
