//
//  HLHGlobalMacro.h
//  HLHComponent
//
//  Created by lihuiHan on 2017/11/1.
//

#ifndef HLHGlobalMacro_h
#define HLHGlobalMacro_h

#define kSystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

#define HLH_SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define HLH_Dispatch_Sync_Main(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define HLH_Dispatch_Async_Main(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

/* weak reference */
#define HLH_WEAK_SELF(weakSelf) __weak __typeof(&*self) weakSelf = self;
#define HLH_STRONG_SELF(strongSelf) __strong __typeof(&*weakSelf) strongSelf = weakSelf;

#endif /* HLHGlobalMacro_h */
