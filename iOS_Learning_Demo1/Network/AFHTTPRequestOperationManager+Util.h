//
//  AFHTTPRequestOperationManager+Util.h
//  UISMSDKDevApp
//
//  Created by zunshanli on 16/1/4.
//  Copyright © 2016年 Shangminet. All rights reserved.
//

#import <AFHTTPRequestOperationManager.h>
#import <AFHTTPSessionManager.h>

//封装,一个网络请求数据类--------要专门学一下

//定义两个block接收成功与失败
//响应成功，返回的是id类型，外部再转换成类型模型就可以了。
typedef void (^HttpSuccess)(id responseObject);
typedef void (^HttpFailure)(NSError *error);

//-------------数据？？？数据这样接收？？？ data
typedef void (^HttpBody)(id <AFMultipartFormData> formData);

//-------------（Util）
@interface AFHTTPRequestOperationManager (Util)

+ (instancetype)SMManager;

@end



@interface SMAFNHelper : NSObject
//AFNetworking实现网络通信，定义好的可以直接调用。
//post请求：
+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;

//文件上传
//-------------fromData--20 行 formData???
+ (AFHTTPRequestOperation *)POST:(NSString *)url parameters:(NSDictionary *)parameters body:(HttpBody)fromData success:(HttpSuccess)success failure:(HttpFailure)failure;

+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;
@end

/*  可以对比一下
 //Get请求的方法封装
 +(void)doGetWithUrlStr:(NSString*)urlString
                        contentType:(NSString*)type
                        finished:(DownLoadFinishedBlock)finished
                        failure:(DownLoadFialedBlock)fialed;

 //Post请求的方法封装
 +(void)doPostWithUrlStr:(NSString*)urlString
                        parameters:(NSDictionary*)dic
                        contentType:(NSString*)type
                        finished:(DownLoadFinishedBlock)finished
                        failure:(DownLoadFialedBlock)fialed;
 */
 
