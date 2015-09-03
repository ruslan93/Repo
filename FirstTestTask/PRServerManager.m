#import "PRServerManager.h"
#import "AFNetworking.h"

@interface PRServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;
@end


@implementation PRServerManager


+ (PRServerManager*) sharedManager {
    static PRServerManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PRServerManager alloc] init];
    });
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSURL* url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q="];
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
