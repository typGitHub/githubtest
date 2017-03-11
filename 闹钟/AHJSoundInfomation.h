//
//  AHJSoundInfomation.h
//  闹钟
//
//  Created by 老谭的Mac on 2017/2/12.
//  Copyright © 2017年 com.ahj.app. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHJSoundInfomation : NSObject
/**
 *  系统声音编号(必须有)
 */
@property (nonatomic)         UInt32    soundID;

/**
 *  系统声音地址
 */
@property (nonatomic, strong) NSURL    *soundUrl;

/**
 *  声音的名字
 */
@property (nonatomic, strong) NSString *soundName;

@end
