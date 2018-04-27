//
//  NSTimer+DVDTimerBlock.h
//  DaVDian_business
//
//  Created by zhangyongfeng on 2016/11/23.
//  Copyright © 2016年 BraveTime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (DVDTimerBlock)

+ (NSTimer *)dvd_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;

- (void)pauseTimer;

- (void)resumeTimer;

/**
 当前系统时间戳是否超出给定时间戳在area的范围内
 */
+ (BOOL)overTimeInterval:(NSTimeInterval)timeInterval inArea:(NSTimeInterval)area;

@end
