//
//  ChatViewController.m
//  weexTest
//
//  Created by zhengkanyan on 08/10/2017.
//  Copyright © 2017 zhengkanyan. All rights reserved.
//

#import "ChatViewController.h"
#import "MsgModel.h"
#import <Masonry/Masonry.h>
#import "MsgViewCell.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSArray *msgList;
@property(nonatomic, strong) UITableView *msgTableView;
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.msgTableView];
    [self.msgTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.mas_equalTo(20.f);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDelegate


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.msgList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MsgViewCell *msgViewCell = 
}


#pragma mark -- Getter
- (UITableView *)msgTableView {
    if (_msgTableView) {
        _msgTableView = [[UITableView alloc] init];
        _msgTableView.delegate = self;
        _msgTableView.dataSource = self;
    }
    return _msgTableView;
}
- (NSArray *)msgList {
    if (!_msgList) {
        MsgModel *model1 = [MsgModel new];
        model1.url = [[NSBundle mainBundle] URLForResource:@"hello" withExtension:@"js"];
//        MsgModel *model1 = [MsgModel new];
//        MsgModel *model1 = [MsgModel new];
        _msgList = @[model1];
    }
    return _msgList;
}

@end
