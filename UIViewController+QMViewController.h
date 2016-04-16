//
//  UIViewController+QMViewController.h
//  Nongfadai
//
//  Created by 刘永生 on 15/7/10.
//  Copyright (c) 2015年 深圳农金圈金融服务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QMErrorView.h"

@interface UIViewController (QMViewController) <UIAlertViewDelegate>

- (void)show;
- (void)showWithStatus:(NSString *)aStatus;
/**
 *  只显示文字
 */
- (void)showMessage:(NSString *)aStatus;
- (void)showErrorWithStatus:(NSString *)aStatus;
- (void)showSuccessWithStatus:(NSString *)aStatus;
- (void)dismiss;
- (void)showAlertViewMessage:(NSString *)aMessage;

- (void)showAlertViewMessage:(NSString *)aMessage callLogin:(BOOL)isLogin;

- (void)showAlertViewMessage:(NSString *)aMessage tableView:(UITableView *)aTableView;

- (void)failHandler:(NSError *)aError;
- (void)failHandler:(NSError *)aError table:(UITableView *)aTable;


- (void)goGestureView:(id)sender;


@end
