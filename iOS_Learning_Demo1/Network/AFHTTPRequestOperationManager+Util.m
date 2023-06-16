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
    //对NSURLConnection的封装.
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //-----------为什么没有这句话？ 难道不要选择哪种请求格式吗？
    //manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    /*
     设置管理者的数据解析类型,默认为json格式的解析,可手动修改为其他类型。acceptableContentTypes默认情况下无text/plain类型
    eg:
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];
     */
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain", nil];
    
    //NSString * user_agent = [SMUtils generateUserAgent];
    
    /*
     ---------设置请求头？跳转过去看看。
     AFJSONRequestSerializer 请求格式是JSON格式，AFHTTPRequestSerializer 请求格式是二进制.
     返回在请求序列化器中设置的HTTP头的值。
     field要检索默认值的HTTP头.
     指定标头的默认值，或' nil '.
    */
    [manager.requestSerializer setValue:@"111" forHTTPHeaderField:@"User-Agent"];
    
    return manager;
}

@end

@implementation SMAFNHelper

+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager SMManager];
    
    /*
     这一新特性的核心是两个新的类型修饰：
        __nullable和__nonnull。
     从字面上我们可知，__nullable表示对象可以是NULL或nil，而__nonnull表示对象不应该为空。当我们不遵循这一规则时，编译器就会给出警告。
     为了避免与第三方库潜在的冲突，苹果把 __nonnull/__nullable改成 _Nonnull/_Nullable
    */
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
            //ErrorUserCancelledAuthentication 用户被取消了验证
            NSDictionary * dict = @{@"NSLocalizedDescription":[NSString stringWithFormat:@"服务器响应异常，请检查是否配置了网络代理（%ld）",error.code]};
            errors = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:error.code userInfo:dict];
        }else{
            NSString * errorText = error.localizedDescription;
            //判断self->isa的继承链 指向是否与入参相等。
            if ([operation.responseObject isKindOfClass:[NSDictionary class]]) {    //java返回错误给用户的方式
                NSDictionary * tmp = operation.responseObject;
                //condition?expression1:expression2
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
