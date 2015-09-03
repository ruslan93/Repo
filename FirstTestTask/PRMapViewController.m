
#import "PRMapViewController.h"
#import <MapKit/MapKit.h>
#import "PRServerManager.h"
#import "AFNetworking.h"
#import "PRAppDelegate.h"
#import "PRDetailViewController.h"

@interface PRMapViewController ()
@property (strong) PRAppDelegate *appDelegate;
@end

@implementation PRMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1/255.f green:122/255.f blue:1 alpha:1]};
    [[self navigationController] setNavigationBarHidden:NO];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(buttonInfoPressed)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    [self.navigationItem setTitle:self.appDelegate.city.name];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:self.appDelegate.city.lat longitude:self.appDelegate.city.lon];
    MKCoordinateRegion region;
    region.center.latitude = location.coordinate.latitude;
    region.center.longitude = location.coordinate.longitude;
    region.span.latitudeDelta = 1;
    region.span.longitudeDelta = 1;
    [self.mapView setRegion:region animated:YES];
    }

-(void)buttonInfoPressed{
    PRDetailViewController *controller  = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
