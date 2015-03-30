//
//  Window.m
//  WindowTest
//
//  Created by Jon Hjelle on 3/30/15.
//  Copyright (c) 2015 Jon Hjelle. All rights reserved.
//

#import "Window.h"

@implementation Window {
    CGPoint oldPoint;
    NSTimeInterval timestamp;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//        if (event.timestamp == timestamp) {
//            point = oldPoint;
//        } else {
//            oldPoint = point;
//            timestamp = event.timestamp;
//        }
    UIView* aView = [super hitTest:point withEvent:event];
    NSLog(@"hitTest Event: %@; point: %@", event, NSStringFromCGPoint(point));
    return aView;
}

#pragma mark - Touch handling


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan event: %@", event);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved event: %@", event);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded event: %@", event);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancelled event: %@", event);
}

@end
