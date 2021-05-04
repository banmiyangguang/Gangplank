//
//  ZZCollectionViewCell.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import "ZZCollectionViewCell.h"

@implementation ZZCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
        self.label.frame = CGRectMake(3, 3, 44, 44);
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.num = @"";
}

- (void)refreshData {
    _label.text = self.num;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor grayColor];
        _label.text = self.num;
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}

@end
