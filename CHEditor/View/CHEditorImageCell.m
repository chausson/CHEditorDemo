//
//  CHEditorImageCell.m
//  CHEditorDemo
//
//  Created by Chausson on 16/11/24.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHEditorImageCell.h"
#import "CHEditorImageElement.h"
#import <Masonry/Masonry.h>

@implementation CHEditorImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _photo = [[UIImageView alloc]init];
        _photo.contentMode = UIViewContentModeScaleAspectFit;
        self.container.backgroundColor = [UIColor whiteColor];
        [self.container addSubview:_photo];
    }
    return self;
}
- (void)layout{
    NSLog(@"%g",self.contentView.frame.size.width-60);
    
    [self.container mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.top.offset(0);
        make.height.equalTo(@(self.contentView.frame.size.width-60));
        make.bottom.offset(0);
    }];
    [_photo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}
- (void)loadElement:(CHEditorImageElement *)aElement{
    [super loadElement:aElement];
    _photo.image = aElement.img;
}
@end
