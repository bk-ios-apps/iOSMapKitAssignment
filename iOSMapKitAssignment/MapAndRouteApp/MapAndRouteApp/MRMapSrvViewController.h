//
//  MRMapSrvViewController.h
//  MapAndRouteApp
//
//  Created by bipul on 5/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "MRLocationData.h"

@interface MRMapSrvViewController : UIViewController <MKMapViewDelegate>

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

@property (strong, nonatomic) IBOutlet NSString *street;
@property (strong, nonatomic) IBOutlet NSString *city;
@property (strong, nonatomic) IBOutlet NSString *state;
@property (strong, nonatomic) IBOutlet NSString *zip;

@property (strong, nonatomic) IBOutlet UIButton *toButton;
@property (strong, nonatomic) IBOutlet UIButton *fromButton;
- (IBAction)showOriginLocation:(UIButton *)sender;
- (IBAction)showDestinationLocation:(UIButton *)sender;

@property (strong, retain) MRLocationData *locationData;

@property CLLocationCoordinate2D coords;

@end
