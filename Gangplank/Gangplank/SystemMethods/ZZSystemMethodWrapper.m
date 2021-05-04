//
//  ZZSystemMethodWrapper.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/5/4.
//

#import "ZZSystemMethodWrapper.h"
#import <objc/runtime.h>

/**
 @brief 遍历类以及子类
 usage:
    printClasses([KVOObservedClass class]);
    KVO register code;
    printClasses([KVOObservedClass class);
 */
void printClasses(Class cls) {
    int numClasses = objc_getClassList(NULL, 0);
    
    NSMutableArray *clsArray = [NSMutableArray arrayWithObject:cls];
    
    Class *classes = (Class *)malloc(sizeof(Class) * numClasses);
    
    objc_getClassList(classes, numClasses);
    
    for (int i = 0; i < numClasses; i++) {
        if (cls == class_getSuperclass(classes[i])) {
            [clsArray addObject:classes[i]];
        }
    }
     
    free(classes);
    NSLog(@"%@", clsArray);
}

/**
 @brief 遍历所有方法
 */
void printClassAllMethods(Class cls) {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        IMP imp = class_getMethodImplementation(cls, sel);
        NSLog(@"%@-%p", NSStringFromSelector(sel), imp);
    }
    free(methodList);
}

/**
 @brief 从 get 方法获取 set 方法的名称 key ==> setKey:
 */
NSString *setterFromGetter(NSString *getter) {
    if (getter.length <= 0) return nil;
    
    NSString *newGetter = [getter capitalizedString];
    
    return [NSString stringWithFormat:@"set%@", newGetter];
}

/**
 @brief 从 set 方法获取到 get 方法  setKey: ==> key
 */
static NSString *getterFromSetter(NSString *setter) {
    if (setter.length <= 0 ||
        ![setter hasPrefix:@"set"] ||
        ![setter hasSuffix:@":"]) {
        return nil;
    }
    
    NSRange range = NSMakeRange(3, setter.length - 4);
    NSString *getter = [setter substringWithRange:range];
    
    NSString *firstCharacter = [[getter substringToIndex:1] lowercaseString];
    
    return [getter stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstCharacter];
    
}

/**
 @brief 验证 keypath 是否存在 setter 方法
 */
void judgeSetterMethodFromKeyPath(id obj, NSString *keyPath) {
    Class superClass = object_getClass(obj);
    SEL setterSelector = NSSelectorFromString(setterFromGetter(keyPath));
    Method setterMethod = class_getInstanceMethod(superClass, setterSelector);
    if (!setterMethod) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"There is no setter for %@", keyPath] userInfo:nil];
    }
} 

@implementation ZZSystemMethodWrapper

@end
