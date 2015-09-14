#import <Foundation/Foundation.h>
@class PRCity;
@interface PRServerManager : NSObject

+ (PRServerManager*) sharedManager;


- (void) getDataWithMethod:(NSString*)method
                 onSuccess:(void(^)(PRCity* data)) success
                 onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;
//- (void) getData2WithMethod:(NSString*)method
//                 onSuccess:(void(^)(NSMutableArray* data)) success
//                 onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
