//
//  SMTimeTask.h
//  x7sy
//
//  Created by smwl on 2019/11/18.
//  Copyright © 2019 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMTimeTask : NSObject

-(instancetype)initWithTimeI:(NSUInteger)time handle:(void(^)(void))handler;
///标志
@property(nonatomic,strong,readonly) NSString *taskID;
///单位时间为1/60
@property(nonatomic,assign) NSUInteger timeI;

@property(nonatomic,strong) void(^event) (void);

@end

NS_ASSUME_NONNULL_END
