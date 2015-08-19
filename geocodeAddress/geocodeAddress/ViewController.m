//
//  ViewController.m
//  geocodeAddress
//
//  Created by apple on 15/8/19.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "ViewController.h"
#import "DirectionRouteUtils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testGeocoding];
}

- (void)testGeocoding
{
    DirectionRouteUtils *utils = [DirectionRouteUtils sharedInstance];
    [utils geocodeAddressString:@"上海市唐镇地铁站" completionHandler:^(NSArray *placemarks, NSError *error) {
        for(CLPlacemark *mark in placemarks){
            NSLog(@"%@", mark.addressDictionary);
            NSLog(@"%.6f",mark.location.coordinate.latitude);
            NSLog(@"%.6f",mark.location.coordinate.longitude);
            
        }
    }];
    
}

- (void)testReverseGeocoding
{
    DirectionRouteUtils *utils = [DirectionRouteUtils sharedInstance];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:24.6182746 longitude:118.131588];
    
    [utils reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for(CLPlacemark *mark in placemarks){
            NSLog(@"%@", mark.addressDictionary);
            NSLog(@"%@", mark);
        }
        
    }];
    
}


- (void)testDirections
{
    
    CLLocationCoordinate2D fromCoordinate = CLLocationCoordinate2DMake(24.6382086,
                                                                       118.131588);
    CLLocationCoordinate2D toCoordinate   = CLLocationCoordinate2DMake(24.6182746,
                                                                       118.131588);
    
    MKPlacemark *fromPlacemark = [[MKPlacemark alloc] initWithCoordinate:fromCoordinate
                                                       addressDictionary:nil];
    
    MKPlacemark *toPlacemark   = [[MKPlacemark alloc] initWithCoordinate:toCoordinate
                                                       addressDictionary:nil];
    
    MKMapItem *fromItem = [[MKMapItem alloc] initWithPlacemark:fromPlacemark];
    MKMapItem *toItem   = [[MKMapItem alloc] initWithPlacemark:toPlacemark];
    
    DirectionRouteUtils *utils = [DirectionRouteUtils sharedInstance];
    [utils findDirectionsFrom:fromItem to:toItem handler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            
            NSLog(@"error:%@", error);
        }
        else {
            NSLog(@"%@", response.routes);
            MKRoute *route = response.routes[0];
            
            for(MKRoute *step in route.steps)
            {
                NSLog(@"Step: %@", ((MKRouteStep *)step).instructions);
            }
            
            
            
        }
        
    }];
}
@end
