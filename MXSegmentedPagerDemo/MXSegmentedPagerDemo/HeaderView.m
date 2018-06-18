//
//  HeaderView.m
//  MXSegmentedPagerDemo
//
//  Created by yjs on 2018/6/14.
//  Copyright © 2018年 袁佳帅. All rights reserved.
//

#import "HeaderView.h"
#import <Masonry.h>
#import <SPPageMenu.h>
@interface HeaderView()<SPPageMenuDelegate>
@property (strong, nonatomic) SPPageMenu * pageMenu;
@property (strong, nonatomic) UIScrollView * bgScrollView;

@property (strong, nonatomic) UIView * view1;
@property (strong, nonatomic) UIView * view2;
@property (strong, nonatomic) UIView * view3;
@property (strong, nonatomic) UIView * view4;
@property (strong, nonatomic) UIView * view5;
@property (strong, nonatomic) UIView * view6;

@property (strong, nonatomic) UILabel * lineLab;

@end

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init{
    self = [super init];
    if(self){
        [self addSubview:self.pageMenu];
        [self.pageMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(@(0));
            make.height.equalTo(@(40));
        }];
        [self addSubview:self.bgScrollView];
        [self.bgScrollView addSubview:self.view1];
        [self.bgScrollView addSubview:self.view2];
        [self.bgScrollView addSubview:self.view3];
        [self.bgScrollView addSubview:self.view4];
        [self.bgScrollView addSubview:self.view5];
        [self.bgScrollView addSubview:self.view6];
        
        [self addSubview:self.lineLab];
    }
    return self;
}

- (UILabel *)lineLab{
    if(!_lineLab){
        _lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, WIDTH + 40, WIDTH, 12)];
        _lineLab.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.2];
    }
    return _lineLab;
}

- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    if(labs(toIndex - fromIndex) >= 2){
        [self.bgScrollView setContentOffset:CGPointMake(WIDTH * toIndex, 0) animated:NO];
    }else{
        [self.bgScrollView setContentOffset:CGPointMake(WIDTH * toIndex, 0) animated:YES];
    }
}

- (SPPageMenu *)pageMenu{
    if(!_pageMenu){
        _pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, 40, WIDTH, 40) trackerStyle:SPPageMenuTrackerStyleLineAttachment];
        [_pageMenu setItems:@[@"分时", @"5日", @"日K", @"周K", @"月K", @"年K"] selectedItemIndex:0];
        _pageMenu.delegate = self;
        _pageMenu.itemTitleFont = [UIFont systemFontOfSize:14];
        _pageMenu.selectedItemTitleColor = [UIColor blackColor];
        _pageMenu.unSelectedItemTitleColor = [UIColor grayColor];
        _pageMenu.tracker.backgroundColor = [UIColor blackColor];
        _pageMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
        _pageMenu.bridgeScrollView = self.bgScrollView;
    }
    return _pageMenu;
}

- (UIScrollView *)bgScrollView{
    if(!_bgScrollView){
        _bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, WIDTH, WIDTH)];
        _bgScrollView.contentSize = CGSizeMake(WIDTH * 6, WIDTH);
        _bgScrollView.pagingEnabled = YES;
        _bgScrollView.bounces = YES;
    }
    return _bgScrollView;
}

- (UIView *)view1{
    if(!_view1){
        _view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH)];
        _view1.backgroundColor = [UIColor whiteColor];
    }
    return _view1;
}

- (UIView *)view2{
    if(!_view2){
        _view2 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, WIDTH)];
        _view2.backgroundColor = [UIColor redColor];
    }
    return _view2;
}

- (UIView *)view3{
    if(!_view3){
        _view3 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH * 2, 0, WIDTH, WIDTH)];
        _view3.backgroundColor = [UIColor greenColor];
    }
    return _view3;
}

- (UIView *)view4{
    if(!_view4){
        _view4 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH * 3, 0, WIDTH, WIDTH)];
        _view4.backgroundColor = [UIColor orangeColor];
    }
    return _view4;
}

- (UIView *)view5{
    if(!_view5){
        _view5 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH * 4, 0, WIDTH, WIDTH)];
        _view5.backgroundColor = [UIColor blueColor];
    }
    return _view5;
}

- (UIView *)view6{
    if(!_view6){
        _view6 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH * 5, 0, WIDTH, WIDTH)];
        _view6.backgroundColor = [UIColor whiteColor];
    }
    return _view6;
}

@end
