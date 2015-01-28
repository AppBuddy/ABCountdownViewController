//
//  ViewController.m
//  ABCountdownViewController
//
//  Created by Malte Fentroß on 28.01.15.
//  Copyright (c) 2015 AppBuddy GmbH. All rights reserved.
//

#import "ViewController.h"
#import "ABCountdownViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ABCountdownViewController * vc = [[ABCountdownViewController alloc] initWithDuration:30.0 message:@"Counting" delegate:self customXib:nil];
    
    vc.view.frame = self.view.frame;
    [self.view addSubview:vc.view];
    [vc start];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
