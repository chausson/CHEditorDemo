//
//  CHEditorElement+Protocol.h
//  CHEditorDemo
//
//  Created by Chausson on 16/11/24.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHEditorTextElement.h"
#import "CHEditorImageElement.h"

@interface CHEditorImageElement ()
@property (nonatomic , strong) UIImage *img;

@end
@interface CHEditorTextElement ()
@property (nonatomic , strong)  NSString *text;

@end
