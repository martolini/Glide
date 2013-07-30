//
//  ProfileViewController.m
//  Glide
//
//  Created by Martin Skow Røed on 29.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import "BrowseViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>
#import "ItineraryCell.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 177.0;
}

- (ItineraryCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"ItineraryCell";
    ItineraryCell *cell = (ItineraryCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ItineraryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItineraryCell *cell = (ItineraryCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell switchView];
}

@end
