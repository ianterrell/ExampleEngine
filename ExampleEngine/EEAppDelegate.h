//
//  EEAppDelegate.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "EEScene.h"

@interface EEAppDelegate : UIResponder <UIApplicationDelegate, GLKViewDelegate, GLKViewControllerDelegate> {
  EEScene *scene;
}

@property (strong, nonatomic) UIWindow *window;

@end
