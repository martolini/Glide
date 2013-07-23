//
//  ViewController.m
//  FindIt
//
//  Created by Martin Skow Røed on 22.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import "WelcomeViewController.h"
#import <Parse/Parse.h>
#import "LeftSideViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize login;

#pragma LoginDelegate

- (void) logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    NSLog(@"logged in");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"login failed");
}

- (void) logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    NSLog(@"cancelled login");
}

#pragma Initializing

- (void) initializeLogin {
    login = [[PFLogInViewController alloc] init];
    login.fields = PFLogInFieldsFacebook;
    login.logInView.logo = nil;
    login.delegate = self;
    login.facebookPermissions = @[@"user_about_me"];
}

#pragma Lifecycle

- (void) awakeFromNib {
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setRightPanel:nil];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"Itinerary"]];
    [(LeftSideViewController *)self.leftPanel setMainController:self];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeLogin];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (![PFUser currentUser]) {
        [self presentViewController:login animated:NO completion:nil];
    }
    else {
        NSLog(@"is user");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
