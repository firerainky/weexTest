//
//  ViewController.m
//  weexTest
//
//  Created by zhengkanyan on 06/10/2017.
//  Copyright © 2017 zhengkanyan. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "TestViewController.h"
#import "ChatViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) UIButton *button2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(100.f);
    }];
}

- (void)jumpToChat {
    TestViewController *chatViewController = [[TestViewController alloc] init];
    [self presentViewController:chatViewController animated:YES completion:nil];  
}

- (void)jumpToChat2 {
    ChatViewController *chatViewController = [[ChatViewController alloc] init];
    [self presentViewController:chatViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"jump" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(jumpToChat) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button2 setTitle:@"jump2" forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(jumpToChat) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

@end
