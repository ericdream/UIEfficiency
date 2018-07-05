//
//  main.m
//  SimpleControl
//
//  Created by Eric on 26/12/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#if DEBUG
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#endif
int main(int argc, char * argv[]) {
    @autoreleasepool {
#if DEBUG
        [FBAssociationManager hook];
        [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager] enableGenerations];
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
