//
//  SCQuestionItem.h
//  NetEaseLottery
//
//  Created by Stephen Cao on 2/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 "title" : "如何领奖？",
 "html" : "help.html",
 "id" : "howtoprize"
 */
@interface SCQuestionItem : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *html;
@property(nonatomic,copy)NSString *ID;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)questionItemWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
