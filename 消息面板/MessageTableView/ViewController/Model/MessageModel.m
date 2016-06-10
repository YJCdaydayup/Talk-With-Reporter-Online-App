//
//  MessageModel.m
//  MessageTableView
//
//  Created by 杨力 on 14/5/2016.
//  Copyright © 2016 杨力. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

+(instancetype)messageWithDict:(NSDictionary *)dict{
    
    MessageModel * model = [[MessageModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
