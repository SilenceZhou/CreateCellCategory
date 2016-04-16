//
//  UITableViewCell+Create.h
//
//
//  Created by zhouyun on 15/7/14.
//  Copyright (c) 2015年 zhouyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Create)

/**
 *  创建cell,根据类名复用机制
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  使用xib创建cell,根据类名获取nibName
 */
+ (instancetype)cellNibWithTableView:(UITableView *)tableView;


/**
 *  使用xib创建cell
 */
+ (instancetype)cellNibWithTableView:(UITableView *)tableView
                            reusedId:(NSString *)reusedId
                            nibNamed:(NSString *)nibName
                             atIndex:(NSInteger)index;

/**
 *  如果要对cell进行其他设置,重写该方法,子类重载
 */
- (void)layoutCell;

@end
