//
//  MRMapSrvViewController.m
//  MapAndRouteApp
//
//  Created by bipul on 5/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "MRMapSrvViewController.h"

@interface MRMapSrvViewController ()

@end

@implementation MRMapSrvViewController
@synthesize mapView;
@synthesize locationData = _locationData;
@synthesize toStreet, toCity, toState, toZip;
@synthesize fromStreet, fromCity,fromState, fromZip, annotation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    NSLog(@" Destination street name: %@", _locationData.toStreet);
    NSLog(@" Destination city name: %@", _locationData.toCity);
    NSLog(@" Destination State name: %@", _locationData.toState);
    NSLog(@" Destination zip code: %@", _locationData.toZip); 
     */
    
    _street = _locationData.toStreet;
    _city = _locationData.toCity;
    _state = _locationData.toState;
    _zip = _locationData.toZip;
    annotation = @"Your destination point!";
    [self drawMap];
}

- (void) drawMap
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@", _street,_city,_state, _zip];
    [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if(error)
         {
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         if(placemarks && placemarks.count > 0)
         {
             CLPlacemark *placemark = placemarks[0];
             CLLocation *location = placemark.location;
             _coords = location.coordinate;
             //MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
             MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_coords, 1600, 1600);
             [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
             //Add an annotation
             MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
             [point setCoordinate:_coords];
             [point setTitle:annotation];
             [self.mapView addAnnotation:point];
             //[self mapView];
         }
         
     }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showOriginLocation:(UIButton *)sender {
    _street = _locationData.toStreet;
    _city = _locationData.toCity;
    _state = _locationData.toState;
    _zip = _locationData.toZip;
    annotation = @"Your destination point!";
    [self drawMap];
}

- (IBAction)showDestinationLocation:(UIButton *)sender {
    _street = _locationData.fromStreet;
    _city = _locationData.fromCity;
    _state = _locationData.fromState;
    _zip = _locationData.fromZip;
    annotation = @"Your origin point!";
    [self drawMap];
}
@end
