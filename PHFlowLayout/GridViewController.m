//
//  GridViewController.m
//  PHFlowLayout
//
//  Created by Peng he on 2017/6/16.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "GridViewController.h"
#import "GridFlowLayout.h"
#import "GridCell.h"

@interface GridViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *listCollectionView;
@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GridFlowLayout *gridFlowLauout = [[GridFlowLayout alloc] init];
    _listCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:gridFlowLauout];
    _listCollectionView.dataSource = self;
    _listCollectionView.delegate = self;
    _listCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_listCollectionView];
    
    [_listCollectionView registerNib:[UINib nibWithNibName:@"GridCell" bundle:nil] forCellWithReuseIdentifier:[GridCell cellIdentifier]];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[GridCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}



@end
