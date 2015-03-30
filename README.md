# WindowTest
This is a project demonstrating a bug where the wrong point is passed to
`hitTest:withEvent:` and `touchesBegan:withEvent:` for a second UIWindow. Filed as rdar://20350412.

## Steps to Reproduce
1. Launch the attached example app (on device or in the iOS Simulator)
2. Rotate so the view is displayed in landscape
3. Tap *Button*
4. When the yellow view appears, try to tap *Button 2*
5. Look in the Console for two logs containing "hitTest Event:" and the same timestamp
6. Also look in the Console for logs about "touchesBegan", "touchesMoved", "touchesEnded", etc.

## Expected Results
The "hitTest Event:" logs with the same timestamp should be logging the same point. Similarly, the logs for "touchesBegan", "touchesEnded", etc. should be logging points in roughly the same location.

## Actual Results
For the "hitTest Event:" logs, the y-coordinate of the second event is different than the first (and appears to be capped past a certain point). Similarly, the y-coordinate of "location in window" and "location in view" for the "touchesBegan" log and the "touchesEnded" and "touchesMoved" log differ by more than a few points.

## Regression
This works correctly on iOS 7. It appears to affect every version of iOS 8 (Simulator and device). Specifically I have tested iPhone 5S with iOS 8.0.2, iPhone 6 with iOS 8.1.3, and iOS Simulator (iPhone 6) with iOS 8.1 and 8.2.

This works correctly in iOS 8.x if the second window is shown while the device is in portrait. If the second window is shown in landscape, even rotating to portrait does not fix the problem.

## Additional information
In this specific case, I can work around the behavior by matching timestamps of the events to alter the point to have the right subview returned from `-hitTest:withEvent:` (in my example implementation of `-hitTest:withEvent:`, I have some commented out code that does this). However, I cannot alter the point of the touch. Therefore, I can workaround the behavior for simple taps, but I believe this is still problematic for controls or gesture recognizers that rely on the delta between the location of the touch beginning and any subsequent moves or ends.

The same or a similar problem is discussed in the [Developer Forums](https://devforums.apple.com/message/1050335#1050335).
