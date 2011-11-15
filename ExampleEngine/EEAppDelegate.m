//
//  EEAppDelegate.m
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEAppDelegate.h"
#import "EESceneController.h"
#import "WalkingAnimationScene.h"
#import "BeachBallScene.h"
#import "PrettyAPIMoveScene.h"
#import "AccelerationScene.h"
#import "ColorChangeScene.h"
#import "ComplexAnimationScene.h"
#import "ForestScene.h"
#import "HexagonScene.h"
#import "LandscapeScene.h"
#import "ManuallyMovedTree.h"
#import "OptimizedTree.h"
#import "PrettyAPIMoveScene.h"
#import "RectangleScene.h"
#import "RotatingTreeScene.h"
#import "SierpinskyTriangleScene.h"
#import "SpriteScene.h"
#import "TreeScene.h"
#import "TriangleScene.h"
#import "VelocityScene.h"


@implementation EEAppDelegate

@synthesize window = _window;

NSArray *arrayOfScenes;
int indexOfScene;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
  [EAGLContext setCurrentContext:context];
  
  GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds] context:context];
  view.delegate = self;
  
  EESceneController *controller = [[EESceneController alloc] init];
  controller.delegate = self;
  controller.view = view;
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
  self.window.rootViewController = nav;
    //[nav release];
    
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] 
                                                   initWithTitle:@"Next" 
                                                   style:UIBarButtonItemStyleBordered 
                                                   target:self 
                                                   action:@selector(nextScene:)];
    
  [self.window makeKeyAndVisible];
  
    // setup arrayOfScenes
    indexOfScene = -1;
    arrayOfScenes = [NSArray arrayWithObjects:[[PrettyAPIMoveScene alloc] init],
                     [[BeachBallScene alloc] init], 
                     [[WalkingAnimationScene alloc] init],
                     [[AccelerationScene alloc] init],
                     [[ColorChangeScene alloc] init],
                     [[ComplexAnimationScene alloc] init],
                     [[ForestScene alloc] init],
                     [[LandscapeScene alloc] init],
                     [[ManuallyMovedTree alloc] init],
                     //[[OptimizedTree alloc] init],
                     [[RotatingTreeScene alloc] init],
                     [[SierpinskyTriangleScene alloc] init],
                     [[SpriteScene alloc] init],
                     [[TriangleScene alloc] init],
                     [[VelocityScene alloc] init],
                     [[HexagonScene alloc] init],
                     [[PrettyAPIMoveScene alloc] init],
                     [[RectangleScene alloc] init],
                     nil];
    
    [self nextScene:self];
  return YES;
}

- (void) nextScene:(id) sender{
    indexOfScene =  (indexOfScene >= [arrayOfScenes count] -1) ? 0 : indexOfScene + 1;
    EEScene *newScene = [arrayOfScenes objectAtIndex:indexOfScene];
    ((UINavigationController *)self.window.rootViewController).topViewController.title = NSStringFromClass([newScene class]);
                                                                                          
    scene = newScene;
    scene.clearColor = GLKVector4Make(1,1,1,1);
    scene.left   = -3;
    scene.right  =  3;
    scene.bottom = -2;
    scene.top    =  2;
}

- (void)glkViewControllerUpdate:(GLKViewController *)controller {
//  NSLog(@"in glkViewControllerUpdate");
  [scene update:controller.timeSinceLastUpdate];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
//  NSLog(@"in glkView:drawInRect:");
  [scene render];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
