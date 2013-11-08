//
//  ersFirstViewController.h
//  FoodAtlas
//
//  Created by Dina Li on 9/16/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chartViewController : UIViewController<CPTPlotDataSource>

@property (nonatomic, strong) CPTGraphHostingView *hostView;
@end
