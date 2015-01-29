//
//  ViewController.m
//  Example
//
//  Created by Malte Fentroß on 29.01.15.
//  Copyright (c) 2015 AppBuddy GmbH. All rights reserved.
//

#import "ViewController.h"
#import "ABCountdownViewController.h"

@interface ViewController () {
    ABCountdownViewController *_cvc;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cvc = [[ABCountdownViewController alloc] initWithDuration:30.0 message:@"Counting down" delegate:self customXib:nil];
    
    // this should be done via your view tools
    _cvc.view.frame = self.view.frame;
    [self.view addSubview:_cvc.view];
    
    // start countdown
    [_cvc start];
    
}

#pragma mark - ABCountdownViewController delegates (optional)


- (void) updateCountForCountdown:(ABCountdownViewController *)countdown {
    NSLog(@"Counted down one value");
}

- (void) countdownEnded:(ABCountdownViewController *)countdown {
    NSLog(@"Countdown ended. Do whatever you want to do now!");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
