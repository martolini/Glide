//
//  ViewController.h
//  FindIt
//
//  Created by Martin Skow Røed on 22.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "JASidePanelController.h"

@interface WelcomeViewController : JASidePanelController <PFLogInViewControllerDelegate>

@property (strong, nonatomic) PFLogInViewController *login;

@end
