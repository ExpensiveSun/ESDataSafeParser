//
//  NSMutableArray+SafeParser.h
//  Weather
//
//  Created by suguiyang@91.com on 15-02-15.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SafeParser)

- (void)addObjectValue:(id)value;
- (void)addStringValue:(NSString *)value;
- (void)addIntegerValue:(NSInteger)value;

- (void)insertObjectValue:(id)value atIndex:(NSUInteger)index;
- (void)removeObjectValueAtIndex:(NSUInteger)index;
- (void)replaceObjectValueAtIndex:(NSUInteger)index withValue:(id)value;

- (void)setArrayValue:(NSArray *)otherArray;

@end
