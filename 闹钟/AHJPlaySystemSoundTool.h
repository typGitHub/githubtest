//
//  AHJPlaySystemSoundTool.h
//  闹钟
//
//  Created by 老谭的Mac on 2017/2/12.
//  Copyright © 2017年 com.ahj.app. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface AHJPlaySystemSoundTool : NSObject
{
    SystemSoundID sound;//系统声音的id 取值范围为：1000-2000
}
//+ (instancetype)shareTool;

- (instancetype)initSystemShake;//系统 震动

- (void)systemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;

- (void)playSystemSoundWithId:(int)soundId;//播放

@end
