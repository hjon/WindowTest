//
//  ViewController.m
//  WindowTest
//
//  Created by Jon Hjelle on 3/18/15.
//  Copyright (c) 2015 Jon Hjelle. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.frame = CGRectInset(self.view.window.bounds, 50.0, 50.0);
    NSLog(@"View's bounds: %@", NSStringFromCGRect(self.view.bounds));
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)exit:(id)sender {
    [self.delegate exitFromSecondWindow];
}

- (IBAction)showAlert:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Testing"
                                                    message:@"Testing orientation"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
