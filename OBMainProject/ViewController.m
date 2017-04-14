//
//  ViewController.m
//  OBMainProject
//
//  Created by obally on 17/4/14.
//  Copyright © 2017年 obally. All rights reserved.
//

#import "ViewController.h"
#import <OBProtocolManager/OBProtocolManager.h>
#import <OBGoodsDetailServiceProtocol/OBGoodsDetailServiceProtocol.h>
@interface ViewController ()
@property (nonatomic, strong) UIButton *goodsButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    
    [self.view addSubview:self.goodsButton];
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.goodsButton.frame = CGRectMake(0, 0, 100, 100);
    self.goodsButton.center = self.view.center;
}

#pragma mark - event
- (void)didClickGoodsButton:(UIButton *)button
{
    id<OBGoodsDetailServiceProtocol> goodsServiceProvide = [OBProtocolManager serviceProvideForProtocol:@protocol(OBGoodsDetailServiceProtocol)];
    UIViewController *goodsDetailVC = [goodsServiceProvide goodsDetailViewControllerWithGoodsId:@"123" goodsName:@"农夫山泉矿泉水"];
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
    
}

#pragma mark - getters
- (UIButton *)goodsButton
{
    if (_goodsButton == nil) {
        _goodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goodsButton setTitle:@"A商品" forState:UIControlStateNormal];
        [_goodsButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_goodsButton addTarget:self action:@selector(didClickGoodsButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goodsButton;
}

@end
