//
//  NSTimer+DVDTimerBlock.m
//  DaVDian_business
//
//  Created by zhangyongfeng on 2016/11/23.
//  Copyright © 2016年 BraveTime. All rights reserved.
//

#import "NSTimer+DVDTimerBlock.h"

@implementation NSTimer (DVDTimerBlock)

+ (NSTimer *)dvd_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats{
    
    return [self scheduledTimerWithTimeInterval:ti
                                         target:self
                                       selector:@selector(dvd_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)dvd_blockInvoke:(NSTimer *)timer{
    
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

- (void)pauseTimer
{
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer
{
    if(![self isValid]){
        return;
    }
    [self setFireDate:[NSDate date]];
}

+ (BOOL)overTimeInterval:(NSTimeInterval)timeInterval inArea:(NSTimeInterval)area
{
    NSTimeInterval nowTimeInterVal = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval gapTimeInterVal = nowTimeInterVal - timeInterval;
    if (gapTimeInterVal > area) {
        return NO;
    }else{
        
        return YES;
    }
}

@end
