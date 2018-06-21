//  ToolsHelper.h
//  OneCardMall
/**
 * ━━━━━━神兽出没━━━━━━
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　　　　　┃
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　　　　　┃
 * 　　┃　　　┻　　　┃
 * 　　┃　　　　　　　┃
 * 　　┗━┓　　　┏━┛Code is far away from bug with the animal protecting
 * 　　　　┃　　　┃    神兽保佑,代码无bug
 * 　　　　┃　　　┃
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　　　　　　┣┓
 * 　　　　┃　　　　　　　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┃┫┫　┃┫┫
 * 　　　　　┗┻┛　┗┻┛
 *
 * ━━━━━━感觉萌萌哒━━━━━━
 */
//  Created by 李策 on 2018/5/21.
//  Copyright © 2018年 李策. All rights reserved.杰克
//  @class ToolsHelper
//  @abstract <#类的描述#>
//  @discussion <#类的功能#>
//

#import <Foundation/Foundation.h>

@interface ToolsHelper : NSObject

//清除WKWebView的cookie和缓存
+(void)removeWKWebViewCache;

//json字符串转为字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark - ------------- 监测网络状态 -------------
//监测网络状态
+ (void)monitorNetworking;
@end
