
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


@end

@implementation PRDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
    [self.navigationItem setTitle: @"Details"];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
        UIImageView *tableBackgroundView = [[UIImageView alloc]
                                            initWithImage:[UIImage imageNamed:@"image.jpg"]];
        [tableBackgroundView setFrame: self.tableView.frame];
    [self.tableView setBackgroundView:tableBackgroundView];
}

-(void)viewWillAppear:(BOOL)animated{
    PRCity *city = self.appDelegate.city;
    [self.labelCountry setText:city.country];
    [self.labelCity setText:city.name];
    [self.labelCloudiness setText:city.weatherDescription];
    [self.labelCurrentTemperature setText:[NSString stringWithFormat:@"%ldºC", (long)city.mainTemp ]];
    [self.labelPressure setText:[NSString stringWithFormat:@"%ld hpa", (long)city.mainPressure ]];
    [self.labelHumidity setText:[NSString stringWithFormat:@"%ld %c", (long)city.mainHumidity, '%' ]];
    [self.labelMaxTemperature setText:[NSString stringWithFormat:@"%ldºC", (long)city.mainTempMax ]];
    [self.labelMinTemperature setText:[NSString stringWithFormat:@"%ldºC", (long)city.mainTempMin ]];
    [self.labelWindSpeed setText:[NSString stringWithFormat:@"%ld m/s", (long)city.windSpeed ]];
    [self.labelWindDeg setText:[NSString stringWithFormat:@"%ld", (long)city.windDeg ]];
    [self.labelCoords setText: [NSString stringWithFormat:@"[%.3f,%.3f]", city.lat, city.lon]];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    NSString *string = [self tableView:self.tableView titleForHeaderInSection:section];
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:0.5]];
    return view;
}

                                                                                                                                
                                                                                                                                
@end
