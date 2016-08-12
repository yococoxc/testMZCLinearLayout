//
//  UIView+MZCLayout.h
//  textsss
//
//  Created by bocang02 on 16/8/11.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MZCLayoutOrientation) {
    MZCLayoutOrientationNone,
    MZCLayoutOrientationHorizontal,
    MZCLayoutOrientationVertical,
};
typedef NS_ENUM(NSUInteger, MZCLayoutGravity) {
    MZCLayoutGravityNone,
    MZCLayoutGravityTop,
    MZCLayoutGravityBottom,
    MZCLayoutGravityCenter,
    MZCLayoutGravityLeft,
    MZCLayoutGravityRight,
    MZCLayoutGravityCenterTop,
    MZCLayoutGravityCenterBottom,
    MZCLayoutGravityCenterLeft,
    MZCLayoutGravityCenterRight,
    MZCLayoutGravityLeftTop,
    MZCLayoutGravityLeftBottom,
    MZCLayoutGravityRightTop,
    MZCLayoutGravityRightBottom,
};


@interface UIView (MZCLayout)

@property(nonatomic) MZCLayoutGravity mzcLayoutGravity;

@property(nonatomic) CGFloat mzcLayoutWidth;
@property(nonatomic) CGFloat mzcLayoutHeight;

@property(nonatomic) CGFloat mzcLayoutWeight;

//Margin有值时将代表MarginTop、MarginBottom、MarginLeft、MarginRight，而且这四个值将无效。
@property(nonatomic) CGFloat mzcLayoutMargin;
@property(nonatomic) CGFloat mzcLayoutMarginTop;
@property(nonatomic) CGFloat mzcLayoutMarginBottom;
@property(nonatomic) CGFloat mzcLayoutMarginLeft;
@property(nonatomic) CGFloat mzcLayoutMarginRight;

//当FillWidth、FillHeight为YES时，上面的参数无效。
@property(nonatomic) BOOL mzcLayoutFillWidth;
@property(nonatomic) BOOL mzcLayoutFillHeight;

@end
