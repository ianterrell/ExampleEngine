//
//  OptimizedTree.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/18/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import "EEShape.h"
#import "EERectangle.h"
#import "EETriangle.h"

@interface OptimizedShape : EEShape  {
  EEShape *prototype;
}
@end

@interface OptimizedTrunk : OptimizedShape
@end

@interface OptimizedLeaves : OptimizedShape
@end

@interface OptimizedTree : EEShape
@end
