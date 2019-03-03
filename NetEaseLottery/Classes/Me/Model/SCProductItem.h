//
//  SCProductItem.h
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCProductItem : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *stitle;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *customUrl;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)productItemWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
