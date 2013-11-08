//
//  Results2ViewController.h
//  FoodAtlas
//
//  Created by Dina Li on 10/31/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Results2ViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *results;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBtn;

- (IBAction)done:(id)sender;


@end
