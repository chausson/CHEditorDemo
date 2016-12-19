//
//  CHEditor.m
//  TopicDemo
//
//  Created by Chausson on 16/11/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHEditor.h"
#import "CHEditorView.h"
#import "CHEditorTextElement.h"
#import "CHEditorImageElement.h"
#import "CHEditorTextCell.h"
#import "CHEditorImageCell.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
@interface CHEditor ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) NSArray <CHEdtiorElement *>*elements;
@end
@implementation CHEditor
- (instancetype)init
{
    self = [super init];
    if (self) {
        _view = [[CHEditorView alloc]init];
        [_view registerClass:[CHEditorTextCell class] forCellReuseIdentifier:[CHEditorTextElement identifier]];
        [_view registerClass:[CHEditorImageCell class] forCellReuseIdentifier:[CHEditorImageElement identifier]];
        _view.delegate = self;
        _view.dataSource = self;
    }
    return self;
}
- (void)inputElement:(CHEdtiorElement *)aElement{
    if (!_elements) {
        self.elements = [NSArray arrayWithObject:aElement];
        [self.view reloadData];
        return;
    }
    NSMutableArray *array = [_elements mutableCopy];
    [array addObject:aElement];
    self.elements = array;
    [self.view reloadData];
    
}
- (void)removeElement:(CHEdtiorElement *)aElement{
    
}
- (void)removeIndex:(NSInteger )index{
    
}
- (void)replaceTo:(CHEdtiorElement *)freshElement with:(CHEdtiorElement *)staleElement{
    
}
- (void)removeAll{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _elements.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CHEdtiorElement *element = _elements[indexPath.row];
    CHEditorElementCell *cell = [tableView dequeueReusableCellWithIdentifier:element.identifer];

    [cell loadElement:element];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CHEdtiorElement *element = _elements[indexPath.row];
//    return 100;
    CGFloat height = [tableView fd_heightForCellWithIdentifier:element.identifer cacheByIndexPath:indexPath configuration:^(CHEditorElementCell *cell) {
        [cell loadElement:element];
    }];
    NSLog(@"h=%g",height);
    return height;
}
@end
