//
//  GridFlowLayout.m
//  PHFlowLayout
//
//  Created by Peng he on 2017/6/16.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "GridFlowLayout.h"

#define ScriWidth  [[UIScreen mainScreen] bounds].size.width
#define ScriHeight [[UIScreen mainScreen] bounds].size.height

@interface GridFlowLayout ()<UICollectionViewDelegateFlowLayout>

/**
 *  布局信息
 */
@property (nonatomic, strong) NSArray *layoutInfoArray;
/**
 *  内容尺寸
 */
@property (nonatomic, assign) CGSize contentSize;
@end

@implementation GridFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    //获取布局信息
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    for (NSInteger section = 0; section < numberOfSections; section++){
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:numberOfItems];
        for (NSInteger item = 0; item < numberOfItems; item++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [subArr addObject:attributes];
        }
        //添加到二维数组
        [layoutInfoArr addObject:[subArr copy]];
    }
    
    //存储布局信息
    self.layoutInfoArray = [layoutInfoArr copy];
    //保存内容尺寸
    self.contentSize = CGSizeMake(ScriWidth, ScriHeight);
}

- (CGSize)collectionViewContentSize
{
    return self.contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
    [self.layoutInfoArray enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger i, BOOL * _Nonnull stop) {
        [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(CGRectIntersectsRect(obj.frame, rect)) {
                [layoutAttributesArr addObject:obj];
            }
        }];
    }];
    return layoutAttributesArr;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 0) {
//        return CGSizeMake(80, 80);
//    } else {
//        return CGSizeMake(160, 160);
//    }
//}

@end
