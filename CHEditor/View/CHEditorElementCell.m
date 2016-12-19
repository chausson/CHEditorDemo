//
//  CHEditorElementCell.m
//  CHEditorDemo
//
//  Created by Chausson on 16/11/24.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHEditorElementCell.h"
#import <Masonry/Masonry.h>
@implementation CHEditorElementCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.container = [[UIView alloc]init];
        self.container.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.container];
    }
    return self;
}
- (void)layout{
    [self.container mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];

}
- (void)loadElement:(CHEdtiorElement *)aElement{
    [self layout];
}
@end
