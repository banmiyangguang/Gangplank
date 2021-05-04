//
//  ZZCollectionReusableView.h
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZCollectionReusableView : UICollectionReusableView

@property (nonatomic, strong) NSString *num;

- (void)refreshData;

@end

NS_ASSUME_NONNULL_END
