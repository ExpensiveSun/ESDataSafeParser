//
//  NSDictionary+SafeParser.m
//  Weather
//
//  Created by suguiyang@91.com on 15-02-15.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import "NSDictionary+SafeParser.h"

@implementation NSDictionary (SafeParser)

+ (NSDictionary *)dictWithBundlePlist:(NSString *)resourceName {
    return [NSDictionary dictionaryWithContentsOfFile:
            [[NSBundle mainBundle] pathForResource:resourceName ofType:@"plist"]];
}

- (BOOL)hasValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
    return (value != nil && ![value isKindOfClass:[NSNull class]]);
}

- (NSString *)stringValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value respondsToSelector:@selector(stringValue)]) {
        return [value stringValue];
    }
    
    if (value != nil) {
        NSLog(@"String value for key: %@ is invalid: %@", key, [value class]);
    }
    return @"";
}

- (BOOL)booleanValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (NSNumber *)numberValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (int)intValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (NSInteger)integerValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (float)floatValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (double)doubleValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (long long)longLongValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
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

- (NSDictionary *)dictValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    
    if (value != nil) {
        NSLog(@"Dictionary value for key: %@ is invalid: %@", key, [value class]);
    }
    return nil;
}

- (NSMutableDictionary *)mutableDictValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSMutableDictionary class]]) {
        return value;
    }
    
    if ([value isMemberOfClass:[NSDictionary class]]) {
        return [NSMutableDictionary dictionaryWithDictionary:value];
    }
    
    if (value != nil) {
        NSLog(@"Mutable dictionary value for key: %@ is invalid: %@", key, [value class]);
    }
    return nil;
}

- (NSArray *)arrayValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    
    if (value != nil) {
        NSLog(@"Array value for key: %@ is invalid: %@", key, [value class]);
    }
    return nil;
}

- (NSMutableArray *)mutableArrayValueForKey:(NSString *)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSMutableArray class]]) {
        return value;
    }
    
    if ([value isMemberOfClass:[NSArray class]]) {
        return [NSMutableArray arrayWithArray:value];
    }
    
    if (value != nil) {
        NSLog(@"Mutable array value for key: %@ is invalid: %@", key, [value class]);
    }
    return nil;
}

- (id)objectValueForKey:(NSString *)key verifyClass:(Class)aClass {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:aClass]) {
        return value;
    }
    
    if (value != nil) {
        NSLog(@"Object value for key: %@ is invalid: %@", key, [value class]);
    }
    return nil;
}

- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    NSLog(@"Exception mutating method: %@ sent to immutable object !!!", NSStringFromSelector(_cmd));
}

- (void)removeObjectForKey:(id)aKey {
    NSLog(@"Exception mutating method: %@ sent to immutable object !!!", NSStringFromSelector(_cmd));
}

@end
