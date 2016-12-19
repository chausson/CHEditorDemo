//
//  CHEditCreator.h
//  TopicDemo
//
//  Created by Chausson on 16/11/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHEditorImageElement.h"
#import "CHEditorTextElement.h"
@interface CHEditCreator : NSObject
+ (CHEditorImageElement *)createImageElement:(UIImage *)image;
+ (CHEditorTextElement *)createTextElement:(NSString *)text;
@end
