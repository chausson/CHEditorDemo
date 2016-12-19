//
//  CHEditorTextCell.m
//  CHEditorDemo
//
//  Created by Chausson on 16/11/24.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHEditorTextCell.h"
#import "CHEditorTextElement.h"
#import <Masonry/Masonry.h>
@implementation CHEditorTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _content = [[UILabel alloc]init];
        _content.backgroundColor = [UIColor whiteColor];
        _content.textColor = [UIColor blackColor];
        _content.numberOfLines = 0;
        _content.textAlignment = 0;
        [self.container  addSubview:_content];

    }
    return self;
}
- (void)layout{
    [super layout];
    [_content mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
}


- (void)loadElement:(CHEditorTextElement *)aElement{
    [super loadElement:aElement];
    _content.text = aElement.text;
}

@end
