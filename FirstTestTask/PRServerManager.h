#import <Foundation/Foundation.h>

@interface PRServerManager : NSObject

+ (PRServerManager*) sharedManager;


- (void) getDataWithMethod:(NSString*)method
                 onSuccess:(void(^)(NSArray* data)) success
                 onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
