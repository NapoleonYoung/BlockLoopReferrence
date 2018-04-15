//
//  Car.m
//  ObjcTest
//
//  Created by 尚轩瑕 on 2018/4/14.
//  Copyright © 2018年 Hisense. All rights reserved.
//

#import "Car.h"

NSString *const CarNotificationName = @"carNotification";

@implementation Car

- (Car *)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification) name:CarNotificationName object:nil];
    }
    return self;
}

- (void)receiveNotification {
    NSLog(@"Receiving Notification");
}

- (void)carRunning {

}

- (void)doWithBlock:(SomeBlock)block {
    self.myBlock = block;
    self.myBlock();
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"dealloc");
}

@end
