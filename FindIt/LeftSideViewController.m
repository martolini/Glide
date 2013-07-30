//
//  LeftSideViewController.m
//  FindIt
//
//  Created by Martin Skow Røed on 22.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import "LeftSideViewController.h"
#import "UIViewController+JASidePanel.h"


@interface LeftSideViewController ()

@end

@implementation LeftSideViewController
@synthesize tableArray, viewControllers;
@synthesize mainController;

#pragma mark TableView

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = [self.tableArray objectAtIndex:indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (mainController.centerPanel == [viewControllers objectAtIndex:indexPath.row]) {
        [mainController showCenterPanelAnimated:YES];
    }
    else
        [mainController setCenterPanel:[viewControllers objectAtIndex:indexPath.row]];
}

#pragma mark LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableArray = [NSMutableArray arrayWithObjects:[[PFUser currentUser] objectForKey:@"displayName"], @"Browse locals", @"Search by city", @"Become a local", nil];
    viewControllers = [NSArray arrayWithObjects:
                       [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileNav"],
                       [self.storyboard instantiateViewControllerWithIdentifier:@"BrowseNav"],
                       [self.storyboard instantiateViewControllerWithIdentifier:@"Third"],
                       [self.storyboard instantiateViewControllerWithIdentifier:@"Third"],
                       nil];

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"memory warning");
    // Dispose of any resources that can be recreated.
}



@end
