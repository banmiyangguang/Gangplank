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
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.num = @"";
    self.label.text = nil;
    
}

- (void)layoutSubviews {
    self.label.bounds = CGRectMake(0, 0, 44, 44);
    self.label.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
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
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
