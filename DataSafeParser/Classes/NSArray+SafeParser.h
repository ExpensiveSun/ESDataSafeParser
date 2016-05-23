//
//  NSArray+SafeParser.h
//  Weather
//
//  Created by suguiyang@91.com on 15-02-15.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SafeParser)

- (id)objectValueAtIndex:(NSUInteger)index;

- (NSString *)stringValueAtIndex:(NSUInteger)index;
- (BOOL)booleanValueAtIndex:(NSUInteger)index;

- (NSNumber *)numberValueAtIndex:(NSUInteger)index;
- (int)intValueAtIndex:(NSUInteger)index;
- (NSInteger)integerValueAtIndex:(NSUInteger)index;
- (float)floatValueAtIndex:(NSUInteger)index;
- (double)doubleValueAtIndex:(NSUInteger)index;
- (long long)longLongValueAtIndex:(NSUInteger)index;

- (NSDictionary *)dictValueAtIndex:(NSUInteger)index;
- (NSMutableDictionary *)mutableDictValueAtIndex:(NSUInteger)index;

- (NSArray *)arrayValueAtIndex:(NSUInteger)index;
- (NSMutableArray *)mutableArrayValueAtIndex:(NSUInteger)index;

- (id)objectValueAtIndex:(NSUInteger)index verifyClass:(Class)aClass;

@end
