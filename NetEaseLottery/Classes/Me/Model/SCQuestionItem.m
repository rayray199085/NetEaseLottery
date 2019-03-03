//
//  SCQuestionItem.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 2/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCQuestionItem.h"

@implementation SCQuestionItem

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}
+(instancetype)questionItemWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
