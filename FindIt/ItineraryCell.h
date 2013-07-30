//
//  ItineraryCell.h
//  Glide
//
//  Created by Martin Skow Røed on 29.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItineraryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *oneliner;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UITextView *itineraryText;
@property (weak, nonatomic) UIView *presentedView;

- (void) initialize;
- (void) switchView;
@end
