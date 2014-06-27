//
//  MRMainViewController.h
//  MapAndRouteApp
//
//  Created by bipul on 5/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRMapSrvViewController.h"
#import "MRRouteSrvViewController.h"
#import "MRLocationDataController.h"
#import "MRLocationDataController.h"
#import "MRLocationData.h"

@interface MRMainViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *fromStreet;
@property (nonatomic, retain) IBOutlet UITextField *fromCity;
@property (nonatomic, retain) IBOutlet UITextField *fromState;
@property (nonatomic, retain) IBOutlet UITextField *fromZip;
@property (nonatomic, retain) IBOutlet UITextField *toStreet;
@property (nonatomic, retain) IBOutlet UITextField *toCity;
@property (nonatomic, retain) IBOutlet UITextField *toState;
@property (nonatomic, retain) IBOutlet UITextField *toZip;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *mapButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *routeButton;

@property (nonatomic, assign) MRLocationData *locationData;


- (IBAction)backgroundTouchedHideKeyboard:(UIBarButtonItem *)sender;


@end
