//
//  MRMainViewController.m
//  MapAndRouteApp
//
//  Created by bipul on 5/21/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "MRMainViewController.h"

@interface MRMainViewController ()

@end

@implementation MRMainViewController
@synthesize fromStreet, fromCity,fromState, fromZip, toStreet, toCity, toState, toZip;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSMutableArray *addresses = [[NSMutableArray alloc] init];
    [addresses addObject:self.toStreet.text];
    [addresses addObject:self.toCity.text];
    [addresses addObject:self.toState.text];
    [addresses addObject:self.toZip.text];
    [addresses addObject:self.fromStreet.text];
    [addresses addObject:self.fromCity.text];
    [addresses addObject:self.fromState.text];
    [addresses addObject:self.fromZip.text];
    MRLocationDataController *data = [[MRLocationDataController alloc] init];
    _locationData = [data setAddress:addresses];
    NSLog(@" test data %@", _locationData.toCity);
    
    if([segue.identifier isEqualToString:@"pushToMap"])
    {
        MRMapSrvViewController *mvc = segue.destinationViewController;
        mvc.locationData = _locationData;
    }
    if([segue.identifier isEqualToString:@"pushToRoute"])
    {
        MRRouteSrvViewController *rvc = segue.destinationViewController;
        rvc.locationData = _locationData;
    }
}

-(void)backgroundTouchedHideKeyboard:(id)sender
{
    [fromStreet resignFirstResponder];
    [fromCity resignFirstResponder];
    [fromState resignFirstResponder];
    [fromZip resignFirstResponder];
    [toStreet resignFirstResponder];
    [toCity resignFirstResponder];
    [toState resignFirstResponder];
    [toZip resignFirstResponder];
    
}

@end
