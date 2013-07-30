//
//  ItineraryCell.m
//  Glide
//
//  Created by Martin Skow Røed on 29.07.13.
//  Copyright (c) 2013 Martin Skow Røed. All rights reserved.
//

#import "ItineraryCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ItineraryCell
@synthesize frontView, backView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ItineraryCell" owner:self options:nil];
        for (UIView *view in nib) {
            if ([view isKindOfClass:[UITableViewCell class]])
                self = (ItineraryCell *)view;
            break;
        }
        [self.contentView addSubview:self.frontView];
        self.presentedView = self.frontView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.itineraryText setEditable:NO];
    }
    return self;
}

- (void) initialize {
    [self.profileImage.layer setCornerRadius:10.0f];
    self.profileImage.layer.masksToBounds = YES;
    [self.contentView addSubview:frontView];
}

- (void) switchView {
    UIView *fromView = self.presentedView;
    UIView *toView;
    if (self.presentedView == self.frontView)
        toView = self.backView;
    else toView = self.frontView;
    [UIView transitionFromView:fromView toView:toView duration:1 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
        if (finished) {
            self.presentedView = toView;
        }
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
