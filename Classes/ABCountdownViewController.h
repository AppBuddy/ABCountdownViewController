//
//  CountdownViewController.h
//  OnAir
//
//  Created by Malte Fentroß on 13.01.15.
//  Copyright (c) 2015 OnAir UG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABCountdownViewController;

@protocol ABCountdownDelegate <NSObject>

@optional
- (void) updateCountForCountdown:(ABCountdownViewController *)countdown; // notify always when countdown decreases
- (void) countdownEnded:(ABCountdownViewController *)countdown; // notify when countdown has come to an end

@end

@interface ABCountdownViewController : UIViewController

// the label to display the current count
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;

// the duration of the countdown
@property (assign) float _duration;

// the consumer
@property (strong, nonatomic) id _delegate;

// this could be a message to add to the number label
@property (strong, nonatomic) NSString *_message;

- (ABCountdownViewController *) initWithDuration:(float)duration message: (NSString *)message delegate:(id) delegate customXib:(NSString *)xibName;

// this should only be used when view will appear cannot be called
- (void) start;


- (NSNumber *) getCurrentCount;

@end
