#import "PRServerManager.h"
#import "AFNetworking.h"
#import "PRCity.h"

@interface PRServerManager ()
@property (nonatomic,copy) PRCity* city;
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
                    onSuccess:(void(^)(PRCity* data)) success
                    onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {
    [self.requestOperationManager
     GET:method
     parameters:nil
     success:^(AFHTTPRequestOperation *operation, NSDictionary* data) {
         if ([[data valueForKeyPath:@"cod"]integerValue]!=404){
             NSInteger cod =  [[data valueForKeyPath:@"cod"]integerValue];
             CGFloat lon = [[data valueForKeyPath:@"coord.lon"]floatValue];
             CGFloat lat = [[data valueForKeyPath:@"coord.lat"]floatValue];
             NSString *name =  [data valueForKeyPath:@"name"];
             NSString *country =[data valueForKeyPath:@"sys.country"];
             NSString *weatherMain = [[data valueForKeyPath:@"weather.main"]firstObject];
             NSString *weatherDescription = [[data valueForKeyPath:@"weather.description"]firstObject];
             NSString *weatherIcon = [[data valueForKeyPath:@"weather.icon"]firstObject];
             CGFloat mainTemp =  [[data valueForKeyPath:@"main.temp"]floatValue]-273.15f;
             NSInteger mainPressure =  [[data valueForKeyPath:@"main.pressure"]integerValue];
             NSInteger mainHumidity =  [[data valueForKeyPath:@"main.humidity"]integerValue];
             CGFloat mainTempMin =  [[data valueForKeyPath:@"main.temp_min"]floatValue]-273.15f;
             CGFloat mainTempMax =  [[data valueForKeyPath:@"main.temp_max"]floatValue]-273.15f;
             CGFloat windSpeed =  [[data valueForKeyPath:@"wind.speed"]floatValue];
             CGFloat windDeg =  [[data valueForKeyPath:@"wind.deg"]floatValue];
             self.city = [[PRCity alloc]initWithName:name Lat:lat Lon:lon Country:country WeatherMain:weatherMain WeatherDescription:weatherDescription WeatherIcon:weatherIcon MainTemp:mainTemp MainPressure:mainPressure MainHumidity:mainHumidity MainTempMin:mainTempMin MainTempMax:mainTempMax WindSpeed:windSpeed WindDeg:windDeg Cod:cod];
         }
         else {
             self.city=[[PRCity alloc]init];
         }

         if (success) {
             success(self.city);
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


//- (void) getData2WithMethod:(NSString*)method
//                 onSuccess:(void(^)(NSMutableArray* data)) success
//                 onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {
//    
//    
//    NSURL* url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/forecast?q=London,us"];
//    self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
//
//    
//    
//    [self.requestOperationManager
//     GET:method
//     parameters:nil
//     success:^(AFHTTPRequestOperation *operation, NSDictionary* data) {
//         NSArray *tempArray = [data valueForKey:@"list"];
//         for ( NSDictionary *dic in tempArray) {
//             PRCity *city = [[PRCity alloc]init];
//             city.mainTemp = [[dic valueForKeyPath:@"main.temp"]floatValue];
//             city.weatherDescription=[[dic valueForKeyPath:@"weather.description"]firstObject];
//             city.weatherIcon=[[dic valueForKeyPath:@"weather.icon"]firstObject];
//             city.windSpeed = [[dic valueForKeyPath:@"wind.speed"]floatValue];
//             city.mainHumidity =[[dic valueForKeyPath:@"clouds.all"]integerValue];
//             city.mainPressure =[[dic valueForKeyPath:@"main.pressure"]integerValue];
//             [self.city.cities addObject:city];
//         }
//         
//         if (success) {
//             success(self.city.cities);
//         }
//         
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
//     {
//         NSLog(@"Error: %@", error);
//         if (failure)
//         {
//             failure(error, operation.response.statusCode);
//         }
//     }];
//    
//}



@end
