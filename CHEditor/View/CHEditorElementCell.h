//
//  CHEditorElementCell.h
//  CHEditorDemo
//
//  Created by Chausson on 16/11/24.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHEdtiorElement.h"
@interface CHEditorElementCell : UITableViewCell
@property (nonatomic , strong) UIButton *del;
@property (nonatomic , strong) UIButton *edit;
@property (nonatomic , strong) UIView *container;
- (void)layout; //约束布局
- (void)loadElement:(CHEdtiorElement *)aElement;
@end
