//
//  panelViewController.h
//  FoodAtlas
//
//  Created by Dina Li on 10/23/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//  description: shows buttons for map

#import <UIKit/UIKit.h>

@class panelViewController;

@protocol ChildViewControllerDelegate <NSObject>

- (void) locationRequested:(panelViewController*)controller; // user requested current location
- (void) showLayers:(panelViewController*)controller;
- (void) startAutoPan:(panelViewController*)controller;

@end

@interface panelViewController : UIViewController
{
    __weak id <ChildViewControllerDelegate> delegate;

}

@property (nonatomic, weak) id <ChildViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *layerBtn;

@property (weak, nonatomic) IBOutlet UIButton *locationBtn;

@property (weak, nonatomic) IBOutlet UIButton *routeBtn;

- (IBAction)showLayers:(id)sender;

- (IBAction)locationRequested:(id)sender;

- (IBAction)startAutoPan:(id)sender;


@end
