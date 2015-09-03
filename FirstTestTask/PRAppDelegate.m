
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
            [[PRServerManager sharedManager]getDataWithMethod:method onSuccess:^(NSArray *data)
             {
                 if ([[[data valueForKeyPath:@"cod"]firstObject]integerValue]!=404){
                         NSInteger cod =  [[[data valueForKeyPath:@"cod"]firstObject]integerValue];
                         CGFloat lon = [[[data valueForKeyPath:@"coord.lon"]firstObject]floatValue];
                         CGFloat lat = [[[data valueForKeyPath:@"coord.lat"]firstObject]floatValue];
                         NSString *name =  [[data valueForKeyPath:@"name"]firstObject];
                         NSString *country =[[data valueForKeyPath:@"sys.country"]firstObject];
                         NSString *weatherMain = [[[data valueForKeyPath:@"weather.main"]firstObject]firstObject];
                         NSString *weatherDescription = [[[data valueForKeyPath:@"weather.description"]firstObject]firstObject];
                         NSString *weatherIcon = [[[data valueForKeyPath:@"weather.icon"]firstObject]firstObject];
                         CGFloat mainTemp =  [[[data valueForKeyPath:@"main.temp"]firstObject]floatValue];
                         NSInteger mainPressure =  [[[data valueForKeyPath:@"main.pressure"]firstObject]integerValue];
                         NSInteger mainHumidity =  [[[data valueForKeyPath:@"main.humidity"]firstObject]integerValue];
                         CGFloat mainTempMin =  [[[data valueForKeyPath:@"main.temp_min"]firstObject]floatValue];
                         CGFloat mainTempMax =  [[[data valueForKeyPath:@"main.temp_max"]firstObject]floatValue];
                         CGFloat windSpeed =  [[[data valueForKeyPath:@"wind.speed"]firstObject]floatValue];
                         CGFloat windDeg =  [[[data valueForKeyPath:@"wind.deg"]firstObject]floatValue];
                         self.city = [[PRCity alloc]initWithName:name Lat:lat Lon:lon Country:country WeatherMain:weatherMain WeatherDescription:weatherDescription WeatherIcon:weatherIcon MainTemp:mainTemp MainPressure:mainPressure MainHumidity:mainHumidity MainTempMin:mainTempMin MainTempMax:mainTempMax WindSpeed:windSpeed WindDeg:windDeg Cod:cod];
                 }
                 else {
                     self.city=[[PRCity alloc]init];
                 }

             } onFailure:^(NSError *error, NSInteger statusCode)
             {
             }];
    }
@end
