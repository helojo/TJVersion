//
//  ViewController.m
//  TJVersion
//
//  Created by 谭杰 on 2016/12/14.
//  Copyright © 2016年 谭杰. All rights reserved.
//

#import "ViewController.h"
#import "TJVersion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"版本检测";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center = self.view.center;
    [btn setTitle:@"版本检测" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:20.f];
    [btn setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.8]];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)check:(UIButton *)sender {
    
    //1.新版本检测(使用默认提示框)
//    [TJVersion checkNewVersion];
    
     //2.如果你需要自定义提示框,请使用下面方法
    [TJVersion checkNewVersionAndCustomAlert:^(TJAppInfo *appInfo) {
        
        //appInfo为新版本在AppStore相关信息
        //请在此处自定义您的提示框
        NSLog(@"新版本信息:\n 版本号 = %@ \n 更新时间 = %@\n 更新日志 = %@ \n 在AppStore中链接 = %@\n AppId = %@ \n bundleId = %@" ,appInfo.version,appInfo.currentVersionReleaseDate,appInfo.releaseNotes,appInfo.trackViewUrl,appInfo.trackId,appInfo.bundleId);
        //应用内打开appStore
        [TJVersion openInStoreProductViewControllerForAppId:appInfo.trackId];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
