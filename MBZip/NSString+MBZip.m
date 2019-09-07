//
//  NSString+MBZip.m
//  MBZip
//
//  Created by hui yao on 2019/9/7.
//  Copyright © 2019 MxcodeBen. All rights reserved.
//

#import "NSString+MBZip.h"
#import "NSData+MBZip.h"

@implementation NSString (MBZip)

//static NSString * const zipHeader = @"H4sIAAAAAAAAA";
static NSString * const zipHeader = @"";

- (NSString *)gzipDeflate{
    NSData * outputData = [[self dataUsingEncoding:NSUTF8StringEncoding] gzipDeflate];
    NSString * outputStr = [outputData base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
    return [outputStr substringFromIndex:zipHeader.length];
}
- (NSString *)gzipInflate{
    NSString * inputStr = [NSString stringWithFormat:@"%@%@",zipHeader,self];
    NSData * outputData = [[[NSData alloc]initWithBase64EncodedString:inputStr options:NSDataBase64DecodingIgnoreUnknownCharacters] gzipInflate];
    return [[NSString alloc]initWithData:outputData encoding:NSUTF8StringEncoding];
}

@end
