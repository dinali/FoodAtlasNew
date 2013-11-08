//
//  webViewController.m
//  FoodAtlas
//
//  Created by Dina Li on 9/16/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

@synthesize pageURL = _pageURL;
@synthesize webView = _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Website"];
    [self setRestorationIdentifier:@"websiteVC"];
    self.restorationClass = [self class];
    
    // this is a demo so hardcode here for now, could pass from MainViewController
    
    self.pageURL= [NSURL URLWithString:@"http://www.ers.usda.gov/data-products/food-access-research-atlas/documentation.aspx#.UjhLZ2TXhaE"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.pageURL];
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if(self.view!=nil){
        [self setWebView:nil];
    }
}

// TODO: this is failing maybe because there's no NIB file?
//+(UIViewController*)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder{
    
   // UIViewController * webViewController = [[webViewController alloc]initWithNibName:@"webViewController" bundle:nil];
   // return webViewController;
//}

@end
