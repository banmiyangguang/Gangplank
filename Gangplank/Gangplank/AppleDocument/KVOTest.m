//
//  KVOTest.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/3.
//

#import "KVOTest.h"

@implementation KVOTest

- (instancetype)init {
    self = [super init];
    if (self) {
        _person = [[ZZPerson alloc] init];
        [self addKVOObserver];
    }
    return self;
}

- (void)addKVOObserver {
    [self.person addObserver:self
               forKeyPath:@"age"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    NSLog(@"%@", change[NSKeyValueChangeNewKey]);
}

- (void)dealloc {
//    [self.person removeObserver:self forKeyPath:@"age"];
}



@end
