//
//  param_list.h
//  MessageTableView
//
//  Created by 杨力 on 14/5/2016.
//  Copyright © 2016 杨力. All rights reserved.
//

#ifndef param_list_h
#define param_list_h

/*界面背景，主播的头像*/
#define Zhubo_Image  @"zhubo"

/**************************消息面板参数*************************/
//消息列表的位置
#define MessageTableViewPosition  CGPointMake(0, 200)

//消息列表的大小
#define MessageTableViewSize  CGSizeMake( Wscreen,Hscreen - 300)

//两条消息之间的间隙
#define Message_LineSpace  1.0

//可以存储的最大消息条数
#define Message_MAXCOUNT 50

//每次清除的消息条数
#define Message_DeleteCount 40




/**************************文字特效参数*************************/
//文字阴影颜色
#define TextShadowColor [RGB_COLOR(255, 252, 238, 0.6)CGColor]
//文字阴影的偏移量
#define TextShadowOffset CGSizeMake(0.1, 0.1)
//文字的泛化量
#define TextShadowOpacity 0.3
//文字的背景底色
#define TextBackgroundTextColor  RGB_COLOR(50,150,39, 0.2)




/**************************系统消息参数*************************/
/*系统文字大小*/
#define System_TextFont 14.5

/*昵称文字颜色*/
#define System_LoveNameColor [UIColor randomColor]

/*系统文案文字颜色*/
//系统消息类型一
#define System_ContentTextType1_Color  RGB_COLOR(220, 127, 15, 1)

//系统消息类型二
#define Sysytem_ContentTextType2_Color RGB_COLOR(180, 157, 88, 1)

//系统消息类型三
#define Sysytem_ContentTextType3_Color RGB_COLOR(220, 197, 15, 1)

//系统消息类型四
#define Sysytem_ContentTextType4_Color RGB_COLOR(255, 160, 15, 1)

//系统消息类型五
#define Sysytem_ContentTextType5_Color RGB_COLOR(165, 127, 15, 1)

//系统消息类型六
#define Sysytem_ContentTextType6_Color RGB_COLOR(250, 237, 15, 1)

//座骑名称颜色
#define System_zuojiNameText_Color RGB_COLOR(230, 190, 17, 1)





/**************************手动消息参数*************************/
/*昵称文字大小*/
#define Manul_LoveName_Font 14.5

/*昵称文字颜色*/
#define Manul_LoveNameColor [UIColor randomColor]

/*消息内容的字体颜色*/
#define Manul_MessageContent_Color RGB_COLOR(255, 255, 251, 1)

/*消息内容的字体大小*/
#define Manul_MessageContent_Font 14.5

//昵称后面图标设置
#define Behind_NickNameImage_posion_X   0.0f
#define Behind_NickNameImage_posion_Y   -3.0f
#define Behind_NickNameImage_Size_Width 34.0f
#define Behind_NickNameImage_Size_Height 15.0f


#endif /* param_list_h */
