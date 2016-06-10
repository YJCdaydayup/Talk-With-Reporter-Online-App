//
//  MessageModel.h
//  MessageTableView
//
//  Created by 杨力 on 14/5/2016.
//  Copyright © 2016 杨力. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

/**************************************这里都是控制参数*****************************************/

//系统的消息类型
typedef enum {
    
    SystemMessageType1 = 0,
    SystemMessageType2 = 1,
    SystemMessageType3 = 2,
    SystemMessageType4 = 3,
    SystemMessageType5 = 4,
    SystemMessageType6 = 5
    
}SystemMessageType;

@interface MessageModel : JSONModel

//昵称
@property (nonatomic,copy) NSString * nickname;

//消息内容
@property (nonatomic,copy) NSString * text;

//昵称前的图标数组
@property (nonatomic,strong) NSMutableArray * leftIconImages;

//昵称后的图标数组
@property (nonatomic,strong) NSMutableArray * rightIconImages;

//礼物名称
@property (nonatomic,copy) NSString * giftName;

//礼物小图片的名称
@property (nonatomic,copy) NSString * gift_Image_Name;

//座起名称
@property (nonatomic,copy) NSString * zuojiaName;

//座骑图标ID
@property (nonatomic,copy) NSString * zuojiaID;

//判断消息类型
@property (nonatomic,copy) NSString * messageType;

//判断系统消息的类型
@property (nonatomic,assign) SystemMessageType systemType;

+(instancetype)messageWithDict:(NSDictionary *)dict;

@end