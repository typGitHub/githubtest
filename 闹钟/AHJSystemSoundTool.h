//
//  AHJSystemSoundTool.h
//  闹钟
//
//  Created by 老谭的Mac on 2017/2/12.
//  Copyright © 2017年 com.ahj.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AHJSoundInfomation.h"

@interface AHJSystemSoundTool : NSObject
/**
 *  获取系统消息列表
 */
+ (void)accessSystemSoundsList;

/**
 *  系统声音的列表
 *
 *  @return SoundInfomation对象数组
 */
+ (NSArray *)systemSounds;

/**
 *  播放声音
 *
 *  @param sound 声音
 */
+ (void)playWithSound:(AHJSoundInfomation *)sound;

/**
 *  根据声音ID号播放声音
 *
 *  @param soundID 声音ID号码
 */
+ (void)playWithSoundID:(UInt32)soundID;
@end
