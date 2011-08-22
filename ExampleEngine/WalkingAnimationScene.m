//
//  WalkingAnimationScene.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/22/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "WalkingAnimationScene.h"
#import "EESprite.h"
#import "EESpriteAnimation.h"

@implementation WalkingAnimationScene

-(id)init {
  self = [super init];
  if (self) {
    EESprite *sprite = [[EESprite alloc] initWithImage:[UIImage imageNamed:@"alfred0.png"] pointRatio:100];
    NSArray *frameNames = [NSArray arrayWithObjects:@"alfred1.png", @"alfred2.png", @"alfred3.png", @"alfred4.png", @"alfred5.png", @"alfred6.png", @"alfred7.png", @"alfred8.png", @"alfred9.png", nil];
    sprite.spriteAnimation = [[EESpriteAnimation alloc] initWithTimePerFrame:1.0/9 framesNamed:frameNames];
    
    sprite.position = GLKVector2Make(3, 0);
    sprite.velocity = GLKVector2Make(-1, 0);
    
    [self.shapes addObject:sprite];
  }
  return self;
}

@end
