//
//  MRRouteSrvViewController.m
//  MapAndRouteApp
//
//  Created by bipul on 5/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//  lv

#import "MRRouteSrvViewController.h"

@interface MRRouteSrvViewController ()

@end

@implementation MRRouteSrvViewController
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
  
    [self resetLocations];
    self.mapView.showsUserLocation = YES;
    CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(37.3333,-121.9000);
    MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
    MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
    
    CLLocationCoordinate2D _destCoord = CLLocationCoordinate2DMake(36.7500,-119.7667);
    MKPlacemark *_destMark = [[MKPlacemark alloc] initWithCoordinate:_destCoord addressDictionary:nil];
    MKMapItem *_destItem = [[MKMapItem alloc] initWithPlacemark:_destMark];
    [self findDirectionsFrom:_srcItem to:_destItem];


}

/*
- (void) drawMap
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@", toStreet,toCity,toState, toZip];
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
    
} */

- (void)findDirectionsFrom:(MKMapItem *)source
to:(MKMapItem *)destination
{
    //provide loading animation here
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = source;
    request.transportType = MKDirectionsTransportTypeAutomobile;
    request.destination = destination;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
   // __block typeof(self) weakSelf = self;
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         
         //stop loading animation here
         
         if (error) {
             NSLog(@"Error is %@",error);
         } else {
             //do something about the response, like draw it on map
             MKRoute *route = [response.routes firstObject];
             [self.mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
         }
     }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *route = overlay;
        MKPolylineRenderer *routeRenderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        routeRenderer.strokeColor = [UIColor blueColor];
        return routeRenderer;
    }
    else return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetLocations {
    fromStreet = _locationData.toStreet;
    fromCity = _locationData.toCity;
    fromState = _locationData.toState;
    fromZip = _locationData.toZip;
    annotation = @"Your destination point!";

    toStreet = _locationData.fromStreet;
    toCity = _locationData.fromCity;
    toState = _locationData.fromState;
    toZip = _locationData.fromZip;
    annotation = @"Your origin point!";
    //[self drawMap];
}

- (IBAction)drawRoute:(UIBarButtonItem *)sender
{
    CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(37.3333,-121.9000);
    MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
    MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
    
    CLLocationCoordinate2D _destCoord = CLLocationCoordinate2DMake(36.7500,-119.7667);
    MKPlacemark *_destMark = [[MKPlacemark alloc] initWithCoordinate:_destCoord addressDictionary:nil];
    MKMapItem *_destItem = [[MKMapItem alloc] initWithPlacemark:_destMark];
    [self findDirectionsFrom:_srcItem to:_destItem];
}

- (IBAction)zoomIn:(UIBarButtonItem *)sender
{
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20000, 20000);
    [self.mapView setRegion:region animated:NO];
}
@end
