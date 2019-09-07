//
//  NSData+MBZip.h
//  MBZip
//
//  Created by hui yao on 2019/9/7.
//  Copyright © 2019 MxcodeBen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MBZip)

//解压缩
- (NSData *)gzipInflate;
//压缩
- (NSData *)gzipDeflate;

@end

NS_ASSUME_NONNULL_END
