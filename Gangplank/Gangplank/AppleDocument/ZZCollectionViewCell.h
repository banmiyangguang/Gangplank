//
//  ZZCollectionViewCell.h
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *num;

@property (nonatomic, strong) UILabel *label;

- (void)refreshData;

@end

NS_ASSUME_NONNULL_END
