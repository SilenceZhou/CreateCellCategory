//
//  UIViewController+QMViewController.m
//  Nongfadai
//
//  Created by 刘永生 on 15/7/10.
//  Copyright (c) 2015年 深圳农金圈金融服务有限公司. All rights reserved.
//

#import "UIViewController+QMViewController.h"
#import <SVProgressHUD.h>
#import "Notification.h"
#import "LLLockViewController.h"
@implementation UIViewController (QMViewController)


- (void)show {
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}
- (void)showWithStatus:(NSString *)aStatus {
    
    [SVProgressHUD showWithStatus:aStatus maskType:SVProgressHUDMaskTypeBlack];
}

- (void)showMessage:(NSString *)aStatus {
    [SVProgressHUD showImage:nil status:aStatus maskType:SVProgressHUDMaskTypeBlack];
}

- (void)showErrorWithStatus:(NSString *)aStatus {
    
    [SVProgressHUD showErrorWithStatus:aStatus maskType:SVProgressHUDMaskTypeBlack];
}
- (void)showSuccessWithStatus:(NSString *)aStatus {
    
    [SVProgressHUD showSuccessWithStatus:aStatus maskType:SVProgressHUDMaskTypeBlack];
}

- (void)dismiss {
    [SVProgressHUD dismiss];
}


- (void)showAlertViewMessage:(NSString *)aMessage {
    
    NSString * mess = @"服务器异常,请稍后再试.";
    
    if ([aMessage isKindOfClass:[NSDictionary class]]) {
        
        BOOL isMustLogin = NO;
        if (((NSDictionary *)aMessage)[@"mustLogin"]) {
            isMustLogin = [((NSDictionary *)aMessage)[@"mustLogin"] boolValue];
        }
        
        if (isMustLogin) {
            
            [Notification login];
            
//            [self performSelector:@selector(login)
//                       withObject:nil
//                       afterDelay:1];
            return;
        }
        
        
        if (((NSDictionary *)aMessage)[@"message"] && ((NSDictionary *)aMessage)[@"message"] !=[NSNull null]) {
            mess = ((NSDictionary *)aMessage)[@"message"];
        }
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                        message:mess
                                                       delegate:isMustLogin?self: nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        alert.tag = 9900;
        [alert show];
        return;
    }
    
    if ([aMessage isKindOfClass:[NSError class]]) {
        if (((NSError *)aMessage).code == NSURLErrorCannotConnectToHost) {
            mess = @"网络异常,请检查网络.";
        }
    }
    if ([aMessage isKindOfClass:[NSString class]]) {
        mess = aMessage;
    }

    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                    message:mess
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}
- (void)login {
    [Notification login];
}


- (void)showAlertViewMessage:(NSString *)aMessage tableView:(UITableView *)aTableView{
    
    NSString * mess = @"服务器异常,请稍后再试.";
    
    
    
    if ([aMessage isKindOfClass:[NSDictionary class]]) {
        
        BOOL isMustLogin = NO;
        if (((NSDictionary *)aMessage)[@"mustLogin"]) {
            isMustLogin = [((NSDictionary *)aMessage)[@"mustLogin"] boolValue];
        }
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                        message:mess
                                                       delegate:isMustLogin?self: nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        alert.tag = 9900;
        [alert show];
        return;
    }
    
    
    if ([aMessage isKindOfClass:[NSString class]]) {
        mess = aMessage;
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                        message:mess
                                                       delegate:[mess isEqualToString:@"未登录或会话超时,请重新登录"]?self: nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        alert.tag = 9900;
        [alert show];
        
    }
    

}



- (void)showAlertViewMessage:(NSString *)aMessage callLogin:(BOOL)isLogin{
    
    NSString * mess = @"服务器异常,请稍后再试.";
    if ([aMessage isKindOfClass:[NSString class]]) {
        mess = aMessage;
    }
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                    message:mess
                                                   delegate:isLogin?self:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    alert.tag = 9900;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == 9900) {
        
        [Notification login];
    }
    
    
}


- (void)failHandler:(NSError *)aError {
    
    if (!aError) {
        return;
    }
    
    
    if ([aError isKindOfClass:[NSError class]]) {
        
        if (aError.code == NSURLErrorCannotConnectToHost) {
            [Notification cannotConnectToHost];
            return;
        }
        
        [QMErrorView errorFromCtrl:self ErrorType:QMError_NONET];
        
    }else {
        [self showAlertViewMessage:(NSString *)aError];
    }
}


- (void)failHandler:(NSError *)aError table:(UITableView *)aTable{
    
    if (!aError) {
        return;
    }
    
    if ([aError isKindOfClass:[NSError class]]) {
        
        if (((NSError *)aError).code == NSURLErrorCannotConnectToHost) {
            [QMErrorView errorFromTableView:aTable
                                  ErrorType:QMError_CannotToHost
                                   delegate:self];
            return;
        }
        [QMErrorView errorFromTableView:aTable
                              ErrorType:QMError_NODATA
                               delegate:nil];
        
    }else {
        [self showAlertViewMessage:(NSString *)aError];
    }
    
    
}

- (void)goGestureView:(id)sender {
    
    LLLockViewController *lockVc = [[LLLockViewController alloc] init];
    lockVc.nLockViewType = LLLockViewTypeCreate;
    lockVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:lockVc animated:YES];
    
}

@end
