//
//  CHEditor.h
//  TopicDemo
//
//  Created by Chausson on 16/11/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHEditorView.h"
#import "CHEdtiorElement.h"

@interface CHEditor : NSObject
@property (nonatomic , readonly) NSArray <CHEdtiorElement *>*elements;
@property (nonatomic , strong) CHEditorView *view;

- (void)inputElement:(CHEdtiorElement *)aElement;
- (void)removeElement:(CHEdtiorElement *)aElement;
- (void)removeIndex:(NSInteger )index;
- (void)replaceTo:(CHEdtiorElement *)freshElement with:(CHEdtiorElement *)staleElement;
- (void)removeAll;
@end
