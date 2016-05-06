//
//  ViewController.m
//  WindowsProgress
//
//  Created by ZhengWei on 16/5/6.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "ViewController.h"
#import "WindowsProgress.h"
@interface ViewController ()
{
    WindowsProgress *progress;
    NSInteger value;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    progress = [[WindowsProgress alloc] initWithFrame:CGRectMake(0, 0, 400, 40)];
    [self.view addSubview:progress];
    progress.center = self.view.center;

    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)change
{
    value = value + 1;
    if (value > 100) {
        value = 0;
    }
    progress.currentValue = value;
}
@end
