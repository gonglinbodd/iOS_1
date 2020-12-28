//
//  AFHTTPRequestOperationManager+Util.m
//  UISMSDKDevApp
//
//  Created by zunshanli on 16/1/4.
//  Copyright © 2016年 Shangminet. All rights reserved.
//

#import "AFHTTPRequestOperationManager+Util.h"
#import "SMUtils.h"

#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>

@implementation AFHTTPRequestOperationManager (Util)

+ (instancetype)SMManager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain", nil];
    NSString * user_agent = [SMUtils generateUserAgent];
    [manager.requestSerializer setValue:user_agent forHTTPHeaderField:@"User-Agent"];
    
    return manager;
}

@end

@implementation SMAFNHelper

+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager SMManager];
    return [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSError * errors;
        if (error.code == -1009) {
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"网络异常，请检查网络连接状态后重试（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == -1001){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"网络连接超时（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == -1012){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"服务器响应异常，请检查是否配置了网络代理（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else{
            NSString * errorText = error.localizedDescription;
            if ([operation.responseObject isKindOfClass:[NSDictionary class]]) {    //java返回错误给用户的方式
                NSDictionary * tmp = operation.responseObject;
                NSString * debugMessage = [tmp objectForKey:@"debugMessage"] ? : @"";
                if (debugMessage.length > 0) {
                    errorText = debugMessage;
                }
            }
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"%@（%ld）",errorText,error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }
        if (errors) {
            failure(errors);
        }else{
            failure(error);
        }
    }];
}

+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters body:(HttpBody)body success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager SMManager];
    return [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (body) {
            body(formData);
        }
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSError * errors;
        if (error.code == -1009) {
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"网络异常，请检查网络连接状态后重试（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == -1001){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"网络连接超时（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == -1012){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"服务器响应异常，请检查是否配置了网络代理（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        } else{
            NSString * errorText = error.localizedDescription;
            if ([operation.responseObject isKindOfClass:[NSDictionary class]]) {    //java返回错误给用户的方式
                NSDictionary * tmp = operation.responseObject;
                NSString * debugMessage = [tmp objectForKey:@"debugMessage"] ? : @"";
                if (debugMessage.length > 0) {
                    errorText = debugMessage;
                }
            }
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"%@（%ld）",errorText,error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }

        if (errors) {
            failure(errors);
        }else{
            failure(error);
        }
    }];
}

+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager SMManager];
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSError * errors;
        if (error.code == -1009) {
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"网络异常，请检查网络连接状态后重试（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == -1001){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"网络连接超时（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == 3840){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"数据格式有误（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else if (error.code == -1012){
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"服务器响应异常，请检查是否配置了网络代理（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        } else{
            NSString * errorText = error.localizedDescription;
            if ([operation.responseObject isKindOfClass:[NSDictionary class]]) {    //java返回错误给用户的方式
                NSDictionary * tmp = operation.responseObject;
                NSString * debugMessage = [tmp objectForKey:@"debugMessage"] ? : @"";
                if (debugMessage.length > 0) {
                    errorText = debugMessage;
                }
            }
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"%@（%ld）",errorText,error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }

        if (failure) {
            if (errors) {
                failure(errors);
            }else{
                failure(error);
            }
        }
    }];
}


@end
