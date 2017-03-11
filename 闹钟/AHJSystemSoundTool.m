//
//  AHJSystemSoundTool.m
//  闹钟
//
//  Created by 老谭的Mac on 2017/2/12.
//  Copyright © 2017年 com.ahj.app. All rights reserved.
//

#import "AHJSystemSoundTool.h"
#import <AudioToolbox/AudioToolbox.h>

static NSMutableArray *_systemSounds = nil;

@implementation AHJSystemSoundTool

+ (void)accessSystemSoundsList {
    
//    NSMutableArray *audioFileList = [NSMutableArray array];
    _systemSounds                 = [NSMutableArray array];
    
    // 读取文件系统
//    NSFileManager *fileManager  = [[NSFileManager alloc] init];
//    NSURL         *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds"];
//    NSArray       *keys         = [NSArray arrayWithObject:NSURLIsDirectoryKey];
//    
//    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtURL:directoryURL
//                                          includingPropertiesForKeys:keys
//                                                             options:0
//                                                        errorHandler:^(NSURL *url, NSError *error) {
//                                                            return YES;
//                                                        }];
//    
//    for (NSURL *url in enumerator) {
//        
//        NSError  *error;
//        NSNumber *isDirectory = nil;
//        if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
//            
//        } else if (![isDirectory boolValue]) {
//            
//            [audioFileList addObject:url];
//            
//            SystemSoundID soundID;
//            AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)url, &soundID);
//            
//            AHJSoundInfomation *sound = [[AHJSoundInfomation alloc] init];
//            sound.soundID   = soundID;
//            sound.soundUrl  = url;
//            sound.soundName = url.lastPathComponent;
//            
//            [_systemSounds addObject:sound];
//        }
//    }
    
    // 读取文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sound" ofType:@"plist"];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSArray *soundArr = [[dic allKeys] sortedArrayUsingSelector: @selector(compare:)];

    for (NSString *key in soundArr) {
        NSString *valueStr = [dic objectForKey:key];
        NSArray *soundInfo = [valueStr componentsSeparatedByString:@"\t"];
        NSArray *soundInfo1 = [soundInfo[0] componentsSeparatedByString:@" "];
        NSArray *nameArr = [soundInfo1[1] componentsSeparatedByString:@"."];
        AHJSoundInfomation *sound = [[AHJSoundInfomation alloc] init];
        sound.soundID = (unsigned int)[key integerValue];
        sound.soundName = nameArr.firstObject;
        [_systemSounds addObject:sound];
    }

}

+ (NSArray *)systemSounds {
    
    return _systemSounds;
}

+ (void)playWithSound:(AHJSoundInfomation *)sound {
    
    AudioServicesPlaySystemSound(sound.soundID);
}

+ (void)playWithSoundID:(UInt32)soundID {
    
    AudioServicesPlaySystemSound(soundID);
}
@end
