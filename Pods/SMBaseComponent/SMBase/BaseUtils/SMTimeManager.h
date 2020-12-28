//
//  SMTimeManager.h
//  x7sy
//
//  Created by smwl on 2019/11/18.
//  Copyright © 2019 shangminet. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SMTimeTask;

@interface SMTimeManager : NSObject

+(instancetype)sharedManager;

-(void)runTask:(SMTimeTask *)task;

-(void)cancelTaskWithID:(NSString *)taskID;

@end

NS_ASSUME_NONNULL_END
