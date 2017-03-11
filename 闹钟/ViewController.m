//
//  ViewController.m
//  闹钟
//
//  Created by 老谭的Mac on 2017/2/9.
//  Copyright © 2017年 com.ahj.app. All rights reserved.
//

#import "ViewController.h"
#import "AHJPlaySystemSoundTool.h"
#import "AHJSystemSoundTool.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_dataArr;
    NSDictionary *_soundNamDic;
}
@property (nonatomic, strong) AHJPlaySystemSoundTool *tool;
@end

@implementation ViewController

- (AHJPlaySystemSoundTool *)tool
{
    if (!_tool) {
        _tool = [[AHJPlaySystemSoundTool alloc] init];
    }
    return _tool;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [AHJSystemSoundTool accessSystemSoundsList];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"sound"
//                                                     ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc]
//                          initWithContentsOfFile:path];
    
//    _soundNamDic = dict;
    
//    _dataArr = [[dict allKeys] sortedArrayUsingSelector:
//     @selector(compare:)];
    
//    _tool = [[AHJPlaySystemSoundTool alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [AHJSystemSoundTool systemSounds].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *CellIdentifier = @"Cell";
    
//    NSString *key = [_dataArr objectAtIndex:indexPath.row];
//    NSString *soundName = [_soundNamDic objectForKey:key];
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
     }
     cell.textLabel.text = [[AHJSystemSoundTool systemSounds][indexPath.row] soundName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *key = [_dataArr objectAtIndex:indexPath.row];
//    [self.tool playSystemSoundWithId:[key intValue]];
    
    [AHJSystemSoundTool playWithSoundID: [[AHJSystemSoundTool systemSounds][indexPath.row] soundID]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end




































