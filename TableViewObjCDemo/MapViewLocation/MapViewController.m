//
//  MapViewController.m
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/5/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import "MapViewController.h"
#import "BBLocationManager.h"
#import <MapKit/MapKit.h>

@interface MapViewController () <BBLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *continiousLocation;
@property (weak, nonatomic) IBOutlet UILabel *logText;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, strong) MKPointAnnotation * annotation;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BBLocationManager *manager = [BBLocationManager sharedManager];
    manager.delegate = self;
    
    [self.mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.mapView.layer.cornerRadius = 6.0f;
    self.annotation = [[MKPointAnnotation alloc] init];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getContiniousLocation) userInfo:nil repeats:YES];

}

- (IBAction)getCurrentLocation:(id)sender {
    BBLocationManager *manager = [BBLocationManager sharedManager];
    [manager getCurrentLocationWithCompletion:^(BOOL success, NSDictionary *locationDictionary, NSError *error) {
        [self logText:[ NSString stringWithFormat:@"Current location: %@", locationDictionary.description]];
        [self showInMapsWithDictionary: locationDictionary title:@"Current Location" ];
    }];
}

-(void)logText:(NSString*)text {
    self.logText.text = text;
}




-(void)logTextContiniousLocaition:(NSString*)text {
    self.continiousLocation.text = text;
}




-(void)getContiniousLocation {
    BBLocationManager *manager = [BBLocationManager sharedManager];
    [manager getCurrentLocationWithCompletion:^(BOOL success, NSDictionary *locationDictionary, NSError *error) {
        [self logTextContiniousLocaition:[ NSString  stringWithFormat:@"Continious Location: %@", locationDictionary.description]];
         [self showInMapsWithDictionary: locationDictionary title:@"Current Location" ];
    }];
}

-(void)showInMapsWithDictionary: (NSDictionary*)locationDict title: (NSString*)title {
    CLLocationCoordinate2D infiniteLoopCoordinate  = CLLocationCoordinate2DMake([locationDict[BB_LATITUDE] floatValue], [locationDict[BB_LONGITUDE] floatValue]);
    
    [self.annotation setCoordinate: infiniteLoopCoordinate];
    [self.annotation setTitle: title];
    [self.mapView addAnnotation: self.annotation];
    self.mapView.region = MKCoordinateRegionMakeWithDistance(infiniteLoopCoordinate, 3000.0f, 3000.0f);
}

- (void)BBLocationManagerDidUpdateLocation:(NSDictionary *)latLongAltitudeDictionary {
//    [self.logText.text = latLongAltitudeDictionary.]
}

@end
