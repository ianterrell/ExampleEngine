//
//  TreeScene.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/18/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEScene.h"
#import "EETriangle.h"
#import "EERectangle.h"

@interface TreeScene : EEScene {
  EETriangle *leaves;
  EERectangle *trunk;
}

@end
