//
//  Created by Performante on 07/03/16.
//  Copyright © 2016 Performante. All rights reserved.
//

#import "ViewController.h"
#import <PerformanteSDK/PerformanteSDK.h>

@interface ViewController()

@property(nonatomic, strong) PFSDK *performanteSDK;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIButton *eventButton;

@end

@implementation ViewController

- (instancetype)initWithPerformanteSDK:(PFSDK *)performanteSDK
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.performanteSDK = performanteSDK;
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor colorWithRed:0.26 green:0.65 blue:0.31 alpha:1];
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.eventButton];
    [self setupLayout];
}

#pragma mark - Subviews

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.contentMode = UIViewContentModeScaleAspectFit;
        _logoImageView = view;
    }
    return _logoImageView;
}

- (UIButton *)eventButton
{
    if (!_eventButton) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button setTitle:@"Send event" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor yellowColor]];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(eventButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _eventButton = button;
    }
    return _eventButton;
}

#pragma mark - UI Actions

- (void)eventButtonAction:(id)sender
{
    [self.performanteSDK sendAppEvent:@"Tap_button_event"];
}

#pragma mark - Setup layout

- (void)setupLayout
{
    NSArray<NSLayoutConstraint *> *horizontalLogoConstraints = [NSLayoutConstraint
                                                constraintsWithVisualFormat:@"H:|-(100)-[view]-(100)-|"
                                                options:(NSLayoutFormatOptions)0
                                                metrics:nil
                                                views:@{@"view": self.logoImageView}];
    
    NSArray<NSLayoutConstraint *> *horizontalButtonConstraints = [NSLayoutConstraint
                                                         constraintsWithVisualFormat:@"H:|[button]|"
                                                         options:(NSLayoutFormatOptions)0
                                                         metrics:nil
                                                         views:@{@"button": self.eventButton}];
    
    NSArray<NSLayoutConstraint *> *verticalConstraints = [NSLayoutConstraint
                                                          constraintsWithVisualFormat:@"V:|[view]-[button(50)]|"
                                                          options:(NSLayoutFormatOptions)0
                                                          metrics:nil
                                                          views:@{
                                                                  @"view": self.logoImageView,
                                                                  @"button": self.eventButton
                                                                  }];
    
    [self.logoImageView.superview addConstraints:horizontalLogoConstraints];
    [self.eventButton.superview addConstraints:horizontalButtonConstraints];
    [self.logoImageView.superview addConstraints:verticalConstraints];
}

@end
