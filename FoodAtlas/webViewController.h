//
//  webViewController.h
//  FoodAtlas
//
//  Created by Dina Li on 9/16/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"


@interface webViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) NSURL *pageURL; 
//- (IBAction)goBack:(id)sender;


@end
