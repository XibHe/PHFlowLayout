//
//  MainViewController.m
//  PHFlowLayout
//
//  Created by Peng he on 2017/6/13.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "MainViewController.h"
static NSString *cellIndentify = @"inforCell";

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *inforTableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"flowLayout";
    self.view.backgroundColor = [UIColor whiteColor];

    [self initSubViews];
}

- (void)initSubViews
{
    _inforTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _inforTableView.delegate = self;
    _inforTableView.dataSource = self;
    [self.view addSubview:_inforTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify];
    }
    cell.textLabel.text = @"custom flowLayout";
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
