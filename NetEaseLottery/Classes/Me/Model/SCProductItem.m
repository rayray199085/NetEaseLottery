//
//  SCProductItem.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCProductItem.h"

@implementation SCProductItem
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}
+(instancetype)productItemWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
