//
//  DirectionRouteUtils.h
//  gcoder
//
//  Created by apple on 15/8/18.
//  Copyright (c) 2015年 jimsay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface DirectionRouteUtils : NSObject
{
    MKDirections *mDirections;
    CLGeocoder   *mGeocoder;
}

+ (instancetype)sharedInstance;

// 获取导航路线
- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
                   handler:(MKDirectionsHandler)completionHandler;

- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
             transportType:(MKDirectionsTransportType)transportType
                   handler:(MKDirectionsHandler)completionHandler;

- (void)cancelCalculateDirections;

// 地理转码

- (void)cancelGeocode;
- (void)geocodeAddressString:(NSString *)addressString
           completionHandler:(CLGeocodeCompletionHandler)completionHandler;

- (void)reverseGeocodeLocation:(CLLocation *)location
             completionHandler:(CLGeocodeCompletionHandler)completionHandler;
@end
