//
//  ersAppDelegate.h
//  FoodAtlas
//
//  Created by Dina Li on 9/16/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface ersAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet MainViewController *viewController;

@end
