//
//  DummyViewController.m
//  WindowTest
//
//  Created by Jon Hjelle on 3/18/15.
//  Copyright (c) 2015 Jon Hjelle. All rights reserved.
//

#import "DummyViewController.h"
#import "ViewController.h"
#import "Window.h"

@interface DummyViewController ()
@property (nonatomic, strong) UIWindow* secondWindow;
@end

@implementation DummyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupWindow];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)setupWindow {
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController* viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"viewController"];
    viewController.delegate = self; // Quick, hacky delegate style

    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGRect windowFrame = CGRectMake(0.0f, 0.0f, MIN(screenSize.width, screenSize.height), MAX(screenSize.width, screenSize.height));
    self.secondWindow = [[Window alloc] initWithFrame:windowFrame];

    self.secondWindow.rootViewController = viewController;
    [self.secondWindow makeKeyAndVisible];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.frame = CGRectInset(self.view.window.bounds, 30.0, 30.0);
}

- (void)exitFromSecondWindow {
    [self performSegueWithIdentifier:@"unwindToExitViewController" sender:self];
}

@end
