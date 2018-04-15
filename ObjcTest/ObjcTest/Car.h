//
//  Car.h
//  ObjcTest
//
//  Created by 尚轩瑕 on 2018/4/14.
//  Copyright © 2018年 Hisense. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const CarNotificationName;
typedef void(^SomeBlock)(void);

@interface Car : NSObject

@property (nonatomic, weak) SomeBlock myBlock;

- (void)doWithBlock:(SomeBlock)block;
- (void)carRunning;

@end
