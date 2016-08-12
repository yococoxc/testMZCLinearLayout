//
//  MZCLinearLayout.h
//  textsss
//
//  Created by bocang02 on 16/8/11.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+MZC.h"
#import "UIView+MZCLayout.h"

@interface MZCLinearLayout : UIView

@property(nonatomic,assign) MZCLayoutOrientation orientation;

@property(nonatomic,assign) CGFloat gap;

+ (instancetype) orientation:(MZCLayoutOrientation)orientation;

@end
