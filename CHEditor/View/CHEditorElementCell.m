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
        [self.contentView addSubview:self.container];
    }
    return self;
}
- (UIView *)container{
    if (!_container) {
        _container = [[UIView alloc]init];
        _container.backgroundColor = [UIColor whiteColor];
    }
    return _container;
}
- (UIView *)maskcontainer{
    if (!_maskcontainer) {
        _maskcontainer = [[UIView alloc]init];
        _maskcontainer.backgroundColor = [UIColor lightGrayColor];
        _maskcontainer.alpha = 0.65f;
        _maskcontainer.hidden = YES;
    }
    return _maskcontainer;
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
