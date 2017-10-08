//
//  ChatViewController.m
//  weexTest
//
//  Created by zhengkanyan on 06/10/2017.
//  Copyright © 2017 zhengkanyan. All rights reserved.
//

#import "TestViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface TestViewController ()

@property(nonatomic, strong) WXSDKInstance *instance;
@property(nonatomic, weak) UIView *weexView;
@property(nonatomic, copy) NSURL *url;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _url = [[NSBundle mainBundle] URLForResource:@"hello" withExtension:@"js"];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame;
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    _instance.onFailed = ^(NSError *error) {
        //process failure
        NSLog(@"处理失败:%@",error);
    };
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
        NSLog(@"渲染完成");
    };
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"js"];
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_instance destroyInstance];
}

//- (UIView *)weexView {
//    if (!_weexView) {
//        _weexView = [[UIView alloc] init];
//        _weexView.frame = self.view.frame;
//    }
//    return _weexView;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
