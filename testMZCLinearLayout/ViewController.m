//
//  ViewController.m
//  testMZCLinearLayout
//
//  Created by bocang02 on 16/8/12.
//  Copyright © 2016年 yococo. All rights reserved.
//

#import "ViewController.h"

#import "MZCLinearLayout.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView* myTableView;

@property(nonatomic,strong) NSArray* myDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myDataSource = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N"];
    
    
    MZCLinearLayout* myLayout = [MZCLinearLayout orientation:MZCLayoutOrientationVertical];
    myLayout.backgroundColor = [UIColor redColor];
    myLayout.mzcLayoutFillHeight = YES;
    myLayout.mzcLayoutFillWidth = YES;
    [self.view addSubview:myLayout];
    
    
    self.myTableView = [UITableView new];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.mzcLayoutFillWidth = YES;
    _myTableView.mzcLayoutFillHeight = YES;
    [myLayout addSubview:_myTableView];
    
    
    
//    MZCLinearLayout* myLayout = [MZCLinearLayout orientation:MZCLayoutOrientationVertical];
//    myLayout.backgroundColor = [UIColor redColor];
//    myLayout.mzcID = @"myLayout";
//    //    myLayout.gap = 10;
//    myLayout.mzcLayoutWidth = 300;
//    myLayout.mzcLayoutHeight = 500;
//    myLayout.mzcLayoutGravity = MZCLayoutGravityRightBottom;
//    [self.view addSubview:myLayout];
//    
//    
//    MZCLinearLayout* myLayout01 = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
//    myLayout01.backgroundColor = [UIColor yellowColor];
//    myLayout01.mzcLayoutWidth = 90;
//    myLayout01.mzcLayoutHeight = 70;
//    myLayout01.mzcLayoutMargin = 10;
//    [myLayout addSubview:myLayout01];
//    
//    MZCLinearLayout* myLayout02 = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
//    myLayout02.backgroundColor = [UIColor lightGrayColor];
//    myLayout02.mzcLayoutWidth = 230;
//    myLayout02.mzcLayoutHeight = 24;
//    myLayout02.mzcLayoutGravity = MZCLayoutGravityCenter;
//    myLayout02.mzcLayoutMargin = 10;
//    [myLayout addSubview:myLayout02];
//    
//    MZCLinearLayout* myLayout03 = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
//    myLayout03.backgroundColor = [UIColor orangeColor];
//    //    myLayout03.mzcLayoutWidth = 150;
//    myLayout03.mzcLayoutFillWidth = YES;
//    myLayout03.mzcLayoutHeight = 35;
//    myLayout03.mzcLayoutMarginLeft = 20;
//    myLayout03.mzcLayoutGravity = MZCLayoutGravityRight;
//    [myLayout addSubview:myLayout03];
//    
//    MZCLinearLayout* myLayout04 = [MZCLinearLayout orientation:MZCLayoutOrientationHorizontal];
//    myLayout04.backgroundColor = [UIColor blueColor];
//    myLayout04.mzcID = @"myLayout04";
//    myLayout04.mzcLayoutWidth = 150;
//    myLayout04.mzcLayoutWeight = 1.0f;
//    myLayout04.mzcLayoutGravity = MZCLayoutGravityCenter;
//    myLayout04.mzcLayoutMargin = 10;
//    [myLayout addSubview:myLayout04];
//    
//    MZCLinearLayout* view04001 = [MZCLinearLayout orientation:MZCLayoutOrientationVertical];
//    view04001.backgroundColor = [UIColor brownColor];
//    //    view04001.mzcLayoutFillWidth = YES;
//    view04001.mzcLayoutWidth = 50;
//    //    view04001.mzcLayoutFillHeight = YES;
//    view04001.mzcLayoutHeight = 80;
//    view04001.mzcLayoutGravity = MZCLayoutGravityBottom;
//    [myLayout04 addSubview:view04001];
//    
//    
//    MZCLinearLayout* view04002 = [MZCLinearLayout orientation:MZCLayoutOrientationVertical];
//    view04002.backgroundColor = [UIColor purpleColor];
//    //    view04002.mzcLayoutFillWidth = YES;
//    view04002.mzcLayoutWidth = 70;
//    //    view04002.mzcLayoutFillHeight = YES;
//    view04002.mzcLayoutHeight = 60;
//    view04002.mzcLayoutGravity = MZCLayoutGravityCenter;
//    [myLayout04 addSubview:view04002];
//    
//    MZCLinearLayout* view04003 = [MZCLinearLayout orientation:MZCLayoutOrientationVertical];
//    view04003.backgroundColor = [UIColor greenColor];
//    //    view04003.mzcLayoutFillWidth = YES;
//    view04003.mzcLayoutFillHeight = YES;
//    //    view04003.mzcLayoutWeight = 1;
//    view04003.mzcLayoutWidth = 70;
//    [myLayout04 addSubview:view04003];
}


#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myDataSource count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"UITableViewCellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@">>>  %@", [self.myDataSource objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* tempClassString = [NSString stringWithFormat:@"ViewController%@", [self.myDataSource objectAtIndex:indexPath.row]];
    Class tempClass = NSClassFromString(tempClassString);
    
    UIViewController* tempVC = [tempClass new];
    NSLog(@"%@", tempVC);
    if (tempVC) {
        [self presentViewController:tempVC animated:YES completion:^{
            
        }];
    }
}


@end
