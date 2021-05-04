//
//  ZZCollectionViewFlowLayout.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import "ZZCollectionViewFlowLayout.h"

@implementation ZZCollectionViewFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 20;
        self.minimumLineSpacing = 20;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.itemSize = CGSizeMake(50, 50);
        self.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
    }
    return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *newArray = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attrs in array) {
        UICollectionViewLayoutAttributes *newAttrs = [attrs copy];
        if (attrs.representedElementKind == nil) {
            newAttrs.transform = CGAffineTransformMakeRotation(45);
        }
        [newArray addObject:newAttrs];
    }
    
    return array;
}

@end
