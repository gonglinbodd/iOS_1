//
//  UserLoginModel.m
//  iOS_Learning_Demo1
//
//  Created by shangminet on 2023/6/19.
//

#import "UserLoginModel.h"

@implementation UserLoginModel
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.userName = [coder decodeObjectForKey:@"userName"];
        self.userPassword = [coder decodeObjectForKey:@"userPassword"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.userName forKey:@"userName"];
    [coder encodeObject:self.userPassword forKey:@"userPassword"];
}
@end
