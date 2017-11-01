//
//  NSDate+HLHExtend.h
//  HLHKitDemo
//
//  Created by lihuiHan on 16/9/28.
//  Copyright © 2016年 Lottery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HLHExtend)

@property (nonatomic, readonly) NSInteger year;             ///< Year component
@property (nonatomic, readonly) NSInteger month;            ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day;              ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour;             ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute;           ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second;           ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger nanosecond;       ///< Nanosecond component
@property (nonatomic, readonly) NSInteger weekday;          ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger weekdayOrdinal;   ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger weekOfMonth;      ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear;       ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) BOOL isLeapMonth;            ///< Weather the month is leap month
@property (nonatomic, readonly) NSInteger quarter;           ///< Quarter component
@property (nonatomic, readonly) BOOL isLeapYear;             ///< Weather the year is leap year
@property (nonatomic, readonly) BOOL isToday;                ///< Weather date is today (based on current locale)
@property (nonatomic, readonly) BOOL isYesterday;            ///< Weather date is yesterday (based on current locale)

/**
 * 返回years年后的日期
 */
- (NSDate *)dateByAddingYears:(NSInteger)years;

/**
 * 返回months月后的日期
 */
- (NSDate *)dateByAddingMonths:(NSInteger)months;

/**
 * 返回weeks周后的日期
 */
- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/**
 * 返回days天后的日期
 */
- (NSDate *)dateByAddingDays:(NSInteger)days;

/**
 * 返回hours时后的日期
 */
- (NSDate *)dateByAddingHours:(NSInteger)hours;

/**
 * 返回minutes分后的日期
 */
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/**
 * 返回seconds秒后的日期
 */
- (NSDate *)dateByAddingSeconds:(NSInteger)seconds;

/**
 Returns a formatted string representing this date.
 @param format   String representing the desired date format.
 e.g. @"yyyy-MM-dd HH:mm:ss"
 
 @return NSString representing the formatted date string.
 */
- (NSString *)stringWithFormat:(NSString *)format;

/**
 Returns a date parsed from given string interpreted using the format.
 
 @param dateString The string to parse.
 @param format     The string's date format.
 
 @return A date representation of string interpreted using the format.
 If can not parse the string, returns nil.
 */
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

@end
