//
//  UIView+FitToSubViews.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/22/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "UIView+FitToSubViews.h"

@implementation UIView (FitToSubViews)

- (void)sizeToFitSubviews {
    CGRect sumRect = CGRectZero;
    
    for (UIView * view in self.subviews) {
        sumRect = CGRectUnion(sumRect, view.frame);
    }
    sumRect.origin = CGPointZero;
    self.bounds = sumRect;
}
@end
