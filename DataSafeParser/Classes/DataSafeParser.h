//
//  DataSafeParser.h
//  Weather
//
//  Created by suguiyang@91.com on 15-03-19.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSafeParser : NSObject

// 自动从字符串/NSData数据中解析指定类型数据 (推荐使用)
+ (NSDictionary *)dictionaryValueFromObject:(id)object;
+ (NSArray *)arrayValueFromObject:(id)object;

// 从字符串中解析指定类型数据(自动进行JOSN解析)
+ (NSDictionary *)dictionaryValue:(NSString *)content;
+ (NSArray *)arrayValue:(NSString *)content;

// 指定类型数据解析
+ (id)parserValueWithData:(NSData *)JSONData verifyClass:(Class)aClass;
+ (id)parserValue:(NSString *)JSONContent verifyClass:(Class)aClass;

// 验证字段是否存在
+ (BOOL)verifyDictionary:(NSDictionary *)dict withKeys:(NSArray *)keys;

// 验证字段的值是否有效(不为NSNull, NSString不为空，NSArray个数大于0等)
+ (BOOL)verifyDataValue:(NSDictionary *)dict withKeys:(NSArray *)keys;

// 将对象转换成JSON字符串
+ (NSString *)JSONRepresentationWithObject:(id)object;

// 将JSON字符串转换成对象
+ (id)JSONValueFromContent:(NSString *)content;

// 将JSON字符串/NSData转换成对象
+ (id)JSONValueFromObject:(id)object;

@end
