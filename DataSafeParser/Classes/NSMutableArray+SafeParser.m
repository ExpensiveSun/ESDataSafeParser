//
//  NSMutableArray+SafeParser.m
//  Weather
//
//  Created by suguiyang@91.com on 15-02-15.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import "NSMutableArray+SafeParser.h"

@implementation NSMutableArray (SafeParser)

- (void)addObjectValue:(id)value {
    if (value != nil) {
        [self addObject:value];
    } else {
        NSLog(@"Add nil object value for array: %p", self);
    }
}

- (void)addStringValue:(NSString *)value {
    if (value != nil && [value isKindOfClass:[NSString class]]) {
        [self addObjectValue:value];
    } else {
        NSLog(@"Add string value for array: %p is invalid: %@", self, value);
        [self addObjectValue:@""];
    }
}

- (void)addIntegerValue:(NSInteger)value {
    [self addObjectValue:@(value)];
}

- (void)insertObjectValue:(id)value atIndex:(NSUInteger)index {
    if (value != nil) {
        if (index < [self count]) {
            [self insertObject:value atIndex:index];
        } else {
            [self addObjectValue:value];
        }
    }
}

- (void)removeObjectValueAtIndex:(NSUInteger)index {
    if (index < [self count]) {
        [self removeObjectAtIndex:index];
    }
}

- (void)replaceObjectValueAtIndex:(NSUInteger)index withValue:(id)value {
    if (value && index < [self count]) {
        [self replaceObjectAtIndex:index withObject:value];
    }
}

- (void)setArrayValue:(NSArray *)otherArray {
    if (otherArray && [otherArray isKindOfClass:[NSArray class]]) {
        [self removeAllObjects];
        for (id object in otherArray) {
            [self addObjectValue:object];
        }
    }
}

@end
