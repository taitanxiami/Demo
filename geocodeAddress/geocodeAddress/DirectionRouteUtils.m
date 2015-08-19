//
//  DirectionRouteUtils.m
//  gcoder
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import "DirectionRouteUtils.h"

@implementation DirectionRouteUtils
+ (instancetype)sharedInstance
{
    static DirectionRouteUtils *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    if (self = [super init]) {
        mGeocoder = [[CLGeocoder alloc] init];
    }
    return self;
}


- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
             transportType:(MKDirectionsTransportType)transportType
                   handler:(MKDirectionsHandler)completionHandler
{
    NSAssert(completionHandler != nil, @"Calculating directions handler shouldn't be nil!");
    
    [self cancelCalculateDirections];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = source;
    request.destination = destination;
    request.requestsAlternateRoutes = YES;
    request.transportType = transportType; //MKDirectionsTransportTypeAutomobile;//MKDirectionsTransportTypeWalking;
    
    mDirections = [[MKDirections alloc] initWithRequest:request];

    
    /*
     [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
     
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
     
     
     [self.mapView addOverlay:route.polyline];
     }
     }];
     */
    
    
    if(completionHandler){
        [mDirections calculateDirectionsWithCompletionHandler:completionHandler];
    }
    
}



- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
                   handler:(MKDirectionsHandler)completionHandler
{
    [self findDirectionsFrom:source
                          to:destination
               transportType:MKDirectionsTransportTypeAutomobile
                     handler:completionHandler];
}


- (void)cancelCalculateDirections
{
    if(mDirections){
        [mDirections cancel];

        mDirections = nil;
    }
}

- (void)cancelGeocode
{
    [mGeocoder cancelGeocode];
}


- (void)geocodeAddressString:(NSString *)addressString
           completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
    NSAssert(completionHandler != nil, @"Geocoding handler shouldn't be nil!");
    
    [self cancelGeocode];
    [mGeocoder geocodeAddressString:addressString
                  completionHandler:completionHandler];
}

- (void)reverseGeocodeLocation:(CLLocation *)location
             completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
    NSAssert(completionHandler != nil, @"Reversegeocoding handler shouldn't be nil!");
    
    [self cancelGeocode];
    [mGeocoder reverseGeocodeLocation:location
                    completionHandler:completionHandler];
    
}
@end
