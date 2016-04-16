//
//  UITableViewCell+Create.m
//  
//
//  Created by zhouyun on 15/7/14.
//  Copyright (c) 2015年 zhouyun. All rights reserved.
//

#import "UITableViewCell+Create.h"

@implementation UITableViewCell (Create)


#pragma mark - Public Methods

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *reuseId = NSStringFromClass([self class]);
    
    id cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        
        [cell layoutCell];
    }
    return cell;
}



+ (instancetype)cellNibWithTableView:(UITableView *)tableView {
    
    NSString *nibName = NSStringFromClass([self class]);
    NSString *reuseId = nibName;
    
    id cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] lastObject];
        
        [cell layoutCell];
    }
    
    return cell;
}


+ (instancetype)cellNibWithTableView:(UITableView *)tableView
                            reusedId:(NSString *)reusedId
                            nibNamed:(NSString *)nibName
                             atIndex:(NSInteger)index {
    
    id cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] objectAtIndex:index];
        
        [cell layoutCell];
    }
    
    return cell;
}

#pragma mark - Private Methods

- (void)layoutCell {
    //子类重载
}


@end
