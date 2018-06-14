//
//  ViewController.m
//  DuBan
//
//  Created by yjs on 2018/6/14.
//  Copyright © 2018年 袁佳帅. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row %15 == 0){
        static NSString * identfire = @"ImageCell";
        ImageCell * cell = [tableView dequeueReusableCellWithIdentifier:identfire];
        if(cell == nil){
            cell = [[ImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfire];
        }
        return cell;
    }else{
        static NSString * identfire = @"UITableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfire];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfire];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row %15 == 0){
        return 150;
    }
    return 100;
}

- (void)scrollViewDidScroll:(UITableView *)scrollView{
    NSArray * visCell = scrollView.visibleCells;
    [visCell enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[ImageCell class]]){
            ImageCell * cell = obj;
            CGFloat maxOff = [UIScreen mainScreen].bounds.size.height - 150;
            CGFloat scrollOff = scrollView.contentOffset.y - cell.frame.origin.y + [UIScreen mainScreen].bounds.size.height - 150 ;
            if (maxOff <= scrollOff) {
                [cell.bgScrollView setContentOffset:CGPointMake(0,0)];
            }else if (scrollOff < 0){
                [cell.bgScrollView setContentOffset:CGPointMake(0,maxOff)];
            } else{
                [cell.bgScrollView setContentOffset:CGPointMake(0,(maxOff - scrollOff))];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
