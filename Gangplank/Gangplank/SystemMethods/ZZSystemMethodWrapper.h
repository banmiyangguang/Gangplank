//
//  ZZSystemMethodWrapper.h
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

void printClasses(Class cls);

NSString *setterFromGetter(NSString *getter);

@interface ZZSystemMethodWrapper : NSObject

@end

NS_ASSUME_NONNULL_END
