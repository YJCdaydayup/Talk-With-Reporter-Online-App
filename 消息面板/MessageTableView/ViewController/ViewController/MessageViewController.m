//
//  MessageViewController.m
//  MessageTableView
//
//  Created by 杨力 on 14/5/2016.
//  Copyright © 2016 杨力. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"
#import "MessageModel.h"

//cell的复用
#define messageCell @"messageCell"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

/*主播背景图像*/
@property (nonatomic,strong) UIImageView * bgImageView;

//表格属性
@property (nonatomic,strong) UITableView * messageTableView;
@property (nonatomic,strong) NSMutableArray * dataArray;

//创建两个按钮，点击分别发送系统消息和手打消息
@property (nonatomic,strong) UIButton * systemButton;
@property (nonatomic,strong) UIButton * manulButton;

//存储假数据，整合代码时删除
@property (nonatomic,strong) NSMutableArray * tempSystemMessageArray;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景图片
//        self.bgImageView.image = [UIImage imageNamed:Zhubo_Image];
    self.view.backgroundColor = RGB_COLOR(250, 252, 250, 0.9);
    
    //界面设置
    [self configUI];
}

-(void)configUI{
    
    //创建按钮
    self.systemButton.backgroundColor = [UIColor yellowColor];
    self.manulButton.backgroundColor = [UIColor yellowColor];
    
    //这里获取假数据作测试
    [self getExampleData];
    
    //注册cell
    [self.messageTableView registerClass:[MessageCell class] forCellReuseIdentifier:messageCell];
    
    //刷新表格
    [self.messageTableView reloadData];
    
    //自动滚到最后一行
    __unsafe_unretained typeof(self) weakSelf = self;
    if(self.dataArray.count > 0){
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.messageTableView reloadData];
            [weakSelf.messageTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[weakSelf.dataArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        });
    }
}

-(void)getExampleData{
    
    //这里的字符串或者数组不可以为空
    
    //系统消息模型1
    NSString * nickname = @"悟空";
    NSString * giftName = @"喜欢你";
    NSString * gift_Image_Name = @"喜欢你";
    NSString * text = @"1";
    NSArray * leftIconImages  = @[@1];
    NSArray * rightIconImages = @[@1];
    NSString * zuojiaName = @"1";
    NSString * zuojiaID = @"1";
    NSString * messageType = @"1";
    SystemMessageType systemType = 0;
    
    NSDictionary * dict = @{@"nickname":nickname,@"giftName":giftName,@"gift_Image_Name":gift_Image_Name,@"text":text,@"leftIconImages":leftIconImages,@"rightIconImages":rightIconImages,@"zuojiaName":zuojiaName,@"zuojiaID":zuojiaID,@"messageType":messageType,@"systemType":@(systemType)};
    MessageModel * model = [[MessageModel alloc]initWithDictionary:dict error:nil];
    [self.dataArray addObject:model];
    
    //系统消息模型2
    NSString * loveName1 = @"唐三藏";
    NSString * giftName1 = @"1";
    NSString * gift_Image_Name1 = @"1";
    NSString * messageContent1 = @"1";
    NSArray * leftIconImages1  = @[@1];
    NSArray * rightIconImages1 = @[@1];
    NSString * zuojiaName1 = @"1";
    NSString * zuojiaID1 = @"1";
    NSString * messageType1 = @"1";
    SystemMessageType systemType1 = 1;
    NSDictionary * dict1 = @{@"nickname":loveName1,@"giftName":giftName1,@"gift_Image_Name":gift_Image_Name1,@"text":messageContent1,@"leftIconImages":leftIconImages1,@"rightIconImages":rightIconImages1,@"zuojiaName":zuojiaName1,@"zuojiaID":zuojiaID1,@"messageType":messageType1,@"systemType":@(systemType1)};
    MessageModel * model1 = [[MessageModel alloc]initWithDictionary:dict1 error:nil];
    [self.dataArray addObject:model1];
    
    //系统消息模型3
    NSString * loveName3 = @"刘德华";
    NSString * giftName3 = @"1";
    NSString * gift_Image_Name3 = @"1";
    NSString * messageContent3 = @"1";
    NSArray * leftIconImages3  = @[@1];
    NSArray * rightIconImages3 = @[@1];
    NSString * zuojiaName3 = @"3";
    NSString * zuojiaID3 = @"1";
    NSString * messageType3 = @"1";
    SystemMessageType systemType3 = 2;
    NSDictionary * dict3 = @{@"nickname":loveName3,@"giftName":giftName3,@"gift_Image_Name":gift_Image_Name3,@"text":messageContent3,@"leftIconImages":leftIconImages3,@"rightIconImages":rightIconImages3,@"zuojiaName":zuojiaName3,@"zuojiaID":zuojiaID3,@"messageType":messageType3,@"systemType":@(systemType3)};
    MessageModel * model3 = [[MessageModel alloc]initWithDictionary:dict3 error:nil];
    [self.dataArray addObject:model3];
    
    //系统消息模型4
    NSString * loveName4 = @"张学友";
    NSString * giftName4 = @"1";
    NSString * gift_Image_Name4 = @"1";
    NSString * messageContent4 = @"1";
    NSArray * leftIconImages4  = @[@1];
    NSArray * rightIconImages4 = @[@1];
    NSString * zuojiaName4 = @"4";
    NSString * zuojiaID4 = @"1";
    NSString * messageType4 = @"1";
    SystemMessageType systemType4 = 3;
    NSDictionary * dict4 = @{@"nickname":loveName4,@"giftName":giftName4,@"gift_Image_Name":gift_Image_Name4,@"text":messageContent4,@"leftIconImages":leftIconImages4,@"rightIconImages":rightIconImages4,@"zuojiaName":zuojiaName4,@"zuojiaID":zuojiaID4,@"messageType":messageType4,@"systemType":@(systemType4)};
    MessageModel * model4 = [[MessageModel alloc]initWithDictionary:dict4 error:nil];
    [self.dataArray addObject:model4];
    
    //系统消息模型5
    NSString * loveName5 = @"郭富城";
    NSString * giftName5 = @"1";
    NSString * gift_Image_Name5 = @"1";
    NSString * messageContent5 = @"1";
    NSArray * leftIconImages5  = @[@1];
    NSArray * rightIconImages5 = @[@1];
    NSString * zuojiaName5 = @"4";
    NSString * zuojiaID5 = @"1";
    NSString * messageType5 = @"1";
    SystemMessageType systemType5 = 4;
    NSDictionary * dict5 = @{@"nickname":loveName5,@"giftName":giftName5,@"gift_Image_Name":gift_Image_Name5,@"text":messageContent5,@"leftIconImages":leftIconImages5,@"rightIconImages":rightIconImages5,@"zuojiaName":zuojiaName5,@"zuojiaID":zuojiaID5,@"messageType":messageType5,@"systemType":@(systemType5)};
    MessageModel * model5 = [[MessageModel alloc]initWithDictionary:dict5 error:nil];
    [self.dataArray addObject:model5];
    
    //系统消息模型6
    NSString * loveName6 = @"哈喽";
    NSString * giftName6 = @"1";
    NSString * gift_Image_Name6 = @"1";
    NSString * messageContent6 = @"1";
    NSArray * leftIconImages6  = @[@1];
    NSArray * rightIconImages6 = @[@1];
    NSString * zuojiaName6 = @"宝马R8";
    NSString * zuojiaID6 = @"游艇";
    NSString * messageType6 = @"1";
    SystemMessageType systemType6 = 5;
    NSDictionary * dict6 = @{@"nickname":loveName6,@"giftName":giftName6,@"gift_Image_Name":gift_Image_Name6,@"text":messageContent6,@"leftIconImages":leftIconImages6,@"rightIconImages":rightIconImages6,@"zuojiaName":zuojiaName6,@"zuojiaID":zuojiaID6,@"messageType":messageType6,@"systemType":@(systemType6)};
    MessageModel * model6 = [[MessageModel alloc]initWithDictionary:dict6 error:nil];
    [self.dataArray addObject:model6];
    
    self.tempSystemMessageArray = [[NSMutableArray alloc]initWithObjects:model,model1,model3,model4,model5,model6, nil];
}

//表格的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageCell * cell = [[MessageCell alloc]init];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setMessageCellWithModel:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MessageModel * model = [self.dataArray objectAtIndex:indexPath.row];
    MessageCell * cell = [[MessageCell alloc]init];
    cell.selected = NO;
    
    //先将model模型赋值给cell
    [cell setMessageCellWithModel:model];
    
    //    //获取富文本的高度：不在cell里面获取
    //    CGSize size1=  [cell.messageLabel.attributedText boundingRectWithSize:CGSizeMake(Wscreen-10*ScreenMultipleIn6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    //    CGFloat tempFloat;
    //    if((model.leftIconImages.count+model.rightIconImages.count)>=4){
    //
    //        tempFloat = -1*ScreenMultipleIn6;
    //    }else{
    //
    //        if(![model.messageType isEqualToString:@"24"]&&model.systemType == SystemMessageType6){
    //
    //            tempFloat = -15*ScreenMultipleIn6;
    //        }else{
    //            tempFloat = 0*ScreenMultipleIn6;
    //        }
    //    }
    
    //    CGFloat height;
    //    if(![model.messageType isEqualToString:@"24"]){
    //
    //        height = 3*ScreenMultipleIn6;
    //    }else if([model.messageType isEqualToString:@"24"]){
    //
    //        if(size1.height>=System_TextFont*1.4*ScreenMultipleIn6&&size1.height<=1.35*System_TextFont*ScreenMultipleIn6){
    //
    //            height = 30*ScreenMultipleIn6;
    //            NSLog(@"1");
    //        }else if(size1.height<=System_TextFont*1.35*ScreenMultipleIn6&&size1.height>System_TextFont*1.32*ScreenMultipleIn6){
    //
    //            height = 15*ScreenMultipleIn6;
    //              NSLog(@"2");
    //        }else if(size1.height<=1.32*System_TextFont*ScreenMultipleIn6&&size1.height>=System_TextFont*1.3*ScreenMultipleIn6){
    //
    //            height = 15*ScreenMultipleIn6;
    //              NSLog(@"3");
    //        }
    //    }
    //
    
    //创建一个Label用于模拟动态计算Cell的高度
    //    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,0,Wscreen-20*ScreenMultipleIn6, 10)];
    //    label.font = [UIFont systemFontOfSize:System_TextFont*ScreenMultipleIn6];
    //    label.numberOfLines = 0;//任意行数
    //
    //    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //
    //    //注意，每一行的行间距分两部分，topSpacing和bottomSpacing。
    //
    //    [paragraphStyle setLineSpacing:5.0f];//调整行间距
    //
    //    NSMutableAttributedString * str = (NSMutableAttributedString *)cell.messageLabel.attributedText;
    //    [str setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:System_TextFont]} range:NSMakeRange(0, str.length)];
    //
    //    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,cell.messageLabel.attributedText.length)];
    //
    //    label.attributedText = cell.messageLabel.attributedText;//ios 6
    //
    //    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
    //
    //    CGRect frame = label.frame;
    //
    //    frame.size.height = size.height;
    //
    //    [label setFrame:frame];
    //
    //        CGFloat tempFloat;
    //        if((model.leftIconImages.count+model.rightIconImages.count)>=4){
    //
    //            tempFloat = -1*ScreenMultipleIn6;
    //        }else{
    //
    //            if(![model.messageType isEqualToString:@"24"]&&model.systemType == SystemMessageType6){
    //
    //                tempFloat = -15*ScreenMultipleIn6;
    //            }else{
    //                tempFloat = 0*ScreenMultipleIn6;
    //            }
    //        }
    
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0,0,Wscreen-20*ScreenMultipleIn6, 10)];
    UILabel * label = [[UILabel alloc]initWithFrame:cell.messageLabel.frame];
    label.attributedText = cell.messageLabel.attributedText;
    label.numberOfLines = 0;
    [label sizeToFit];
    //在固定label宽度条件下，自动调整行数、高度。
    return label.frame.size.height + Message_LineSpace*ScreenMultipleIn6;
}

//单行的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    MessageModel * model = [self.dataArray objectAtIndex:indexPath.row];
    NSLog(@"%@",model.nickname);
}

//模拟发送系统消息
-(void)sendSystemMessage{
    
    MessageModel * model = [self.tempSystemMessageArray objectAtIndex:arc4random()%6];
    [self.dataArray addObject:model];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.messageTableView reloadData];
        [weakSelf.messageTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[weakSelf.dataArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });
    
    //删除指定数量的消息条数
    [self removeAccssiveMessage];
}

//模拟发送手打消息
-(void)sendManulMessage{
    
    //昵称前数组
    NSArray * array1 = @[@"1"];
    NSArray * array2 = @[@"2"];
    NSArray * array3 = @[@"3"];
    NSArray * array4 = @[@"4"];
    NSArray * array5 = @[@"1",@"2"];
    NSArray * array6 = @[@"2",@"3",@"4"];
    NSArray * array7 = @[@"1",@"2",@"3",@"4"];
    NSArray * array = @[array1,array2,array3,array4,array5,array6,array7];
    //昵称后数组
    NSArray * array8 = @[@"7"];
    NSArray * array9 = @[@"8",@"9"];
    NSArray * array10 = @[@"9"];
    NSArray * array11 = @[@"7",@"8",@"9"];
    NSArray * behindArray = @[array8,array9,array10,array11];
    
    //消息内容
    NSString * content1 = @"大家好，我是刘德华，请收听我的最新单曲《男人哭吧不是罪》";
    NSString * content2 = @"一眨眼那么多年过去了，已从美国回国，做着自己喜欢的工终将在球场多欢的工终将在球场多欢的工终将在球场多欢的工终将在球场多欢的工终将在球场多欢的工终将在球场多欢的工终将在球场多欢的工终将在球场多少人的热血青春可能会在今天画下一个句号。";
    NSString * content3 = @"科比的人生信条教";
    NSString * content4 = @"尊重对手，才会赢得对手尊重";
    NSString * content5 = @"做最自己的自己";
    NSString * content6 = @"在球场上，科比也用自己卖力的表现，征服了凯尔特人主场的近19000名球迷，在科比执行罚球时，全场高呼MVP，这不是对手对你最大的尊重么?在留学生活中，";
    NSArray * contentArray = @[content1,content2,content3,content4,content5,content6];
    
    //消息发送人
    NSString * man1 = @"刘德华";
    NSString * man2 = @"张学友";
    NSString * man3 = @"郭富城";
    NSString * man4 = @"黎明";
    NSString * man5 = @"科比";
    NSString * man6 = @"哈咯";
    NSArray * manArray = @[man1,man2,man3,man4,man5,man6];
    
    NSString * nickname = manArray[arc4random()%6];
    NSString * giftName = @"1";
    NSString * gift_Image_Name = @"1";
    NSString * text = contentArray[arc4random()%6];
    //昵称前面的图标数组:这里随机产生
    NSArray * leftIconImages  = array[arc4random()%7];
    //昵称后面的图标数组：这里随机产生
    NSArray * rightIconImages = behindArray[arc4random()%4];
    NSString * zuojiaName = @"丘比特";
    NSString * zuojiaID = @"丘比特";
    NSString * messageType = @"24";
    SystemMessageType systemType = 5;
    NSDictionary * dict = @{@"nickname":nickname,@"giftName":giftName,@"gift_Image_Name":gift_Image_Name,@"text":text,@"leftIconImages":leftIconImages,@"rightIconImages":rightIconImages,@"zuojiaName":zuojiaName,@"zuojiaID":zuojiaID,@"messageType":messageType,@"systemType":@(systemType)};
    MessageModel * model = [[MessageModel alloc]initWithDictionary:dict error:nil];
    [self.dataArray addObject:model];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.messageTableView reloadData];
        [weakSelf.messageTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[weakSelf.dataArray count] - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });
    
    //删除指定数量的消息条数
    [self removeAccssiveMessage];
}

//删除指定数量的消息条数
-(void)removeAccssiveMessage{
    
    NSInteger messageCount = self.dataArray.count;
    if(messageCount ==  Message_MAXCOUNT){
        
        NSMutableArray * tempArray = [[NSMutableArray alloc]init];
        
        for(int i = Message_DeleteCount;i<Message_MAXCOUNT;i++){
            
            MessageModel * model = [self.dataArray objectAtIndex:i];
            [tempArray addObject:model];
        }
        
        self.dataArray = tempArray;
    }
}

//懒加载
//初始化表格
-(UITableView *)messageTableView{
    
    if(_messageTableView == nil){
        
        _messageTableView = [[UITableView alloc]init];
        _messageTableView.showsVerticalScrollIndicator = NO;
        _messageTableView.frame = CGRectMake(MessageTableViewPosition.x, MessageTableViewPosition.y, MessageTableViewSize.width, MessageTableViewSize.height);
        _messageTableView.alpha = 1.0;
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _messageTableView.backgroundColor = [UIColor clearColor];
        _messageTableView.userInteractionEnabled = YES;
        [self.view addSubview:_messageTableView];
    }
    return _messageTableView;
}

//初始化数据源
-(NSMutableArray *)dataArray{
    
    if(_dataArray == nil){
        
        _dataArray = [[NSMutableArray alloc]init];
    }
    
    return _dataArray;
}

-(UIImageView *)bgImageView{
    
    if(_bgImageView == nil){
        
        _bgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        _bgImageView.alpha = 1.0;
        [self.view addSubview:_bgImageView];
    }
    return _bgImageView;
}

//临时测试button
-(UIButton *)systemButton{
    
    if(_systemButton == nil){
        
        _systemButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _systemButton.frame = CGRectMake(70*ScreenMultipleIn6, 50*ScreenMultipleIn6, 85*ScreenMultipleIn6, 25*ScreenMultipleIn6);
        [_systemButton setTitle:@"系统消息" forState:UIControlStateNormal];
        [self.view addSubview:_systemButton];
        [_systemButton addTarget:self action:@selector(sendSystemMessage) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _systemButton;
}

-(UIButton *)manulButton{
    
    if(_manulButton == nil){
        
        _manulButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _manulButton.frame = CGRectMake(220*ScreenMultipleIn6, 50*ScreenMultipleIn6, 85*ScreenMultipleIn6, 25*ScreenMultipleIn6);
        [_manulButton setTitle:@"手打消息" forState:UIControlStateNormal];
        [self.view addSubview:_manulButton];
        [_manulButton addTarget:self action:@selector(sendManulMessage) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _manulButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
