//
//  ViewController.m
//  xklProgress
//
//  Created by iOS Tedu on 16/8/23.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "ViewController.h"
#import "xklProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) xklProgressView *myProgressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _myProgressView = [[xklProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _myProgressView.percent = 0;
    [self.view addSubview:_myProgressView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changePercent:(UISlider *)sender {
    _myProgressView.percent = sender.value;
}

@end
