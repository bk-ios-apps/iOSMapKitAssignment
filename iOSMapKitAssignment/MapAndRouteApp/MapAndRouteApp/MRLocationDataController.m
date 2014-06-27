//
//  MRLocationDataController.m
//  MapAndRouteApp
//
//  Created by bipul on 5/22/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "MRLocationDataController.h"

@implementation MRLocationDataController

- (MRLocationData*)setAddress: (NSMutableArray*)locations
{
    MRLocationData *location = [[MRLocationData alloc] init];
    location.toStreet = [locations objectAtIndex:0];
    location.toCity = [locations objectAtIndex:1];
    location.toState = [locations objectAtIndex:2];
    location.toZip = [locations objectAtIndex:3];
    location.fromStreet = [locations objectAtIndex:4];
    location.fromCity = [locations objectAtIndex:5];
    location.fromState = [locations objectAtIndex:6];
    location.fromZip = [locations objectAtIndex:7];
    return location;
}

@end
