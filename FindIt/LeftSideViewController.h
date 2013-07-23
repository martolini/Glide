//
//  LeftSideViewController.h
//  FindIt
//
//  Created by Martin Skow Røed on 22.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "WelcomeViewController.h"

@interface LeftSideViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *tableArray;
@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) WelcomeViewController *mainController;

@end
