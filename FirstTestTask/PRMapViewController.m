//
//  ViewController.m
//  FirstTestTask
//
//  Created by Ruslan on 8/31/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "ServerManager.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.city;
self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1/255.f green:122/255.f blue:1 alpha:1]};
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self getDataFromServer];
}

-(void)getDataFromServer{
    NSString *method = [NSString stringWithFormat:@"?q=%@", self.city];
    [[ServerManager sharedManager]getDataWithMethod:method onSuccess:^(NSArray *data)
     {
         CGFloat lon = [[[data valueForKeyPath:@"coord.lon"]firstObject]floatValue];
         CGFloat lat = [[[data valueForKeyPath:@"coord.lat"]firstObject]floatValue];
         [self.labelCountry setText:[[data valueForKeyPath:@"sys.country"]firstObject]];
         [self.labelWeather setText:[[[data valueForKeyPath:@"weather.description"]firstObject]firstObject]];
         NSString *icon = [[[data valueForKeyPath:@"weather.icon"]firstObject]firstObject];
         NSString *ImageURL = [NSString stringWithFormat:@"%@%@", @"http://api.openweathermap.org/img/w/", icon];
         NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
         self.imageView.image = [UIImage imageWithData:imageData];
         CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
         MKCoordinateRegion region;
         region.center.latitude = location.coordinate.latitude;
         region.center.longitude = location.coordinate.longitude;
         region.span.latitudeDelta = 1;
         region.span.longitudeDelta = 1;
         
         [self.mapView setRegion:region animated:YES];

     } onFailure:^(NSError *error, NSInteger statusCode)
     {
         
     }];
}



@end
