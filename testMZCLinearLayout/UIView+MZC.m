//
//  UIView+MZC.m
//  textsss
//
//  Created by bocang02 on 16/8/11.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import "UIView+MZC.h"
#include <objc/runtime.h>

@implementation UIView (MZC)

static char mzcIDKey;
- (void) setMzcID:(NSString *)mzcID {
    if (![self isKindOfClass:[UIView class]]) {
        return;
    }
    objc_setAssociatedObject(self, &mzcIDKey, mzcID, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString*) mzcID {
    if (![self isKindOfClass:[UIView class]]) {
        return nil;
    }
    NSString* tempString = objc_getAssociatedObject(self, &mzcIDKey);
    return tempString;
}

- (UIView*) mzcFindViewByID:(NSString*) mzcID
{
    if (!mzcID) {
        return nil;
    }
    if (![self isKindOfClass:[UIView class]]) {
        return nil;
    }
    UIView* tempView = nil;
    for (UIView* subview in self.subviews) {
        @autoreleasepool {
            if (subview.mzcID && [subview.mzcID isEqualToString:mzcID]) {
                tempView = subview;
                break;
            } else {
                UIView* tempView2 = [subview mzcFindViewByID:mzcID];
                if (tempView2) {
                    tempView = tempView2;
                    break;
                }
            }
        }
    }
    return tempView;
}

@end
