//
//  UIView+MZCLayout.m
//  textsss
//
//  Created by bocang02 on 16/8/11.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import "UIView+MZCLayout.h"
#include <objc/runtime.h>

@implementation UIView (MZCLayout)

static const void *MZCLayoutGravityKey = &MZCLayoutGravityKey;

static const void *MZCLayoutWidthKey = &MZCLayoutWidthKey;
static const void *MZCLayoutHeightKey = &MZCLayoutHeightKey;

static const void *MZCLayoutWeigthKey = &MZCLayoutWeigthKey;



static const void *MZCLayoutMarginKey = &MZCLayoutMarginKey;
static const void *MZCLayoutMarginTopKey = &MZCLayoutMarginTopKey;
static const void *MZCLayoutMarginBottomKey = &MZCLayoutMarginBottomKey;
static const void *MZCLayoutMarginLeftKey = &MZCLayoutMarginLeftKey;
static const void *MZCLayoutMarginRightKey = &MZCLayoutMarginRightKey;


static const void *MZCLayoutFillWidthKey = &MZCLayoutFillWidthKey;
static const void *MZCLayoutFillHeightKey = &MZCLayoutFillHeightKey;



#pragma mark - mzcLayoutGravity
- (void) setMzcLayoutGravity:(MZCLayoutGravity)mzcLayoutGravity {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithUnsignedInteger:mzcLayoutGravity];
    objc_setAssociatedObject(self, &MZCLayoutGravityKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (MZCLayoutGravity) mzcLayoutGravity {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutGravityKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber unsignedIntegerValue];
    }
    return 0.0f;
}


#pragma mark - mzcLayoutWidth
- (void) setMzcLayoutWidth:(CGFloat)mzcLayoutWidth {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutWidth];
    objc_setAssociatedObject(self, &MZCLayoutWidthKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutWidth {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutWidthKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}
#pragma mark - mzcLayoutHeight
- (void) setMzcLayoutHeight:(CGFloat)mzcLayoutHeight {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutHeight];
    objc_setAssociatedObject(self, &MZCLayoutHeightKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutHeight {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutHeightKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}


#pragma mark - mzcLayoutWeight
- (void) setMzcLayoutWeight:(CGFloat)mzcLayoutWeight {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutWeight];
    objc_setAssociatedObject(self, &MZCLayoutWeigthKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutWeight {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutWeigthKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}




#pragma mark - mzcLayoutMargin
- (void) setMzcLayoutMargin:(CGFloat)mzcLayoutMargin {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutMargin];
    objc_setAssociatedObject(self, &MZCLayoutMarginKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutMargin {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutMarginKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}

#pragma mark - mzcLayoutMarginTop
- (void) setMzcLayoutMarginTop:(CGFloat)mzcLayoutMarginTop {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutMarginTop];
    objc_setAssociatedObject(self, &MZCLayoutMarginTopKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutMarginTop {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutMarginTopKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}

#pragma mark - mzcLayoutMarginBottom
- (void) setMzcLayoutMarginBottom:(CGFloat)mzcLayoutMarginBottom {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutMarginBottom];
    objc_setAssociatedObject(self, &MZCLayoutMarginBottomKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutMarginBottom {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutMarginBottomKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}

#pragma mark - mzcLayoutMargin
- (void) setMzcLayoutMarginLeft:(CGFloat)mzcLayoutMarginLeft {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutMarginLeft];
    objc_setAssociatedObject(self, &MZCLayoutMarginLeftKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutMarginLeft {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutMarginLeftKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}

#pragma mark - mzcLayoutMargin
- (void) setMzcLayoutMarginRight:(CGFloat)mzcLayoutMarginRight {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithFloat:mzcLayoutMarginRight];
    objc_setAssociatedObject(self, &MZCLayoutMarginRightKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat) mzcLayoutMarginRight {
    if (![self isKindOfClass:[UIView class]]) {
        return 0.0f;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutMarginRightKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber floatValue];
    }
    return 0.0f;
}





#pragma mark - mzcLayoutFillWidth
- (void) setMzcLayoutFillWidth:(BOOL)mzcLayoutFillWidth {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithBool:mzcLayoutFillWidth];
    objc_setAssociatedObject(self, &MZCLayoutFillWidthKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL) mzcLayoutFillWidth {
    if (![self isKindOfClass:[UIView class]]) {
        return NO;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutFillWidthKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber boolValue];
    }
    return NO;
}
#pragma mark - mzcLayoutFillHeight
- (void) setMzcLayoutFillHeight:(BOOL)mzcLayoutFillHeight {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    NSNumber* tempNumber = [NSNumber numberWithBool:mzcLayoutFillHeight];
    objc_setAssociatedObject(self, &MZCLayoutFillHeightKey, tempNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL) mzcLayoutFillHeight {
    if (![self isKindOfClass:[UIView class]]) {
        return NO;
    }
    NSNumber* tempNumber = objc_getAssociatedObject(self, &MZCLayoutFillHeightKey);
    if ([tempNumber isKindOfClass:[NSNumber class]]) {
        return [tempNumber boolValue];
    }
    return NO;
}

@end
