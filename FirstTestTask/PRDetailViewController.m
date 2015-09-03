
#import "PRDetailViewController.h"
#import "PRAppDelegate.h"

@interface PRDetailViewController ()
@property (strong) PRAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *labelCountry;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelCloudiness;
@property (weak, nonatomic) IBOutlet UILabel *labelCurrentTemperature;
@property (weak, nonatomic) IBOutlet UILabel *labelPressure;
@property (weak, nonatomic) IBOutlet UILabel *labelHumidity;
@property (weak, nonatomic) IBOutlet UILabel *labelMaxTemperature;
@property (weak, nonatomic) IBOutlet UILabel *labelMinTemperature;
@property (weak, nonatomic) IBOutlet UILabel *labelWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *labelWindDeg;
@property (weak, nonatomic) IBOutlet UILabel *labelCoords;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelWeather;
@property (weak, nonatomic) IBOutlet UILabel *labelCelsiusTemperature;

@end

@implementation PRDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
}

-(void)viewWillAppear:(BOOL)animated{
    PRCity *city = self.appDelegate.city;
    [self.labelCountry setText:city.country];
    [self.labelCity setText:city.name];
    [self.labelCloudiness setText:city.weatherDescription];
    [self.labelCurrentTemperature setText:[NSString stringWithFormat:@"%ld", (long)city.mainTemp ]];
    [self.labelPressure setText:[NSString stringWithFormat:@"%ld hpa", (long)city.mainPressure ]];
    [self.labelHumidity setText:[NSString stringWithFormat:@"%ld %c", (long)city.mainHumidity, '%' ]];
    [self.labelMaxTemperature setText:[NSString stringWithFormat:@"%ld", (long)city.mainTempMax ]];
    [self.labelMinTemperature setText:[NSString stringWithFormat:@"%ld", (long)city.mainTempMin ]];
    [self.labelWindSpeed setText:[NSString stringWithFormat:@"%ld m/s", (long)city.windSpeed ]];
    [self.labelWindDeg setText:[NSString stringWithFormat:@"%ld", (long)city.windDeg ]];
    [self.labelCoords setText: [NSString stringWithFormat:@"[%.3f,%.3f]", city.lat, city.lon]];

    NSString *ImageURL = [NSString stringWithFormat:@"%@%@", @"http://api.openweathermap.org/img/w/", self.appDelegate.city.weatherIcon];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    self.imageView.image = [UIImage imageWithData:imageData];
    self.labelCelsiusTemperature.text=[NSString stringWithFormat:@"%.2f C", self.appDelegate.city.mainTemp-273.15f];
    self.labelWeather.text=self.appDelegate.city.weatherMain;
    

}

                                                                                                                                
                                                                                                                                
                                                                                                                                
@end
