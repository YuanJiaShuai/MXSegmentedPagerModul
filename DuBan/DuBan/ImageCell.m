//
//  ImageCell.m
//  DuBan
//
//  Created by yjs on 2018/6/14.
//  Copyright © 2018年 袁佳帅. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell()
@property (strong, nonatomic) UIImageView * bgImageView;

@end

@implementation ImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.bgScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 150)];
        self.bgScrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        self.bgScrollView.scrollEnabled = NO;
        [self.contentView addSubview:self.bgScrollView];
        
        self.bgImageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        self.bgImageView.image = [UIImage imageNamed:@"hi.jpg"];
        [self.bgScrollView addSubview:self.bgImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
