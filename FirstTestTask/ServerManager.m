//
//  ServerManager.m
//  FirstTestTask
//
//  Created by Ruslan on 25.11.14.
//  Copyright (c) 2014 Ruslan Palapa. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"

@interface ServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;
@end


@implementation ServerManager


+ (ServerManager*) sharedManager {
    
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSURL* url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather"];
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    }
    return self;
}


- (void) getDataWithMethod:(NSString*)method
                    onSuccess:(void(^)(NSArray* data)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {
    
    [self.requestOperationManager
     GET:[method stringByAppendingString:@""]
     parameters:nil
     success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
         NSMutableArray* objectsArray = [NSMutableArray array];
         [objectsArray addObject:responseObject];

         if (success) {
             success(objectsArray);
         }
         
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
        
        if (failure)
        {
            failure(error, operation.response.statusCode);
        }
    }];
    
}


@end
