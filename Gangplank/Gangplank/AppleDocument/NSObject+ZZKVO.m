//
//  NSObject+ZZKVO.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import "NSObject+ZZKVO.h"
#import "ZZSystemMethodWrapper.h"

static NSString * const prefix = @"ZZKVONotifying_";

@implementation NSObject (ZZKVO)

- (Class)createChildClassWithKeyPath:(NSString *)keyPath {
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [NSString stringWithFormat:@"%@%@", prefix, oldClassName];
    
    Class newClass = NSClassFromString(newClassName);
    if (newClass) return newClass;
    
    newClass = objc_allocateClassPair([self class], newClassName.UTF8String, 0);
    
    objc_registerClassPair(newClass);

    SEL setterSel  = NSSelectorFromString(setterFromGetter(keyPath));
    Method method = class_getInstanceMethod([self class], setterSel);
    const char *type = method_getTypeEncoding(method);
    class_addMethod(newClass, setterSel, (IMP)ZZ_setter, type);
    
    return newClass;
}

static void ZZ_setter(id self, SEL _cmd, id newValue) {
    NSLog(@"收到：%@", newValue);
}

@end
