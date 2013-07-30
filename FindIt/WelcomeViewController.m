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
#import "MBProgressHUD.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize login;

#pragma LoginDelegate

- (void) logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSDictionary *userdata = (NSDictionary *)result;
            NSString *facebookID = userdata[@"id"];
            NSString *name = userdata[@"name"];
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            [[PFUser currentUser] setObject:facebookID forKey:@"facebookID"];
            [[PFUser currentUser] setObject:name forKey:@"displayName"];
            [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded && !error) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                    NSLog(@"logged in");

                }
            }];
        }
    }];
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

- (void) initializeSidePanels {
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setRightPanel:nil];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"BrowseNav"]];
    [(LeftSideViewController *)self.leftPanel setMainController:self];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeLogin];
    PFObject *obj = [PFObject objectWithClassName:@"Local"];
    [obj setObject:[PFUser currentUser] forKey:@"user"];
    [obj setObject:@"super long text i don't know what to tell you mon!" forKey:@"itinerary"];
    [obj setObject:@"Philadelphia" forKey:@"city"];
    [obj setObject:[NSNumber numberWithInt:25] forKey:@"rate"];
    [obj save];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (![PFUser currentUser]) {
        [self presentViewController:login animated:NO completion:nil];
    }
    else {
        [self initializeSidePanels];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
