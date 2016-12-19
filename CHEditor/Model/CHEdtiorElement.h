//
//  CHEdtiorElement.h
//  TopicDemo
//
//  Created by Chausson on 16/11/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHEdtiorElement : NSObject
@property (nonatomic , readonly) NSString *identifer;
@property (nonatomic , readonly) NSInteger index;

+ (NSString *)identifier;
@end
