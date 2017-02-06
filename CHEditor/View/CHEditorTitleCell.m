//
//  CHEditorTitleCell.m
//  CHEditorDemo
//
//  Created by Chausson on 2017/2/4.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import "CHEditorTitleCell.h"
#import <Masonry/Masonry.h>

@implementation CHEditorTitleCell
+ (CGFloat)cellHeight{
    return 40;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.left.right.offset(0);
            make.height.equalTo(@(1));
        }];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
