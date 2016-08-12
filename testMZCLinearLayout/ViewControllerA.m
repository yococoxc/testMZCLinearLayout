//
//  ViewControllerA.m
//  testMZCLinearLayout
//
//  Created by bocang02 on 16/8/12.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import "ViewControllerA.h"

#import "MZCLinearLayout.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    MZCLinearLayout* myLayout = [MZCLinearLayout orientation:MZCLayoutOrientationVertical];
    myLayout.backgroundColor = [UIColor redColor];
    myLayout.mzcLayoutFillHeight = YES;
    myLayout.mzcLayoutFillWidth = YES;
    [self.view addSubview:myLayout];
    
    /*********************************************/
    MZCLinearLayout* myHead = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
    myHead.backgroundColor = [UIColor yellowColor];
    myHead.mzcLayoutFillWidth = YES;
    myHead.mzcLayoutHeight = 60;
    [myLayout addSubview:myHead];
    
    MZCLinearLayout* myBody = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
    myBody.backgroundColor = [UIColor lightGrayColor];
    myBody.mzcLayoutFillWidth = YES;
    myBody.mzcLayoutWeight = 1;
    [myLayout addSubview:myBody];
    
    MZCLinearLayout* myFoot = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
    myFoot.backgroundColor = [UIColor orangeColor];
    myFoot.mzcLayoutFillWidth = YES;
    myFoot.mzcLayoutHeight = 44;
    [myLayout addSubview:myFoot];
    
    /*********************************************/
    UIButton* exitButton = [UIButton new];
    exitButton.backgroundColor = [UIColor whiteColor];
    exitButton.mzcLayoutWidth = 60;
    exitButton.mzcLayoutHeight = 40;
    exitButton.mzcLayoutGravity = MZCLayoutGravityCenter;
    exitButton.mzcLayoutMarginLeft = 10;
    [exitButton addTarget:self action:@selector(pressedButtonToExit:) forControlEvents:UIControlEventTouchUpInside];
    [myHead addSubview:exitButton];
    
    UILabel* titleLabel = [UILabel new];
    titleLabel.mzcID = @"headTitle";
    titleLabel.backgroundColor = [UIColor greenColor];
    titleLabel.mzcLayoutWeight = 1;
    titleLabel.mzcLayoutHeight = 30;
    titleLabel.mzcLayoutGravity = MZCLayoutGravityCenter;
    titleLabel.mzcLayoutMargin = 10;
    [myHead addSubview:titleLabel];
    
    UIButton* rightButton = [UIButton new];
    rightButton.backgroundColor = [UIColor blueColor];
    rightButton.mzcLayoutWidth = 60;
    rightButton.mzcLayoutHeight = 40;
    rightButton.mzcLayoutGravity = MZCLayoutGravityCenter;
    rightButton.mzcLayoutMarginRight = 10;
    [rightButton addTarget:self action:@selector(pressedButtonToExit:) forControlEvents:UIControlEventTouchUpInside];
    [myHead addSubview:rightButton];
    
    
    
    
    UILabel* label = (UILabel*)[self.view mzcFindViewByID:@"headTitle"];
    label.text = @"这是一个标题";
}



#pragma mark - 
- (void) pressedButtonToExit:(UIButton*) sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
