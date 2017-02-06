//
//  CHEditorTitleCell.h
//  CHEditorDemo
//
//  Created by Chausson on 2017/2/4.
//  Copyright © 2017年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHEditorTitleCell : UITableViewCell

+ (CGFloat)cellHeight;

@property (strong ,nonatomic) UITextField *input;
@property (strong ,nonatomic) NSString *placeholdText; // 默认的占位字符是：请输入话题标题
@end
