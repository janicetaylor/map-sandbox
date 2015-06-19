//
//  ViewController.m
//  MapTutorial
//
//  Created by Janice Taylor on 6/18/15.
//  Copyright (c) 2015 Janice Taylor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define METERS_PER_MILE 1609.344

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;

- (IBAction)plotPoints:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    
    if(IS_OS_8_OR_LATER) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    self.mapView.showsUserLocation = YES;
    
    // set initial location in Honolulu
    CLLocationCoordinate2D initialLocation = CLLocationCoordinate2DMake(21.282778, -157.829444);
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(initialLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [self.mapView setRegion:viewRegion];
    
}


- (IBAction)plotPoints:(id)sender
{

}

@end