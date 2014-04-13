//
//  CCEvent.h
//  CollegeCal
//
//  Created by Varun Santhanam on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum {
    
    CCEventTypeStandard,
    CCEventExtraCurricular,
    CCEventSchool,
    CCEventTypeSocial
    
} CCEventType;

@interface CCEvent : NSObject <CLLocationManagerDelegate, NSCoding>

@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, strong) NSDate *eventStartDate;
@property (nonatomic, strong) NSDate *eventEndDate;
@property (nonatomic, strong) CLLocation *eventLocation;
@property (nonatomic, assign) CCEventType eventType;
@property (nonatomic, strong) NSArray *eventPeople;
@property (nonatomic, readonly, getter = isPassed) BOOL passed;
@property (nonatomic, assign, getter = isCompleted) BOOL completed;
@property (nonatomic, strong) UILocalNotification *eventReminder;
@property (nonatomic, assign) NSInteger index;

+ (CCEvent *)eventWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate useCurrentLocation:(BOOL)uselocation;

+ (void)saveEvent:(CCEvent *)event;
+ (NSMutableArray *)savedEvents;
+ (void)clearAllSavedEvents;

- (id)initWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate useCurrentLocation:(BOOL)uselocation;

@end
