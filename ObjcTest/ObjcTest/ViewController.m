//
//  ViewController.m
//  ObjcTest
//
//  Created by 尚轩瑕 on 2018/4/14.
//  Copyright © 2018年 Hisense. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.myView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_myView];

    [UIView animateWithDuration:5.0 animations:^{
        self.myView.frame = CGRectMake(100, 100, 200, 200);
        self.myView.backgroundColor = [UIColor blueColor];
    }];

    Car *car = [[Car alloc] init];
    [[NSNotificationCenter defaultCenter] postNotificationName:CarNotificationName object:nil];
    
    //__weak Car *weakCar = car;
    [car doWithBlock:^{
        [car carRunning];
        //[weakCar carRunning];
    }];

    car = nil;

    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5);
    dispatch_after(time, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:CarNotificationName object:nil];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
