#import "PRCity.h"

@implementation PRCity
-(id)init{
    return [self initWithName:@"None" Lat:0 Lon:0 Country:@"None" WeatherMain:@"None" WeatherDescription:@"None" WeatherIcon:@"None" MainTemp:0 MainPressure:0 MainHumidity:0 MainTempMin:0 MainTempMax:0 WindSpeed:0 WindDeg:0 Cod:404];
}
-(id)initWithName:(NSString*)name Lat:(CGFloat)lat Lon:(CGFloat)lon Country:(NSString*)country WeatherMain:(NSString*) main WeatherDescription:(NSString*) description WeatherIcon:(NSString*)icon MainTemp:(CGFloat)temp MainPressure:(NSInteger)pressure MainHumidity:(NSInteger)humidity MainTempMin:(CGFloat)min MainTempMax:(CGFloat)max WindSpeed:(CGFloat)speed WindDeg:(CGFloat)deg Cod:(NSInteger)cod{
    self = [super init];
    if (self){
    self.name=name;
    self.lat=lat;
    self.lon=lon;
    self.country=country;
    self.weatherMain=main;
    self.weatherDescription=description;
    self.weatherIcon=icon;
    self.mainTemp=temp;
    self.mainPressure=pressure;
    self.mainHumidity=humidity;
    self.mainTempMin=min;
    self.mainTempMax=max;
    self.windSpeed=speed;
    self.windDeg=deg;
    self.cod=cod;
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone{
    id copy = [[[self class] allocWithZone:zone] init];
    [copy setName:[self name]];
    [copy setLat:[self lat]];
    [copy setLon:[self lon]];
    [copy setCountry:[self country]];
    [copy setWeatherMain:[self weatherMain]];
    [copy setWeatherDescription:[self weatherDescription]];
    [copy setWeatherIcon:[self weatherIcon]];
    [copy setMainTemp:[self mainTemp]];
    [copy setMainPressure:[self mainPressure]];
    [copy setMainHumidity:[self mainHumidity]];
    [copy setMainTempMin:[self mainTempMin]];
    [copy setMainTempMax:[self mainTempMax]];
    [copy setWindSpeed:[self windSpeed]];
    [copy setWindDeg:[self windDeg]];
    [copy setCod:[self cod]];
    return copy;
}
@end
