//
//  MRLocationData.h
//  MapAndRouteApp
//
//  Created by bipul on 5/22/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRLocationData : NSObject

@property (strong, nonatomic) NSString *toStreet;
@property (strong, nonatomic) NSString *toCity;
@property (strong, nonatomic) NSString *toState;
@property (strong, nonatomic) NSString *toZip;

@property (strong, nonatomic) NSString *fromStreet;
@property (strong, nonatomic) NSString *fromCity;
@property (strong, nonatomic) NSString *fromState;
@property (strong, nonatomic) NSString *fromZip;

@end
