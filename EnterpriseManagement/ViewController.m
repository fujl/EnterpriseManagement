//
//  ViewController.m
//  EnterpriseManagement
//
//  Created by fujl-mac on 2017/12/15.
//  Copyright © 2017年 fujl-mac. All rights reserved.
//

#import "ViewController.h"
#import <AppManager/AppManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AMNetworkManager *manager = getManager([AMNetworkManager class]);
    BOOL hasNet = [manager hasNet];
    NSLog(@"hasNet %d", hasNet);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
