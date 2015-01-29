//
//  CountdownViewController.m
//  AppBuddy GmbH
//
//  Created by Malte Fentroß on 13.01.15.
//  Copyright (c) 2015 AppBuddy GmbH. All rights reserved.
//

#import "ABCountdownViewController.h"
#include <math.h>

@interface ABCountdownViewController ()

@end

@implementation ABCountdownViewController {
    NSTimer *_timer;
}

- (ABCountdownViewController *) initWithDuration:(float)duration message: (NSString *)message delegate:(id) delegate customXib:(NSString *)xibName {
    
    if(xibName == nil)
        self = [super init];
    else
        self = [self initWithNibName:xibName bundle:nil];
    
    
    
    if(self) {
        __duration = duration;
        __message = message;
        __delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!isnan(__duration)) { // if duration is set
        [self _setNumberLabel:__duration];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    if(!isnan(__duration)) { // if duration is set
//        [self _startCountdown];
//    }
    
}

-(void)start {
    if(_timer == nil) {
        [self _startCountdown];
    } else {
        NSLog(@"Already started countdown");
    }
}

- (void)_startCountdown {
    NSLog(@"--- Starting countdown for ABCountdownViewController ---");
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(_updateCountdown)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)_updateCountdown {
    if(__duration < 0.9999f) {
        
        [_timer invalidate]; // stopping timer
        _timer = nil;
        
        // countdown stopped! perform delegate!
        if ([__delegate respondsToSelector:@selector(countdownEnded:)]) {
            // perform countdown ended on consumer if delegate method is implemented
            [__delegate performSelector:@selector(countdownEnded:) withObject:self];
        }
        
    } else {
        __duration--; // count down duration 1 second
        
        
        if ([__delegate respondsToSelector:@selector(updateCountForCountdown:)]) {
            
            // perform countdown on consumer if delegate method is implemented
            //
            [__delegate performSelector:@selector(updateCountForCountdown:) withObject:self];
        }
        
        [self _setNumberLabel:__duration];
    }
}

- (NSNumber *) getCurrentCount {
    return [NSNumber numberWithFloat:__duration];
}

- (void)_setNumberLabel:(float) number {
    _numberLabel.text = [NSString stringWithFormat:@"%@ %i", __message, (int) number];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
