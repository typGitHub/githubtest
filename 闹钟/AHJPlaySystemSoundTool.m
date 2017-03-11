//
//  AHJPlaySystemSoundTool.m
//  闹钟
//
//  Created by 老谭的Mac on 2017/2/12.
//  Copyright © 2017年 com.ahj.app. All rights reserved.
//

#import "AHJPlaySystemSoundTool.h"

@implementation AHJPlaySystemSoundTool

//static AHJPlaySystemSoundTool *tool = nil;
//+ (instancetype)shareTool
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        tool = [[AHJPlaySystemSoundTool alloc] init];
//    });
//    return tool;
//}

- (instancetype)initSystemShake
{
    self = [super init];
    if (self) {
        sound = kSystemSoundID_Vibrate;//震动
    }
    return self;
}

- (void)systemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
{
    NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",soundName,soundType];
    //[[NSBundle bundleWithIdentifier:@"com.apple.UIKit" ]pathForResource:soundName ofType:soundType];//得到苹果框架资源UIKit.framework ，从中取出所要播放的系统声音的路径
    //[[NSBundle mainBundle] URLForResource: @"tap" withExtension: @"aif"];  获取自定义的声音
    if (path) {
        OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&sound);
        
        if (error != kAudioServicesNoError) {//获取的声音的时候，出现错误
            sound = 0;
        }
    }
    NSLog(@"sss");
}

//- (instancetype)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
//{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}

- (void)playSystemSoundWithId:(int)soundId
{
    SystemSoundID id = soundId;
    AudioServicesPlaySystemSound(id);
}

@end


































