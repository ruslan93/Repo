

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PRCity : NSObject<NSCopying>
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat lat;
@property (assign, nonatomic) CGFloat lon;
@property (strong, nonatomic) NSString* country;
@property (strong, nonatomic) NSString* weatherMain;
@property (strong, nonatomic) NSString* weatherDescription;
@property (strong, nonatomic) NSString* weatherIcon;
@property (assign, nonatomic) CGFloat mainTemp;
@property (assign, nonatomic) NSInteger mainPressure;
@property (assign, nonatomic) NSInteger mainHumidity;
@property (assign, nonatomic) CGFloat mainTempMin;
@property (assign, nonatomic) CGFloat mainTempMax;
@property (assign, nonatomic) CGFloat windSpeed;
@property (assign, nonatomic) CGFloat windDeg;
@property (assign, nonatomic) NSInteger cod;
@property (strong, nonatomic) NSMutableArray *cities;


-(id)initWithName:(NSString*)name Lat:(CGFloat)lat Lon:(CGFloat)lon Country:(NSString*)country WeatherMain:(NSString*) main WeatherDescription:(NSString*) description WeatherIcon:(NSString*)icon MainTemp:(CGFloat)temp MainPressure:(NSInteger)pressure MainHumidity:(NSInteger)humidity MainTempMin:(CGFloat)min MainTempMax:(CGFloat)max WindSpeed:(CGFloat)speed WindDeg:(CGFloat)deg Cod:(NSInteger)cod;
-(void) print;
@end
