//
//  DemoLocationViewController.m
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/8/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import "DemoLocationViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DemoLocationViewController () <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, strong) MKPointAnnotation * annotation;

@end

@implementation DemoLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    [self.mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.mapView.layer.cornerRadius = 6.0f;
    self.annotation = [[MKPointAnnotation alloc] init];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"NewLocation %f %f", location.coordinate.latitude, location.coordinate.longitude);
    
    CLLocationCoordinate2D infiniteLoopCoordinate  = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
    [self.annotation setCoordinate: infiniteLoopCoordinate];
    [self.annotation setTitle: @"LocationNhan"];
    [self.mapView addAnnotation: self.annotation];
    self.mapView.region = MKCoordinateRegionMakeWithDistance(infiniteLoopCoordinate, 3000.0f, 3000.0f);
}

@end
