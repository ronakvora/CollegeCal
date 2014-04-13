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
@synthesize index = _index;

#pragma Public Class Methods

+ (CCEvent *)eventWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate useCurrentLocation:(BOOL)uselocation {
    
    return [[CCEvent alloc] initWithStartDate:startDate andEndDate:endDate useCurrentLocation:uselocation];
    
}

+ (void)saveEvent:(CCEvent *)event {
    
    if (![CCEvent savedEvents]) {
        
        NSData *eventData = [NSKeyedArchiver archivedDataWithRootObject:event];
        NSMutableArray *newArray = [NSMutableArray arrayWithObject:eventData];
        [[NSUserDefaults standardUserDefaults] setObject:newArray forKey:@"EventsKey"];
        
        
    } else {
        
        NSData *eventData = [NSKeyedArchiver archivedDataWithRootObject:event];
        NSMutableArray *newArray = [NSMutableArray arrayWithObject:eventData];
        [newArray addObjectsFromArray:[CCEvent savedEvents]];
        [[NSUserDefaults standardUserDefaults] setObject:newArray forKey:@"EventsKey"];
        
    }
    
}

+ (NSMutableArray *)savedEvents {
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"EventsKey"]) {
        
        return (NSMutableArray *)[[NSUserDefaults standardUserDefaults] objectForKey:@"EventsKey"];
        
    }
    
    return nil;
    
}

+ (void)clearAllSavedEvents {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"EventsKey"];
    
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

#pragma mark - NSCoding Protocol Instance Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        
        self.eventName = [aDecoder decodeObjectForKey:@"eventName"];
        self.eventStartDate = [aDecoder decodeObjectForKey:@"eventStartDate"];
        self.eventEndDate = [aDecoder decodeObjectForKey:@"eventEndDate"];
        self.eventType = (CCEventType)[aDecoder decodeIntegerForKey:@"eventType"];
        self.colorOption = (CCTagColorOption)[aDecoder decodeObjectForKey:@"colorOption"];
        self.completed = [aDecoder decodeBoolForKey:@"completed"];
        if ([aDecoder containsValueForKey:@"eventLocation"]) {
            
            self.eventLocation = [aDecoder decodeObjectForKey:@"eventLocation"];
            
        }
        if ([aDecoder containsValueForKey:@"eventPeople"]) {
            
            self.eventPeople = [aDecoder decodeObjectForKey:@"eventPeople"];
            
        }
        if ([aDecoder containsValueForKey:@"eventReminder"]) {
            
            self.eventReminder = [aDecoder decodeObjectForKey:@"eventReminder"];
            
        }
        
    }
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.eventName forKey:@"eventName"];
    [aCoder encodeObject:self.eventStartDate forKey:@"eventStartDate"];
    [aCoder encodeObject:self.eventEndDate forKey:@"eventEndDate"];
    [aCoder encodeObject:self.eventLocation forKey:@"eventLocation"];
    [aCoder encodeInteger:self.eventType forKey:@"eventType"];
    [aCoder encodeBool:self.completed forKey:@"completed"];
    [aCoder encodeObject:self.eventReminder forKey:@"eventReminder"];
    [aCoder encodeInteger:self.colorOption forKey:@"colorOption"];
    
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
        self.eventType = CCEventTypeStandard;
        self.colorOption = CCTagColorOptionRed;
        self.completed = NO;
        if (uselocation) {
            
            [self getCurrentLocation];
            
        }
        
    }
    
    return self;
    
}

@end
