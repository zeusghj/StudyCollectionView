//
//  GHJCollectionViewSquareLayout.m
//  StudyCollectionView
//
//  Created by 郭洪军 on 5/23/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "GHJCollectionViewSquareLayout.h"

@interface GHJCollectionViewSquareLayout ()

@property (strong, nonatomic)NSMutableArray* attrsArray;

@end

@implementation GHJCollectionViewSquareLayout


- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray new];
    }
    
    return _attrsArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.attrsArray removeAllObjects];
    
    NSInteger secCount = [self.collectionView numberOfSections];
    
    for (int j = 0; j < secCount; ++j) {
        
        NSInteger count = [self.collectionView numberOfItemsInSection:j];
        
        for (int i=0; i < count; ++i) {
            //创建UICollectionViewLayoutAttributes
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:j];
            UICollectionViewLayoutAttributes* attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            //设置布局属性
            CGFloat width = self.collectionView.frame.size.width * 0.5 ;
            if (i == 0) {
                CGFloat height = width;
                CGFloat x = 0;
                CGFloat y = 0 + width*1.5 * j;
                attrs.frame = CGRectMake(x, y, width, height);
            }else if (i == 1) {
                CGFloat height = width * 0.5;
                CGFloat x = width;
                CGFloat y = 0 + width*1.5 * j;
                attrs.frame = CGRectMake(x, y, width, height);
            } else if (i == 2) {
                CGFloat height = width * 0.5;
                CGFloat x = width;
                CGFloat y = height + width*1.5 * j;
                attrs.frame = CGRectMake(x, y, width, height);
            } else if (i == 3) {
                CGFloat height = width * 0.5;
                CGFloat x = 0;
                CGFloat y = width + width*1.5 * j;
                attrs.frame = CGRectMake(x, y, width, height);
            } else if (i == 4) {
                CGFloat height = width * 0.5;
                CGFloat x = width;
                CGFloat y = width + width*1.5 * j ;
                attrs.frame = CGRectMake(x, y, width, height);
            }
            //添加UICollectionViewLayoutAttributes
            [_attrsArray addObject:attrs];
        }
        
    }
    
}

/**
 *  显示范围内的属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return _attrsArray[indexPath.section][indexPath.item];
}

/**
 *  collectionview的内容大小
 */
- (CGSize)collectionViewContentSize
{
    NSInteger secCount = [self.collectionView numberOfSections];
    
    int rowH = self.collectionView.frame.size.width * 0.75;
    
//    int count = (int)[self.collectionView numberOfItemsInSection:0];
//    int rows = (count + 3 - 1) / 3;
//    CGFloat rowH = self.collectionView.frame.size.width * 0.5;
    return CGSizeMake(0, secCount * rowH);
}








































































@end
