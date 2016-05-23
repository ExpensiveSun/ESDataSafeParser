//
//  DataSafeParser.m
//  Weather
//
//  Created by suguiyang@91.com on 15-03-19.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import "DataSafeParser.h"

@implementation DataSafeParser

+ (BOOL)stringIsNullOrEmpty:(NSString *)value {
    if (value == nil) {
        return YES;
    }
    if (![value isKindOfClass:[NSString class]]) {
        return YES;
    }
    if ([[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
         isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

+ (id)parserValueWithData:(NSData *)JSONData verifyClass:(Class)aClass
{
    if (JSONData == nil ) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return nil;
    }
    
    id value = nil;
    @try {
        NSError *error = nil;
        value = [NSJSONSerialization JSONObjectWithData:JSONData
                                                options:NSJSONReadingAllowFragments
                                                  error:&error];
        if (error != nil) {
            NSLog(@"JSON serialization error: %@", error);
            return nil;
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception (%@ - %@): %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), exception);
    }

    if (!value || ![value isKindOfClass:aClass]) {
        NSLog(@"Verify value: %@ with class: %@ failed", value, NSStringFromClass(aClass));
        return nil;
    }
    
    return value;
}

+ (id)parserValue:(NSString *)JSONContent verifyClass:(Class)aClass
{
    if ([self stringIsNullOrEmpty:JSONContent]) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSData *data = [JSONContent dataUsingEncoding:NSUTF8StringEncoding];
    return [self parserValueWithData:data verifyClass:aClass];
}

+ (NSDictionary *)dictionaryValue:(NSString *)content
{
    return [self parserValue:content verifyClass:[NSDictionary class]];
}

+ (NSArray *)arrayValue:(NSString *)content
{
    return [self parserValue:content verifyClass:[NSArray class]];
}

+ (NSDictionary *)dictionaryValueFromObject:(id)object
{
    if (object && [object isKindOfClass:[NSString class]]) {
        return [self parserValue:(NSString *)object verifyClass:[NSDictionary class]];
    } else if (object && [object isKindOfClass:[NSData class]]) {
        return [self parserValueWithData:(NSData *)object verifyClass:[NSDictionary class]];
    }
    
    return nil;
}

+ (NSArray *)arrayValueFromObject:(id)object
{
    if (object && [object isKindOfClass:[NSString class]]) {
        return [self parserValue:(NSString *)object verifyClass:[NSArray class]];
    } else if (object && [object isKindOfClass:[NSData class]]) {
        return [self parserValueWithData:(NSData *)object verifyClass:[NSArray class]];
    }
    
    return nil;
}

//验证字段是否存在
+ (BOOL)verifyDictionary:(NSDictionary *)dict withKeys:(NSArray *)keys
{
    if (dict == nil || keys == nil) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return NO;
    }
    
    for (NSString *key in keys) {
        id value = [dict objectForKey:key];
        if (value == nil || [value isKindOfClass:[NSNull class]]) {
            NSLog(@"%@ is not validity without key: %@", dict, key);
            return NO;
        }
    }
    
    return YES;
}

//验证字段的值是否有效
+ (BOOL)verifyDataValue:(NSDictionary *)dict withKeys:(NSArray *)keys
{
    if (dict == nil || keys == nil) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return NO;
    }
    
    for (NSString *key in keys) {
        id value = [dict objectForKey:key];
        if (value == nil || [value isKindOfClass:[NSNull class]]) {
            NSLog(@"%@ is not validity without key: %@", dict, key);
            return NO;
        } else if ([value isKindOfClass:[NSString class]]) {
            if ([self stringIsNullOrEmpty:value]) {
                NSLog(@"%@ has not valid string value with key: %@", dict, key);
                return NO;
            }
        } else if ([value isKindOfClass:[NSArray class]]) {
            if ([value count] == 0) {
                NSLog(@"%@ has not valid array value with key: %@", dict, key);
                return NO;
            }
        }
    }
    
    return YES;
}

//将对象转换成JSON字符串
+ (NSString *)JSONRepresentationWithObject:(id)object
{
    if (object == nil) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSData *jsonData = nil;
    @try {
        NSError *error = nil;
        jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
        if (jsonData == nil || error) {
            NSLog(@"JSON serialization error: %@", error);
            return @"";
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception (%@ - %@): %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), exception);
        return @"";
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

//将JSON字符串转换成对象
+ (id)JSONValueFromContent:(NSString *)content
{
    if ([self stringIsNullOrEmpty:content]) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return nil;
    }

    id value = nil;
    @try {
        NSError *error = nil;
        NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
        value = [NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingAllowFragments
                                                  error:&error];
        if (error != nil) {
            NSLog(@"JSON serialization error: %@", error);
            return nil;
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception (%@ - %@): %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), exception);
    }

    return value;
}

+ (id)JSONValueFromObject:(id)object
{
    if (object == nil) {
        NSLog(@"Function (%@) param is invalid", NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSData *data = nil;
    if ([object isKindOfClass:[NSString class]]) {
        if (![self stringIsNullOrEmpty:object]) {
            data = [(NSString *)object dataUsingEncoding:NSUTF8StringEncoding];
        }
    } else if ([object isKindOfClass:[NSData class]]) {
        data = (NSData *)object;
    }
    
    if (data == nil) {
        NSLog(@"JSON serialization invalid object: %@", object);
        return nil;
    }
    
    id value = nil;
    @try {
        NSError *error = nil;
        value = [NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingAllowFragments
                                                  error:&error];
        if (error != nil) {
            NSLog(@"JSON serialization error: %@", error);
            return nil;
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception (%@ - %@): %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), exception);
    }
    
    return value;
}

@end
