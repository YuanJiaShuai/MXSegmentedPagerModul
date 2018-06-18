//
//  ViewController.m
//  MXSegmentedPagerDemo
//
//  Created by yjs on 2018/6/14.
//  Copyright © 2018年 袁佳帅. All rights reserved.
//

#import "ViewController.h"
#import <MXSegmentedPager/MXSegmentedPager.h>
#import "TextViewController.h"
#import "HeaderView.h"

@interface ViewController ()<MXSegmentedPagerDelegate, MXSegmentedPagerDataSource, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView        * tableView1;
@property (nonatomic, strong) UITableView        * tableView2;
@property (nonatomic, strong) UITableView        * tableView3;
@property (nonatomic, strong) UITableView        * tableView4;
@property (nonatomic, strong) UITableView        * tableView5;
@property (nonatomic, strong) HeaderView * headerView;
@property (nonatomic, strong) MXSegmentedPager  * segmentedPager;

@property (strong, nonatomic) TextViewController * view1;
@property (strong, nonatomic) TextViewController * view2;
@property (strong, nonatomic) TextViewController * view3;
@property (strong, nonatomic) TextViewController * view4;
@property (strong, nonatomic) TextViewController * view5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.segmentedPager];
    
    // Parallax Header
    self.segmentedPager.parallaxHeader.view = self.headerView;
    self.segmentedPager.parallaxHeader.mode = MXParallaxHeaderModeBottom;
    self.segmentedPager.parallaxHeader.height = WIDTH + 40 + 12;
    self.segmentedPager.parallaxHeader.minimumHeight = 0;
    
    // Segmented Control customization
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
    self.segmentedPager.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedPager.segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    self.segmentedPager.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleArrow;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = [UIColor orangeColor];
    self.segmentedPager.segmentedControl.selectionIndicatorHeight = 2;
    self.segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12);
}

- (TextViewController *)view1{
    if(!_view1){
        _view1 = [[TextViewController alloc]init];
    }
    return _view1;
}

- (TextViewController *)view2{
    if(!_view2){
        _view2 = [[TextViewController alloc]init];
    }
    return _view2;
}

- (TextViewController *)view3{
    if(!_view3){
        _view3 = [[TextViewController alloc]init];
    }
    return _view3;
}

- (TextViewController *)view4{
    if(!_view4){
        _view4 = [[TextViewController alloc]init];
    }
    return _view4;
}

- (TextViewController *)view5{
    if(!_view5){
        _view5 = [[TextViewController alloc]init];
    }
    return _view5;
}

- (void)viewWillLayoutSubviews {
    self.segmentedPager.frame = (CGRect){
        .origin = CGPointMake(0, 64),
        .size   = self.view.frame.size
    };
    [super viewWillLayoutSubviews];
}

- (MXSegmentedPager *)segmentedPager {
    if (!_segmentedPager) {
        
        // Set a segmented pager below the cover
        _segmentedPager = [[MXSegmentedPager alloc] init];
        _segmentedPager.delegate    = self;
        _segmentedPager.dataSource  = self;
    }
    return _segmentedPager;
}

- (UIView *)headerView{
    if(!_headerView){
        _headerView = [[HeaderView alloc]init];
        _headerView.backgroundColor = [UIColor orangeColor];
    }
    return _headerView;
}

- (UITableView *)tableView1 {
    if (!_tableView1) {
        //Add a table page
        _tableView1 = [[UITableView alloc] init];
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
    }
    return _tableView1;
}

- (UITableView *)tableView2 {
    if (!_tableView2) {
        //Add a table page
        _tableView2 = [[UITableView alloc] init];
        _tableView2.delegate = self;
        _tableView2.dataSource = self;
    }
    return _tableView2;
}

- (UITableView *)tableView3 {
    if (!_tableView3) {
        //Add a table page
        _tableView3 = [[UITableView alloc] init];
        _tableView3.delegate = self;
        _tableView3.dataSource = self;
    }
    return _tableView3;
}

- (UITableView *)tableView4 {
    if (!_tableView4) {
        //Add a table page
        _tableView4 = [[UITableView alloc] init];
        _tableView4.delegate = self;
        _tableView4.dataSource = self;
    }
    return _tableView4;
}

- (UITableView *)tableView5 {
    if (!_tableView5) {
        //Add a table page
        _tableView5 = [[UITableView alloc] init];
        _tableView5.delegate = self;
        _tableView5.dataSource = self;
    }
    return _tableView5;
}

#pragma mark <MXSegmentedPagerDelegate>

- (CGFloat)heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 30.f;
}

- (void)segmentedPager:(MXSegmentedPager *)segmentedPager didSelectViewWithTitle:(NSString *)title {
    NSLog(@"%@ page selected.", title);
}

- (void)segmentedPager:(MXSegmentedPager *)segmentedPager didScrollWithParallaxHeader:(MXParallaxHeader *)parallaxHeader {
    NSLog(@"progress %f", parallaxHeader.progress);
}

#pragma mark <MXSegmentedPagerDataSource>

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 5;
}

- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager titleForSectionAtIndex:(NSInteger)index {
    return @[@"动态", @"新闻", @"公共", @"简况", @"财务"][index];
}

- (UIView *)segmentedPager:(MXSegmentedPager *)segmentedPager viewForPageAtIndex:(NSInteger)index {
//    return @[self.tableView1, self.tableView2, self.tableView3, self.tableView4, self.tableView5][index];
    return @[self.view1.view, self.view2.view, self.view3.view, self.view4.view, self.view5.view][index];
}

#pragma mark <UITableViewDataSource>

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = (indexPath.row % 2)? @"Text" : @"Web";
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
