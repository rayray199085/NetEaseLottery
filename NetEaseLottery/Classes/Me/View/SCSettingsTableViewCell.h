//
//  SCSettingsTableViewCell.h
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCSettingsTableViewCell : UITableViewCell
@property(nonatomic,strong)NSDictionary *dict;
-(instancetype)initWithTableView:(UITableView *)tableView andWithDictionary:(NSDictionary *)dict;
+(instancetype)settingsCellWithTableView:(UITableView *)tableView andWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
