
//
//  MessageCell.m
//  MessageTableView
//
//  Created by 杨力 on 14/5/2016.
//  Copyright © 2016 杨力. All rights reserved.
//

#import "MessageCell.h"
#import "MessageModel.h"

@implementation MessageCell

//由于不知道消息的类型，在这里根据model的消息类型设置Cell
-(void)setMessageCellWithModel:(MessageModel *)model{
    
    self.messageModel = model;
    //设置cell喂透明
    self.backgroundColor = [UIColor clearColor];
    
    /********************如果消息类型是“系统消息 !=24”***************************/
    if(![model.messageType isEqualToString:@"24"]){
        
        //定制系统消息
        if(model.systemType == SystemMessageType1){
            
            [self createType1:model];
        }else if(model.systemType == SystemMessageType2){
            
            [self createType2:model];
        }else if (model.systemType == SystemMessageType3){
            
            [self createType3:model];
        }else if(model.systemType == SystemMessageType4){
            
            [self createType4:model];
        }else if (model.systemType == SystemMessageType5){
            
            [self createType5:model];
        }else if (model.systemType == SystemMessageType6){
            
            [self createType6:model];
        }
        
        /*********************如果消息类型是“手打消息”************************/
    }else{
        
        NSMutableArray * frontArray = model.leftIconImages;
        NSMutableArray * behindArray = model.rightIconImages;
        
        //获取数组中图标的个数
        NSUInteger front_Count = frontArray.count;
        NSUInteger behind_Count = behindArray.count;
        
        //创建一个富文本
        NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
        
        //1.添加昵称前面的图标
        for(int i=0;i<front_Count;i++){
            
            NSTextAttachment * attachImage = [[NSTextAttachment alloc]init];
            attachImage.image = [UIImage imageNamed:frontArray[i]];
            attachImage.bounds = CGRectMake(0, -4*ScreenMultipleIn6, 34*ScreenMultipleIn6, 16*ScreenMultipleIn6);
            NSAttributedString  * imageString = [NSAttributedString attributedStringWithAttachment:attachImage];
            [attri appendAttributedString:imageString];
        }
        
        //2.添加昵称
        NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@:",model.nickname]];
        //昵称大小
        [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:Manul_LoveName_Font*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
        //昵称颜色
        [loveNameAttri addAttribute:NSForegroundColorAttributeName value:Manul_LoveNameColor range:NSMakeRange(0, loveNameAttri.length)];
        [attri appendAttributedString:loveNameAttri];
        
        //3.添加昵称后面的图标
        for(int i=0;i<behind_Count;i++){

            
            NSTextAttachment * attachImage = [[NSTextAttachment alloc]init];
            attachImage.image = [UIImage imageNamed:behindArray[i]];
            attachImage.bounds = CGRectMake(Behind_NickNameImage_posion_X*ScreenMultipleIn6, Behind_NickNameImage_posion_Y*ScreenMultipleIn6, Behind_NickNameImage_Size_Width*ScreenMultipleIn6, Behind_NickNameImage_Size_Height*ScreenMultipleIn6);
            NSAttributedString  * imageString = [NSAttributedString attributedStringWithAttachment:attachImage];
            [attri appendAttributedString:imageString];
        }
        
        //4.添加消息内容
        NSMutableAttributedString * contentMessage  = [[NSMutableAttributedString alloc]initWithString:model.text];
        //昵称大小
        [contentMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:Manul_MessageContent_Font*ScreenMultipleIn6] range:NSMakeRange(0, contentMessage.length)];
        //昵称颜色
        [contentMessage addAttribute:NSForegroundColorAttributeName value:Manul_MessageContent_Color range:NSMakeRange(0, contentMessage.length)];
        [attri appendAttributedString:contentMessage];
        
        //5.创建Label，并将富文本放在Label上面
        [self createLabelWithString:attri];
    }
}




//昵称后面图标大小
#define Behind_NickNameImage_Size CGSizeMake(34, 15)


//创建Label
-(void)createLabelWithString:(NSMutableAttributedString *)string{
    
    CGFloat height;
    //对系统消息6布局做微调整
    if(![self.messageModel.messageType isEqualToString:@"24"]&&self.messageModel.systemType == SystemMessageType6){
        height = 1*ScreenMultipleIn6;
        //对其他系统消息布局做微调整
    }else if(![self.messageModel.messageType isEqualToString:@"24"]&&self.messageModel.systemType != SystemMessageType6){
        height = 1.5*ScreenMultipleIn6;
    }else{
         //对手打消息布局做微调整
        height = 1*ScreenMultipleIn6;
    }
    
    self.messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*ScreenMultipleIn6,height,Wscreen-20*ScreenMultipleIn6, 10)];
//    self.messageLabel.font = [UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6];
    self.messageLabel.attributedText = string;
    self.messageLabel.numberOfLines = 0;
    [self.messageLabel sizeToFit];
    [self.contentView addSubview:self.messageLabel];
    
    //文字的特效处理
    self.messageLabel.layer.shadowColor = TextShadowColor;
    self.messageLabel.layer.shadowOffset = TextShadowOffset;
    self.messageLabel.layer.shadowOpacity = TextShadowOpacity;
    self.messageLabel.backgroundColor = TextBackgroundTextColor;
}


//定制系统消息:SystemMessageType1
-(void)createType1:(MessageModel *)model{
    
    //    （1）【昵称】 送了一个【礼物名称】【礼物小图片】； 昵称后面的文案和昵称颜色不同
    
    //创建一个富文本
    NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
    
    //1.添加昵称
    NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.nickname]];
    //昵称大小
    [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
    //昵称颜色
    [loveNameAttri addAttribute:NSForegroundColorAttributeName value:System_LoveNameColor range:NSMakeRange(0, loveNameAttri.length)];
    
    [attri appendAttributedString:loveNameAttri];
    
    //2.文案设置“送了一个+礼物图片”
    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"送了一个%@",model.giftName]];
    //文案大小
    [contentText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText.length)];
    //文案颜色
    [contentText addAttribute:NSForegroundColorAttributeName value:System_ContentTextType1_Color range:NSMakeRange(0, contentText.length)];
    [attri appendAttributedString:contentText];
    
    //3.设置礼物图片
    NSTextAttachment * attachImage = [[NSTextAttachment alloc]init];
    attachImage.image = [UIImage imageNamed:model.giftName];
    attachImage.bounds = CGRectMake(0, -6*ScreenMultipleIn6, 33*ScreenMultipleIn6, 23*ScreenMultipleIn6);
    NSAttributedString  * imageString = [NSAttributedString attributedStringWithAttachment:attachImage];
    [attri appendAttributedString:imageString];
    
    [self createLabelWithString:attri];
}

//定制系统消息:SystemMessageType2
-(void)createType2:(MessageModel *)model{
    
    //    （2）【昵称】给主播点了赞； 昵称后面的文案和昵称颜色不同
    
    //创建一个富文本
    NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
    
    //1.添加昵称
    NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.nickname]];
    //昵称大小
    [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
    //昵称颜色
    [loveNameAttri addAttribute:NSForegroundColorAttributeName value:System_LoveNameColor range:NSMakeRange(0, loveNameAttri.length)];
    [attri appendAttributedString:loveNameAttri];
    
    //2.文案设置“给主播点了赞”
    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:@"给主播点了赞;"];
    //文案大小
    [contentText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText.length)];
    //文案颜色
    [contentText addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType2_Color range:NSMakeRange(0, contentText.length)];
    [attri appendAttributedString:contentText];
    
    [self createLabelWithString:attri];
}

//定制系统消息:SystemMessageType3
-(void)createType3:(MessageModel *)model{
    
    //    （3）【昵称】分享了主播的直播； 昵称后面的文案和昵称颜色不同
    
    //创建一个富文本
    NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
    
    //1.添加昵称
    NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.nickname]];
    //昵称大小
    [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
    //昵称颜色
    [loveNameAttri addAttribute:NSForegroundColorAttributeName value:System_LoveNameColor range:NSMakeRange(0, loveNameAttri.length)];
    [attri appendAttributedString:loveNameAttri];
    //2.文案设置“分享了主播的直播”
    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:@"分享了主播的直播;"];
    //文案大小
    [contentText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText.length)];
    //文案颜色
    [contentText addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType3_Color range:NSMakeRange(0, contentText.length)];
    [attri appendAttributedString:contentText];
    
    [self createLabelWithString:attri];
    
}

//定制系统消息:SystemMessageType4
-(void)createType4:(MessageModel *)model{
    
    //    （4）【昵称】关注了主播； 昵称后面的文案和昵称颜色不同
    
    //创建一个富文本
    NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
    
    //1.添加昵称
    NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.nickname]];
    //昵称大小
    [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
    //昵称颜色
    [loveNameAttri addAttribute:NSForegroundColorAttributeName value:System_LoveNameColor range:NSMakeRange(0, loveNameAttri.length)];
    [attri appendAttributedString:loveNameAttri];
    //2.文案设置“关注了主播”
    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:@"关注了主播;"];
    //文案大小
    [contentText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText.length)];
    //文案颜色
    [contentText addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType4_Color range:NSMakeRange(0, contentText.length)];
    [attri appendAttributedString:contentText];
    
    [self createLabelWithString:attri];
}

//定制系统消息:SystemMessageType5
-(void)createType5:(MessageModel *)model{
    
    //    （5）  欢迎【昵称】进入直播间
    
    //创建一个富文本
    NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
    
    //1.添加昵称
    NSMutableAttributedString * welcomeText  = [[NSMutableAttributedString alloc]initWithString:@"欢迎"];
    //昵称大小
    [welcomeText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, welcomeText.length)];
    //昵称颜色
    [welcomeText addAttribute:NSForegroundColorAttributeName value:System_LoveNameColor range:NSMakeRange(0, welcomeText.length)];
    [attri appendAttributedString:welcomeText];
    
    //2.添加昵称
    NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.nickname]];
    //文案大小
    [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
    //文案颜色
    [loveNameAttri addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType5_Color range:NSMakeRange(0, loveNameAttri.length)];
    [attri appendAttributedString:loveNameAttri];
    //3.文案设置“进入直播间”
    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:@"进入直播间!"];
    [contentText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText.length)];
    [contentText addAttribute:NSForegroundColorAttributeName value:System_LoveNameColor range:NSMakeRange(0, contentText.length)];
    [attri appendAttributedString:contentText];
    
    [self createLabelWithString:attri];
}

//定制系统消息:SystemMessageType6
-(void)createType6:(MessageModel *)model{
    
    //    （6）【昵称】开着【坐骑名字】【坐骑图片】进入了直播间！
    
    //创建一个富文本
    NSMutableAttributedString * attri  = [[NSMutableAttributedString alloc]init];
    
    //1.添加昵称
    NSMutableAttributedString * loveNameAttri  = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.nickname]];
    //文案大小
    [loveNameAttri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, loveNameAttri.length)];
    //文案颜色
    [loveNameAttri addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType5_Color range:NSMakeRange(0, loveNameAttri.length)];
    [attri appendAttributedString:loveNameAttri];
    
    //2.文案设置“开着”
    NSMutableAttributedString * contentText = [[NSMutableAttributedString alloc]initWithString:@"开着"];
    [contentText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText.length)];
    [contentText addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType6_Color range:NSMakeRange(0, contentText.length)];
    [attri appendAttributedString:contentText];
    
    
    //3.文案设置“座骑名称”
    NSMutableAttributedString * zuojiming = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",model.zuojiaName]];
    [zuojiming addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, zuojiming.length)];
    [zuojiming addAttribute:NSForegroundColorAttributeName value:System_zuojiNameText_Color range:NSMakeRange(0, zuojiming.length)];
    [attri appendAttributedString:zuojiming];
    
    //4.设置座骑图片
    NSTextAttachment * attachImage = [[NSTextAttachment alloc]init];
    attachImage.image = [UIImage imageNamed:model.zuojiaID];
    attachImage.bounds = CGRectMake(0*ScreenMultipleIn6, -12*ScreenMultipleIn6,40*ScreenMultipleIn6,35*ScreenMultipleIn6);
    NSAttributedString  * imageString = [NSAttributedString attributedStringWithAttachment:attachImage];
    [attri appendAttributedString:imageString];
    
    //5.文案设置“开着+座骑名称”
    NSMutableAttributedString * contentText1 = [[NSMutableAttributedString alloc]initWithString:@"进入直播间!"];
    [contentText1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6] range:NSMakeRange(0, contentText1.length)];
    [contentText1 addAttribute:NSForegroundColorAttributeName value:Sysytem_ContentTextType6_Color range:NSMakeRange(0, contentText1.length)];
    [attri appendAttributedString:contentText1];
    
    [self createLabelWithString:attri];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
