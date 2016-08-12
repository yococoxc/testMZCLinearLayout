//
//  UIView+MZC.h
//  textsss
//
//  Created by bocang02 on 16/8/11.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MZC)

@property(nonatomic) NSString* mzcID;

- (UIView*) mzcFindViewByID:(NSString*) mzcID;

@end
