//
//  MessageCell.h
//  MessageTableView
//
//  Created by 杨力 on 14/5/2016.
//  Copyright © 2016 杨力. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;

@interface MessageCell : UITableViewCell

//数据模型
@property (nonatomic,strong) MessageModel * messageModel;

//消息Label
@property (nonatomic,strong) UILabel * messageLabel;

//将数据模型传递给Cell
-(void)setMessageCellWithModel:(MessageModel *)model;

//适配工具
@property (nonatomic,assign) CGFloat max_X;
@property (nonatomic,assign) CGFloat max_Y;

@end
