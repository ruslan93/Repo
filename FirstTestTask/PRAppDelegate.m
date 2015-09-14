
#import "PRAppDelegate.h"
#import "PRServerManager.h"
#import "AFNetworking.h"
#import "PRCity.h"
@interface PRAppDelegate ()

@end

@implementation PRAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)getDataFromServer:(NSString*) name{
            NSString *method = [NSString stringWithFormat:@"?q=%@", name];
            [[PRServerManager sharedManager]getDataWithMethod:method onSuccess:^(PRCity *data)
             {
                 self.city=data;
                 
             } onFailure:^(NSError *error, NSInteger statusCode)
             {
             }];
    }

@end
