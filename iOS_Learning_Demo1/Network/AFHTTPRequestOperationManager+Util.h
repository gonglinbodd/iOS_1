//
//  AFHTTPRequestOperationManager+Util.h
//  UISMSDKDevApp
//
//  Created by zunshanli on 16/1/4.
//  Copyright © 2016年 Shangminet. All rights reserved.
//

#import <AFHTTPRequestOperationManager.h>
#import <AFHTTPSessionManager.h>

typedef void (^HttpSuccess)(id responseObject);
typedef void (^HttpFailure)(NSError *error);
typedef void (^HttpBody)(id <AFMultipartFormData> formData);

@interface AFHTTPRequestOperationManager (Util)

+ (instancetype)SMManager;

@end

@interface SMAFNHelper : NSObject

+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;
+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters body:(HttpBody)fromData success:(HttpSuccess)success failure:(HttpFailure)failure;
+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;
@end
