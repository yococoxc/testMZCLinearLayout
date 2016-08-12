//
//  MZCLinearLayout.m
//  textsss
//
//  Created by bocang02 on 16/8/11.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import "MZCLinearLayout.h"

#import "NSObject+XWAdd.h"

@implementation MZCLinearLayout
{
    BOOL isOK;
}

- (instancetype) initWithOrientation:(MZCLayoutOrientation)orientation
{
    if (self = [super init]) {
        _orientation = orientation;
    }
    return self;
}

+ (instancetype) orientation:(MZCLayoutOrientation)orientation
{
    return [[[self class] alloc] initWithOrientation:orientation];;
}

- (void) dealloc
{
    NSLog(@"%s",__func__);
    
    
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    
    [self changedWithSubView];
}


- (void) setFrame:(CGRect)frame
{
    NSLog(@"%@ -------<> %@", self.mzcID, NSStringFromCGRect(frame));
    if (CGRectEqualToRect(self.frame, frame)) {
        return;
    }
    
    [super setFrame:frame];
    
    [self changedWithSubView];
}

- (void)addSubview:(UIView *)view
{
    [super addSubview:view];
    
    [self changedWithSubView];
    
}


- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    
    [self.superview xw_addObserverBlockForKeyPath:@"frame" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
        if (obj == self.superview) {
            [self changedWithSuperView];
        }
        
        [self changedWithSubView];
    }];
    
//    [self.superview addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:@"test_super_view"];
    if (!isOK) {
        
        isOK = YES;
    } else {
        
        isOK = NO;
    }
    
    
    if (self.mzcID && [self.mzcID isEqualToString:@"myLayout"]) {
        NSLog(@"superview %@", self.superview);
    }
    NSLog(@"%s   %@", __func__,self);
    
    [self changedWithSuperView];
    
}


- (void) willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
    
    [self.superview removeObserver:self forKeyPath:@"frame" context:@"test_super_view"];
}

- (void) didMoveToWindow
{
    [super didMoveToWindow];
    
    NSLog(@"%s   %@", __func__,self);
    
//    if (isOK) {
//
//    }
    
}


//#pragma mark - 事件响应
//- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    if (object == self.superview) {
//        [self changedWithSuperView];
//    }
//    
//    [self changedWithSubView];
//}



#pragma mark -
- (void) changedWithSuperView {
    if (![self.superview isKindOfClass:[UIView class]]) {
        return;
    }
    
    CGRect tempFrame = CGRectZero;
    BOOL isGravity = NO;
    
    if (self.mzcLayoutFillWidth && self.mzcLayoutFillHeight) {
        tempFrame.size.width = CGRectGetWidth(self.superview.bounds);
        tempFrame.size.height = CGRectGetHeight(self.superview.bounds);
        
    } else if (self.mzcLayoutFillWidth && !self.mzcLayoutFillHeight) {
        tempFrame.size.width = CGRectGetWidth(self.superview.bounds);
        tempFrame.size.height = self.mzcLayoutHeight;
        
        isGravity = YES;
    } else if (self.mzcLayoutFillHeight && !self.mzcLayoutFillWidth) {
        tempFrame.size.height = CGRectGetHeight(self.superview.bounds);
        tempFrame.size.width = self.mzcLayoutWidth;
        
        isGravity = YES;
    } else {
        tempFrame.size.width = self.mzcLayoutWidth;
        tempFrame.size.height = self.mzcLayoutHeight;
        
        isGravity = YES;
    }
    
    if (isGravity) {
        if (self.mzcLayoutGravity == MZCLayoutGravityTop) {
            tempFrame.origin.y = 0;
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityBottom) {
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityLeft) {
            tempFrame.origin.x = 0;
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityRight) {
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityCenter) {
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth / 2.0;
            }
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight / 2.0;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityCenterTop) {
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth / 2.0;
            }
            tempFrame.origin.y = 0;
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityCenterBottom) {
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth / 2.0;
            }
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityCenterLeft) {
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight/2;
            }
            tempFrame.origin.x = 0;
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityCenterRight) {
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth;
            }
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight/2;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityLeftTop) {
            tempFrame.origin.x = 0;
            tempFrame.origin.y = 0;
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityLeftBottom) {
            tempFrame.origin.x = 0;
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityRightTop) {
            tempFrame.origin.y = 0;
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth;
            }
            
        } else if (self.mzcLayoutGravity == MZCLayoutGravityRightBottom) {
            CGFloat tempWidth = CGRectGetWidth(self.superview.bounds) - CGRectGetWidth(tempFrame);
            if (tempWidth > 0) {
                tempFrame.origin.x = tempWidth;
            }
            CGFloat tempHeight = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(tempFrame);
            if (tempHeight > 0) {
                tempFrame.origin.y = tempHeight;
            }
            
        }
    }
    self.frame = tempFrame;
}

- (void) changedWithSubView {
    if (self.orientation == MZCLayoutOrientationHorizontal) {
        NSLog(@"MZCLayoutOrientationHorizontal-------------<>>>>>>>");
        /****************************************
        //水平方向
         *****************************************/
        CGFloat weightCount = 0;
        CGFloat tempWidth = 0;
        
        //统计垂直方向的所有Margin值（left、right）
        CGFloat theHorizontalMargin = 0;
        
        for (UIView* subview in self.subviews) {
            /********************
             统计垂直方向的所有Margin值（left、right）
             ********************/
            if (subview.mzcLayoutMargin != 0) {
                //left
                theHorizontalMargin += subview.mzcLayoutMargin;
                //right
                theHorizontalMargin += subview.mzcLayoutMargin;
            } else {
                if (subview.mzcLayoutMarginLeft != 0) {
                    //left
                    theHorizontalMargin += subview.mzcLayoutMarginLeft;
                }
                if (subview.mzcLayoutMarginRight != 0) {
                    //right
                    theHorizontalMargin += subview.mzcLayoutMarginRight;
                }
            }
            
            if (subview.mzcLayoutWeight != 0) {
                weightCount += subview.mzcLayoutWeight;
            } else {
                tempWidth += subview.mzcLayoutWidth;
            }
        }
        tempWidth += ([self.subviews count] - 1) * self.gap;
        tempWidth += theHorizontalMargin;
        
        CGFloat tempWeightWidth = 0;
        if (weightCount > 0) {
            tempWeightWidth = (CGRectGetWidth(self.bounds) - tempWidth) / weightCount;
        }
        
        CGFloat tempX = 0;
        
        for (UIView* subview in self.subviews) {
            CGRect tempFrame = CGRectZero;
            
            /********************
             初始化的 X 值
             ********************/
            if (subview.mzcLayoutMargin != 0) {
                //left
                tempX += subview.mzcLayoutMargin;
            } else if (subview.mzcLayoutMarginLeft != 0) {
                //right
                tempX += subview.mzcLayoutMarginLeft;
            }
            
            
            if (subview.mzcLayoutWeight > 0) {
                tempFrame.size.width = tempWeightWidth * subview.mzcLayoutWeight;
                
                if (subview.mzcLayoutFillHeight && !subview.mzcLayoutFillWidth) {
                    tempFrame.size.height = CGRectGetHeight(self.bounds);
                    
                } else {
                    tempFrame.size.height = subview.mzcLayoutHeight;
                }
                /*****************************************************************/
            } else {
                if (subview.mzcLayoutFillHeight && subview.mzcLayoutFillWidth) {
                    tempFrame.size.width = CGRectGetWidth(self.bounds);
                    tempFrame.size.height = CGRectGetHeight(self.bounds);
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //Left
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        
                        //top
                        tempFrame.size.height -= subview.mzcLayoutMargin;
                        //bottom
                        tempFrame.size.height -= subview.mzcLayoutMargin;
                    } else {
                        //Left
                        tempFrame.size.width -= subview.mzcLayoutMarginLeft;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMarginRight;
                        
                        //top
                        tempFrame.size.height -= subview.mzcLayoutMarginTop;
                        //bottom
                        tempFrame.size.height -= subview.mzcLayoutMarginBottom;
                    }
                    /*****************************************************************/
                } else if (subview.mzcLayoutFillHeight && !subview.mzcLayoutFillWidth) {
                    tempFrame.size.height = CGRectGetHeight(self.bounds);
                    tempFrame.size.width = subview.mzcLayoutWidth;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //top
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        //bottom
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                    } else {
                        //top
                        tempFrame.size.width -= subview.mzcLayoutMarginTop;
                        //bottom
                        tempFrame.size.width -= subview.mzcLayoutMarginBottom;
                    }
                    /*****************************************************************/
                } else if (subview.mzcLayoutFillWidth && !subview.mzcLayoutFillHeight) {
                    tempFrame.size.width = CGRectGetWidth(self.bounds);
                    tempFrame.size.height = subview.mzcLayoutHeight;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //left
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                    } else {
                        //left
                        tempFrame.size.width -= subview.mzcLayoutMarginLeft;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMarginRight;
                    }
                    /*****************************************************************/
                } else {
                    tempFrame.size.width = subview.mzcLayoutWidth;
                    tempFrame.size.height = subview.mzcLayoutHeight;
                    
                    /*****************************************************************/
                }
            }
            
            tempFrame.origin.x = tempX;
            
            if (subview.mzcLayoutGravity == MZCLayoutGravityBottom) {
                CGFloat tempHeight = CGRectGetHeight(self.bounds) - CGRectGetHeight(tempFrame);
                if (tempHeight > 0) {
                    tempFrame.origin.y = tempHeight;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //bottom
                        tempFrame.origin.y -= subview.mzcLayoutMargin;
                    } else {
                        //bottom
                        tempFrame.origin.y -= subview.mzcLayoutMarginBottom;
                    }
                }
            } else if (subview.mzcLayoutGravity == MZCLayoutGravityCenter) {
                CGFloat tempHeight = CGRectGetHeight(self.bounds) - CGRectGetHeight(tempFrame);
                if (tempHeight > 0) {
                    tempFrame.origin.y = tempHeight / 2.0;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //top
                        tempFrame.origin.y += subview.mzcLayoutMargin;
                        //bottom
                        tempFrame.origin.y -= subview.mzcLayoutMargin;
                    } else {
                        //top
                        tempFrame.origin.y += subview.mzcLayoutMarginTop;
                        //bottom
                        tempFrame.origin.y -= subview.mzcLayoutMarginBottom;
                    }
                }
            } else if (subview.mzcLayoutGravity == MZCLayoutGravityTop || subview.mzcLayoutGravity == MZCLayoutGravityNone) {
                if (subview.mzcLayoutMargin != 0) {
                    //top
                    tempFrame.origin.y += subview.mzcLayoutMargin;
                } else {
                    //top
                    tempFrame.origin.y += subview.mzcLayoutMarginTop;
                }
            }
            
            
            subview.frame = tempFrame;
            
            tempX = subview.frame.size.width + subview.frame.origin.x;
            
            if (subview.mzcLayoutMargin != 0) {
                //right
                tempX += subview.mzcLayoutMargin;
            } else {
                //right
                tempX += subview.mzcLayoutMarginRight;
            }
            
            tempX += self.gap;
            
            NSLog(@"%@", subview);
        }
    } else {
        /****************************************
         //垂直方向
         *****************************************/
        CGFloat weightCount = 0;
        CGFloat tempHeight = 0;
        
        //统计垂直方向的所有Margin值（top、bottom）
        CGFloat theVerticalMargin = 0;
        
        for (UIView* subview in self.subviews) {
            /********************
             统计垂直方向的所有Margin值（top、bottom）
             ********************/
            if (subview.mzcLayoutMargin != 0) {
                //top
                theVerticalMargin += subview.mzcLayoutMargin;
                //bottom
                theVerticalMargin += subview.mzcLayoutMargin;
            } else {
                if (subview.mzcLayoutMarginTop != 0) {
                    //top
                    theVerticalMargin += subview.mzcLayoutMarginTop;
                }
                if (subview.mzcLayoutMarginBottom != 0) {
                    //bottom
                    theVerticalMargin += subview.mzcLayoutMarginBottom;
                }
            }
            
            if (subview.mzcLayoutWeight != 0) {
                weightCount += subview.mzcLayoutWeight;
            } else {
                tempHeight += subview.mzcLayoutHeight;
            }
        }
        tempHeight += ([self.subviews count] - 1) * self.gap;
        tempHeight += theVerticalMargin;
        
        CGFloat tempWeightHeight = 0;
        if (weightCount > 0) {
            tempWeightHeight = (CGRectGetHeight(self.bounds) - tempHeight) / weightCount;
        }
        
        CGFloat tempY = 0;
        
        for (UIView* subview in self.subviews) {
            CGRect tempFrame = CGRectZero;
            
            /********************
             初始化的 Y 值
             ********************/
            if (subview.mzcLayoutMargin != 0) {
                //top
                tempY += subview.mzcLayoutMargin;
            } else if (subview.mzcLayoutMarginTop != 0) {
                //top
                tempY += subview.mzcLayoutMarginTop;
            }
            
            
            if (subview.mzcLayoutWeight > 0) {
                tempFrame.size.height = tempWeightHeight * subview.mzcLayoutWeight;
                
                if (subview.mzcLayoutFillWidth && !subview.mzcLayoutFillHeight) {
                    tempFrame.size.width = CGRectGetWidth(self.bounds);
                    
                } else {
                    tempFrame.size.width = subview.mzcLayoutWidth;
                }
                /*****************************************************************/
            } else {
                if (subview.mzcLayoutFillWidth && subview.mzcLayoutFillHeight) {
                    tempFrame.size.width = CGRectGetWidth(self.bounds);
                    tempFrame.size.height = CGRectGetHeight(self.bounds);
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //Left
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        
                        //top
                        tempFrame.size.height -= subview.mzcLayoutMargin;
                        //bottom
                        tempFrame.size.height -= subview.mzcLayoutMargin;
                    } else {
                        //Left
                        tempFrame.size.width -= subview.mzcLayoutMarginLeft;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMarginRight;
                        
                        //top
                        tempFrame.size.height -= subview.mzcLayoutMarginTop;
                        //bottom
                        tempFrame.size.height -= subview.mzcLayoutMarginBottom;
                    }
                    /*****************************************************************/
                } else if (subview.mzcLayoutFillWidth && !subview.mzcLayoutFillHeight) {
                    tempFrame.size.width = CGRectGetWidth(self.bounds);
                    tempFrame.size.height = subview.mzcLayoutHeight;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //Left
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMargin;
                    } else {
                        //Left
                        tempFrame.size.width -= subview.mzcLayoutMarginLeft;
                        //right
                        tempFrame.size.width -= subview.mzcLayoutMarginRight;
                    }
                    /*****************************************************************/
                } else if (subview.mzcLayoutFillHeight && !subview.mzcLayoutFillWidth) {
                    tempFrame.size.height = CGRectGetHeight(self.bounds);
                    tempFrame.size.width = subview.mzcLayoutWidth;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //top
                        tempFrame.size.height -= subview.mzcLayoutMargin;
                        //bottom
                        tempFrame.size.height -= subview.mzcLayoutMargin;
                    } else {
                        //top
                        tempFrame.size.height -= subview.mzcLayoutMarginTop;
                        //bottom
                        tempFrame.size.height -= subview.mzcLayoutMarginBottom;
                    }
                    /*****************************************************************/
                } else {
                    tempFrame.size.width = subview.mzcLayoutWidth;
                    tempFrame.size.height = subview.mzcLayoutHeight;
                    
                    /*****************************************************************/
                }
            }
            
            tempFrame.origin.y = tempY;
            
            if (subview.mzcLayoutGravity == MZCLayoutGravityRight) {
                CGFloat tempWidth = CGRectGetWidth(self.bounds) - CGRectGetWidth(tempFrame);
                if (tempWidth > 0) {
                    tempFrame.origin.x = tempWidth;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //right
                        tempFrame.origin.x -= subview.mzcLayoutMargin;
                    } else {
                        //right
                        tempFrame.origin.x -= subview.mzcLayoutMarginRight;
                    }
                }
            } else if (subview.mzcLayoutGravity == MZCLayoutGravityCenter) {
                CGFloat tempWidth = CGRectGetWidth(self.bounds) - CGRectGetWidth(tempFrame);
                if (tempWidth > 0) {
                    tempFrame.origin.x = tempWidth / 2.0;
                    
                    if (subview.mzcLayoutMargin != 0) {
                        //left
                        tempFrame.origin.x += subview.mzcLayoutMargin;
                        //right
                        tempFrame.origin.x -= subview.mzcLayoutMargin;
                    } else {
                        //left
                        tempFrame.origin.x += subview.mzcLayoutMarginLeft;
                        //right
                        tempFrame.origin.x -= subview.mzcLayoutMarginRight;
                    }
                }
            } else if (subview.mzcLayoutGravity == MZCLayoutGravityLeft || subview.mzcLayoutGravity == MZCLayoutGravityNone) {
                if (subview.mzcLayoutMargin != 0) {
                    //left
                    tempFrame.origin.x += subview.mzcLayoutMargin;
                } else {
                    //left
                    tempFrame.origin.x += subview.mzcLayoutMarginLeft;
                }
            }
            
            
            subview.frame = tempFrame;
            
            tempY = subview.frame.size.height + subview.frame.origin.y;
            
            if (subview.mzcLayoutMargin != 0) {
                //bottom
                tempY += subview.mzcLayoutMargin;
            } else {
                //bottom
                tempY += subview.mzcLayoutMarginBottom;
            }
            
            tempY += self.gap;
        }
    }
}



@end
