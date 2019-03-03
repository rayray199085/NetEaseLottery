//
//  SCAboutHeaderView.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCAboutHeaderView.h"

@implementation SCAboutHeaderView
+(instancetype)aboutHeaderView{
    return [[[NSBundle mainBundle]loadNibNamed:@"SCAboutHeaderView" owner:nil options:nil]lastObject];
}
@end
