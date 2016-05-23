//
//  NSArray+SafeParser.m
//  Weather
//
//  Created by suguiyang@91.com on 15-02-15.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import "NSArray+SafeParser.h"

@implementation NSArray (SafeParser)

- (id)objectValueAtIndex:(NSUInteger)index {
    
#if DEBUG
    return [self objectAtIndex:index];
#else
    if (index < [self count]) {
        return [self objectAtIndex:index];
    }
    return nil;
#endif
}

- (NSString *)stringValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value respondsToSelector:@selector(stringValue)]) {
        return [value stringValue];
    }
    
    if (value != nil) {
        NSLog(@"String value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return @"";
}

- (BOOL)booleanValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value boolValue];
    }
    
    NSString *stringValue = @"NO";
    if ([value isKindOfClass:[NSString class]]) {
        stringValue = value;
    } else if ([value respondsToSelector:@selector(stringValue)]) {
        stringValue = [value stringValue];
    }
    
    if ([stringValue caseInsensitiveCompare:@"true"] == NSOrderedSame ||
        [stringValue caseInsensitiveCompare:@"yes"] == NSOrderedSame ||
        [stringValue caseInsensitiveCompare:@"y"] == NSOrderedSame ||
        [stringValue caseInsensitiveCompare:@"1"] == NSOrderedSame) {
        return YES;
    }
    
    if (value != nil) {
        NSLog(@"Boolean value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return NO;
}

- (NSNumber *)numberValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    
    NSString *stringValue = @"0";
    if ([value isKindOfClass:[NSString class]]){
        stringValue = value;
    } else if ([value respondsToSelector:@selector(stringValue)]){
        stringValue = [value stringValue];
    }
    
    if (value != nil) {
        NSLog(@"Number value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return [NSDecimalNumber decimalNumberWithString:stringValue];
}

- (int)intValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value intValue];
    } else if ([value respondsToSelector:@selector(intValue)]) {
        return [value intValue];
    }
    
    if (value != nil) {
        NSLog(@"Int value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return 0;
}

- (NSInteger)integerValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value integerValue];
    } else if ([value respondsToSelector:@selector(integerValue)]) {
        return [value integerValue];
    }
    
    if (value != nil) {
        NSLog(@"Integer value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return 0;
}

- (float)floatValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value floatValue];
    } else if ([value respondsToSelector:@selector(floatValue)]) {
        return [value floatValue];
    }
    
    if (value != nil) {
        NSLog(@"Float value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return 0.0;
}

- (double)doubleValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value doubleValue];
    } else if ([value respondsToSelector:@selector(doubleValue)]) {
        return [value doubleValue];
    }
    
    if (value != nil) {
        NSLog(@"Double value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return 0.0;
}

- (long long)longLongValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value longLongValue];
    } else if ([value respondsToSelector:@selector(longLongValue)]) {
        return [value longLongValue];
    }
    
    if (value != nil) {
        NSLog(@"Long long value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return 0;
}

- (NSDictionary *)dictValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    
    if (value != nil) {
        NSLog(@"Dictionary value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return nil;
}

- (NSMutableDictionary *)mutableDictValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSMutableDictionary class]]) {
        return value;
    }
    
    if ([value isMemberOfClass:[NSDictionary class]]) {
        return [NSMutableDictionary dictionaryWithDictionary:value];
    }
    
    if (value != nil) {
        NSLog(@"Mutable dictionary value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return nil;
}

- (NSArray *)arrayValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    
    if (value != nil) {
        NSLog(@"Array value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return nil;
}

- (NSMutableArray *)mutableArrayValueAtIndex:(NSUInteger)index {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:[NSMutableArray class]]) {
        return value;
    }
    
    if ([value isMemberOfClass:[NSArray class]]) {
        return [NSMutableArray arrayWithArray:value];
    }
    
    if (value != nil) {
        NSLog(@"Mutable array value for key: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return nil;
}

- (id)objectValueAtIndex:(NSUInteger)index verifyClass:(Class)aClass {
    id value = [self objectValueAtIndex:index];
    if ([value isKindOfClass:aClass]) {
        return value;
    }
    
    if (value != nil) {
        NSLog(@"Object value at index: %lu is invalid: %@", (unsigned long)index, [value class]);
    }
    return nil;
}

@end
