//
//  NSDictionary+SafeParser.h
//  Weather
//
//  Created by suguiyang@91.com on 15-02-15.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SafeParser)

// 读取MainBundle中的Plist文件
+ (NSDictionary *)dictWithBundlePlist:(NSString *)resourceName;

- (BOOL)hasValueForKey:(NSString *)key;

- (NSString *)stringValueForKey:(NSString *)key;
- (BOOL)booleanValueForKey:(NSString *)key;

- (NSNumber *)numberValueForKey:(NSString *)key;
- (int)intValueForKey:(NSString *)key;
- (NSInteger)integerValueForKey:(NSString *)key;
- (float)floatValueForKey:(NSString *)key;
- (double)doubleValueForKey:(NSString *)key;
- (long long)longLongValueForKey:(NSString *)key;

- (NSDictionary *)dictValueForKey:(NSString *)key;
- (NSMutableDictionary *)mutableDictValueForKey:(NSString *)key;

- (NSArray *)arrayValueForKey:(NSString *)key;
- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key;

- (id)objectValueForKey:(NSString *)key verifyClass:(Class)aClass;

/* 异常容错处理 */
- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey;
- (void)removeObjectForKey:(id)aKey;
@end
