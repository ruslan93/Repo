

#import <UIKit/UIKit.h>
@class MKMapView;
@class PRCity;
@interface PRMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView* mapView;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *labelHumidity;
@property (weak, nonatomic) IBOutlet UILabel *labelWeatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelTemperature;
@end
