//
//  MRRouteSrvViewController.h
//  MapAndRouteApp
//
//  Created by bipul on 5/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

#import "MRLocationData.h"

@interface MRRouteSrvViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet NSString *toStreet;
@property (strong, nonatomic) IBOutlet NSString *toCity;
@property (strong, nonatomic) IBOutlet NSString *toState;
@property (strong, nonatomic) IBOutlet NSString *toZip;
@property (strong, nonatomic) IBOutlet NSString *fromStreet;
@property (strong, nonatomic) IBOutlet NSString *fromCity;
@property (strong, nonatomic) IBOutlet NSString *fromState;
@property (strong, nonatomic) IBOutlet NSString *fromZip;
@property (strong, nonatomic) IBOutlet NSString *annotation;

@property (strong, retain) MRLocationData *locationData;
@property CLLocationCoordinate2D coords;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *zoomButton;

- (IBAction)drawRoute:(UIBarButtonItem *)sender;

- (IBAction)zoomIn:(UIBarButtonItem *)sender;

/*
@property (strong, retain) MRLocationData *locationData;
@property (nonatomic, strong) CLGeocoder *geocoder;
@property CLLocationCoordinate2D destinationCoords;
@property CLLocationCoordinate2D originCoords;
*/

@end
