//
//  ViewController.h
//  FirstTestTask
//
//  Created by Ruslan on 8/31/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MKMapView;
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView* mapView;
@property (strong, nonatomic) NSString *city;
@property (assign, nonatomic) CGFloat lat;
@property (assign, nonatomic) CGFloat lon;
@property (strong, nonatomic) NSString *imageAdress;
@property (weak, nonatomic) IBOutlet UILabel *labelCountry;
@property (weak, nonatomic) IBOutlet UILabel *labelWeather;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
