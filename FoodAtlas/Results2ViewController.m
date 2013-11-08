//
//  Results2ViewController.m
//  FoodAtlas
//
//  Created by Dina Li on 10/31/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "Results2ViewController.h"

@interface Results2ViewController ()

@end

@implementation Results2ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return ((self.results != nil && [self.results count] > 0) ? [self.results count] : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary * sortMeDictionary = [[NSDictionary alloc]initWithDictionary: _results];
    
    NSArray * sortedFieldsArray = [sortMeDictionary keysSortedByValueUsingSelector:@selector(localizedStandardCompare:)];
    
    //text is the key at the given indexPath
    // NSString *keyAtIndexPath = [[self.results allKeys] objectAtIndex:indexPath.row];
    
    NSString *keyAtIndexPath = [sortedFieldsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = keyAtIndexPath;
    
    //detail text is the value associated with the key above
    id detailValue = [self.results objectForKey:keyAtIndexPath];
    
    //figure out if the value is a NSDecimalNumber or NSString
    if ([detailValue isKindOfClass:[NSString class]])
    {
        //value is a NSString, just set it
        cell.detailTextLabel.text = (NSString *)detailValue;
        
    }
    else if ([detailValue isKindOfClass:[NSDecimalNumber class]])
    {
        //value is a NSDecimalNumber, format the result as a double
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%0.0f", [detailValue doubleValue]];
    }
    else {
        //not a NSDecimalNumber or a NSString,
        cell.detailTextLabel.text = @"N/A";
    }
	cell.textLabel.font = [UIFont systemFontOfSize:13.0];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
