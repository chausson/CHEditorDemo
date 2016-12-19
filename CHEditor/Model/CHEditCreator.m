//
//  CHEditCreator.m
//  TopicDemo
//
//  Created by Chausson on 16/11/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHEditCreator.h"
#import "CHEditorElement+Protocol.h"
@implementation CHEditCreator
+ (CHEditorImageElement *)createImageElement:(UIImage *)image{
    CHEditorImageElement *element = [[CHEditorImageElement alloc]init];
    element.img = image;
    return element;
}
+ (CHEditorTextElement *)createTextElement:(NSString *)text{
    CHEditorTextElement *element = [[CHEditorTextElement alloc]init];
    element.text = text;
    return element;
}
@end
