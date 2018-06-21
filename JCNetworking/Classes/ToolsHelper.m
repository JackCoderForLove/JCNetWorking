//  ToolsHelper.m
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

#import "ToolsHelper.h"
#import <WebKit/WebKit.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
@implementation ToolsHelper

//清除WKWebView的cookie和缓存
+(void)removeWKWebViewCache
{
    
    if (@available(iOS 9.0, *)) {
        
//            NSSet *websiteDataTypes= [NSSet setWithArray:@[
//                                                           WKWebsiteDataTypeDiskCache,
//                                                           //WKWebsiteDataTypeOfflineWebApplication
//                                                           WKWebsiteDataTypeMemoryCache,
//                                                           //WKWebsiteDataTypeLocal
//                                                           WKWebsiteDataTypeCookies,
//                                                           //WKWebsiteDataTypeSessionStorage,
//                                                           //WKWebsiteDataTypeIndexedDBDatabases,
//                                                           //WKWebsiteDataTypeWebSQLDatabases
//                                                           ]];
        NSSet *websiteDataTypes= [NSSet setWithArray:@[
                                                       WKWebsiteDataTypeDiskCache,
                                                       WKWebsiteDataTypeOfflineWebApplicationCache,
                                                       WKWebsiteDataTypeMemoryCache,
                                                       WKWebsiteDataTypeCookies,
                                                       WKWebsiteDataTypeSessionStorage,
                                                       WKWebsiteDataTypeIndexedDBDatabases,
                                                       WKWebsiteDataTypeWebSQLDatabases
                                                       ]];
        
//
            // All kinds of data
            //NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
            NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
            [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
                
                   [[UIApplication sharedApplication].keyWindow makeToast:@"清除缓存成功" duration:1 position:CSToastPositionCenter];
            }];
            [[NSURLCache sharedURLCache] removeAllCachedResponses];
        
    } else {
        //先删除cookie
        NSHTTPCookie *cookie;
        NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (cookie in [storage cookies])
        {
            [storage deleteCookie:cookie];
        }
        
        NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]
                                objectForKey:@"CFBundleIdentifier"];
        NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
        NSString *webKitFolderInCaches = [NSString
                                          stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
        NSString *webKitFolderInCachesfs = [NSString
                                            stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir,bundleId];
        NSError *error;
        /* iOS8.0 WebView Cache的存放路径 */
        [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
        [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:nil];
        /* iOS7.0 WebView Cache的存放路径 */
        [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCachesfs error:&error];
        NSString *cookiesFolderPath = [libraryDir stringByAppendingString:@"/Cookies"];
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&error];
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }

}

//json字符串转为字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark - ------------- 监测网络状态 -------------
+ (void)monitorNetworking
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
                NSLog(@"未知网络");
                [[NSNotificationCenter defaultCenter]postNotificationName:@"monitorNetworking" object:@"-1" userInfo:nil];
                break;
            case 0:
                NSLog(@"网络不可达");
                [[NSNotificationCenter defaultCenter]postNotificationName:@"monitorNetworking" object:@"0" userInfo:nil];
                break;
            case 1:
            {
                NSLog(@"GPRS网络");
                //发通知，带头搞事
                [[NSNotificationCenter defaultCenter] postNotificationName:@"monitorNetworking" object:@"1" userInfo:nil];
            }
                break;
            case 2:
            {
                NSLog(@"wifi网络");
                //发通知，搞事情
                [[NSNotificationCenter defaultCenter] postNotificationName:@"monitorNetworking" object:@"2" userInfo:nil];
            }
                break;
            default:
                break;
        }
        if (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"有网");
        }else{
            NSLog(@"没网");
        }
    }];
}
@end
