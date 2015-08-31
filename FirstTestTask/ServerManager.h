//
//  ServerManager.h
//  FirstTestTask
//
//  Created by Ruslan on 25.11.14.
//  Copyright (c) 2014 Ruslan Palapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerManager : NSObject

+ (ServerManager*) sharedManager;


- (void) getDataWithMethod:(NSString*)method
                 onSuccess:(void(^)(NSArray* data)) success
                 onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
