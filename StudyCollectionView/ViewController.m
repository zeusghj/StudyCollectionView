//
//  ViewController.m
//  StudyCollectionView
//
//  Created by 郭洪军 on 5/20/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "ViewController.h"
#import "GHJCollectionViewFlowLayout.h"
#import "GHJCollectionViewSquareLayout.h"
#import "GHJCollectionViewCircleLayout.h"
#import "CustomCell.h"

@interface ViewController ()

@end

@implementation ViewController

//1.设置流水布局
//2.UICollectionViewCell只能注册

static NSString* ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    /*
    self.collectionView.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
    //流水布局
    GHJCollectionViewFlowLayout* layout = [[GHJCollectionViewFlowLayout alloc]init];
    
    //设置cell的尺寸
    layout.itemSize = CGSizeMake(150, 100);
    
    //设置每一行的间距
    layout.minimumLineSpacing = 40;
    
    //设置每个cell的间距
    layout.minimumInteritemSpacing = 20;
    
    //设置每组的内边距
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.collectionView.collectionViewLayout = layout;
    */
    
    /*
    //方形布局
    GHJCollectionViewSquareLayout* layout = [[GHJCollectionViewSquareLayout alloc]init];
    
    self.collectionView.collectionViewLayout = layout;
     */
    
    //圆形布局
    GHJCollectionViewCircleLayout* layout = [[GHJCollectionViewCircleLayout alloc]init];
    
    self.collectionView.collectionViewLayout = layout;
    //注册cell
    
    // Register nib file for the cell
    UINib *nib = [UINib nibWithNibName:@"CustomCell"
                                bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    
}

#pragma mark - UICollectionView 数据源

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select item = %ld", (long)indexPath.item);
}










































@end
