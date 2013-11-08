//
//  panelViewController.m
//  FoodAtlas
//
//  Created by Dina Li on 10/23/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "panelViewController.h"
#import "MainViewController.h"

@interface panelViewController ()

@property (nonatomic, strong) MainViewController *mainViewController;
@end

@implementation panelViewController

@synthesize delegate = _delegate;
@synthesize toggleStoresBtn = _toggleStoresBtn;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// tell mainVC to hide the retail stores layer
- (IBAction)showStores:(id)sender {
    NSLog(@"telling mainVC to display SNAP stores");
    [self.delegate  showStores:self];
    
}

- (IBAction)showLayers:(id)sender {
    NSLog(@"telling mainVC to display TOCVC");
    [self.delegate showLayers:self];
}


- (IBAction)locationRequested:(id)sender {
    
    NSLog(@"Telling mainvc to show location");
    [self.delegate locationRequested:self];
    
   // self.myLabel.text = self.messageFromMom;
    
}

- (IBAction)startAutoPan:(id)sender {
    NSLog(@"Telling mainvc to show autoroute");
    [self.delegate startAutoPan:self];
}
@end
