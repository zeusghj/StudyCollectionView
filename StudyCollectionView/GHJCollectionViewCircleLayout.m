//
//  GHJCollectionViewCircleLayout.m
//  StudyCollectionView
//
//  Created by 郭洪军 on 5/23/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "GHJCollectionViewCircleLayout.h"

@interface GHJCollectionViewCircleLayout ()

@property (strong, nonatomic)NSMutableArray* attrsArray;

@end

@implementation GHJCollectionViewCircleLayout

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
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; ++i) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes* attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 *  这个方法需要返回indexPath位置对应的cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat radius = 120;
    //圆心的位置
    CGFloat oX = self.collectionView.frame.size.width * 0.5;
    CGFloat oY = self.collectionView.frame.size.height * 0.5;
    
    UICollectionViewLayoutAttributes* attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = CGSizeMake(50, 50);
    if (count == 1) {
        attrs.center = CGPointMake(oX, oY);
    }else
    {
        CGFloat angle = (2 * M_PI / count) * indexPath.item;
        CGFloat centerX = oX + radius * sin(angle);
        CGFloat centerY = oY + radius * cos(angle);
        attrs.center = CGPointMake(centerX, centerY);
    }
    
    return attrs;
}







































































@end
