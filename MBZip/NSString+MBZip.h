//
//  NSString+MBZip.h
//  MBZip
//
//  Created by hui yao on 2019/9/7.
//  Copyright © 2019 MxcodeBen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MBZip)

//字符串压缩
- (NSString *)gzipDeflate;
//字符串解压
- (NSString *)gzipInflate;

@end

NS_ASSUME_NONNULL_END
