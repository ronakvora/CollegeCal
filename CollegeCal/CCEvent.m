//
//  CCEvent.m
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEvent.h"

@interface CCEvent ()

@property (nonatomic, strong, readonly) CLLocationManager *locationManager;

@end

@implementation CCEvent {
    
    UIAlertView *_locationAlert;
    
}

@synthesize eventStartDate = _eventStartDate;
@synthesize eventEndDate = _eventEndDate;
@synthesize eventLocation = _eventLocation;
@synthesize eventPeople = _eventPeople;
@synthesize completed = _completed;
@synthesize eventReminder = _eventReminder;
@synthesize locationManager = _locationManager;

#pragma Public Class Methods

+ (CCEvent *)eventWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate useCurrentLocation:(BOOL)uselocation {
    
    return [[CCEvent alloc] initWithStartDate:startDate andEndDate:endDate useCurrentLocation:uselocation];
    
}

#pragma mark - Property Access Methods

- (BOOL)isPassed {

    if ([self.eventEndDate timeIntervalSinceNow] <= 0) {
        
        return YES;
        
    }
    
    return NO;
    
}

- (CLLocationManager *)locationManager {
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        if (!self->_locationManager) {
            
            self->_locationManager = [[CLLocationManager alloc] init];
            self->_locationManager.delegate = self;
            
        }
        
        return self->_locationManager;
        
    }
    
    return nil;
    
}

#pragma mark - CLLocationManagerDelegate Instance Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *theLocation = [locations lastObject];
    NSTimeInterval interval = [theLocation.timestamp timeIntervalSinceNow];
    if (abs(interval) < 5) {
        
        self.eventLocation = theLocation;
        [manager stopUpdatingLocation];
        self->_locationManager = nil;
        
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
   
    
    if (error != NULL) {
        
        self->_locationAlert = [[UIAlertView alloc] initWithTitle:@"Location Error"
                                                          message:[NSString stringWithFormat:@"Failed to get location with error: %@", error]
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [self->_locationAlert show];
        
    }
    
}

#pragma mark - Private Instance Methods

- (void)getCurrentLocation {
    
    if (self.locationManager) {
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
        
    }
    
}

#pragma mark - Public Instance Methods

- (id)initWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate useCurrentLocation:(BOOL)uselocation {
    
    self = [super init];
    if (self) {
        
        self.eventStartDate = startDate;
        self.eventEndDate = endDate;
        if (uselocation) {
            
            [self getCurrentLocation];
            
        }
        
    }
    
    return self;
    
}

@end
