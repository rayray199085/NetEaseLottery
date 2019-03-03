//
//  SCSettingsTableViewCell.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCSettingsTableViewCell.h"
@implementation SCSettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithTableView:(UITableView *)tableView andWithDictionary:(NSDictionary *)dict{
    static NSString *defaultIdentifier = @"UITableViewCellStyleSubtitle";
    static NSString *value1Identifier = @"UITableViewCellStyleValue1";
    static NSString *value2Identifier = @"UITableViewCellStyleValue2";
    static NSString *subtitleIdentifier = @"UITableViewCellStyleSubtitle";
    NSString *identifier = defaultIdentifier;
    if([dict[@"cellStyle"] isEqualToString:value1Identifier]){
        identifier = value1Identifier;
    }
    else if([dict[@"cellStyle"] isEqualToString:value2Identifier]){
        identifier = value2Identifier;
    }
    else if([dict[@"cellStyle"] isEqualToString:subtitleIdentifier]){
        identifier = subtitleIdentifier;
    }
    SCSettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[SCSettingsTableViewCell alloc]initWithStyle:[self loadCellStyleWithItem:dict] reuseIdentifier:identifier];
    }
    return cell;
}
- (void)setDict:(NSDictionary *)dict{
    _dict = dict;
    if(dict[@"icon"] != nil && [dict[@"icon"] length] > 0){
        self.imageView.image =[UIImage imageNamed:dict[@"icon"]];
    }
    if(dict[@"title"] != nil && [dict[@"title"] length] > 0){
        self.textLabel.text = dict[@"title"];
    }
    if(dict[@"subtitle"] != nil && [dict[@"subtitle"] length] > 0){
        self.detailTextLabel.text = dict[@"subtitle"];
    }
    if(dict[@"detailTextInRed"] != nil && dict[@"detailTextInRed"]){
        self.detailTextLabel.textColor = [UIColor redColor];
    }
    if( dict[@"accessoryType"] != nil && [dict[@"accessoryType"] length] > 0){
        NSString *accessoryType = dict[@"accessoryType"];
        Class clz = NSClassFromString(accessoryType);
        UIView *obj =[[clz alloc]init];
        if([obj isKindOfClass:[UIImageView class]]){
            UIImageView *imageView = (UIImageView *)obj;
            imageView.image = [UIImage imageNamed:dict[@"accessoryContent"]];
            [imageView sizeToFit];
        }else if([obj isKindOfClass:[UISwitch class]]){
            UISwitch *switcher = (UISwitch *)obj;
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSInteger status = (NSInteger) [userDefaults valueForKey:dict[@"switchKey"]];
            switcher.on = status;
            [switcher addTarget:self action:@selector(switchStatusListener:) forControlEvents:UIControlEventValueChanged];
        }
        self.accessoryView = obj;
    }
}
-(void)switchStatusListener:(UISwitch *)switcher{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if(switcher.isOn){
        [userDefaults setObject:@1 forKey:self.dict[@"switchKey"]];
    }
    else{
        [userDefaults setObject:@0 forKey:self.dict[@"switchKey"]];
    }
}
+(instancetype)settingsCellWithTableView:(UITableView *)tableView andWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithTableView:tableView andWithDictionary:dict];
}
-(UITableViewCellStyle)loadCellStyleWithItem:(NSDictionary *)dict{
    NSString *itemName = dict[@"cellStyle"];
    if([itemName isEqualToString:@"UITableViewCellStyleSubtitle"]){
        return UITableViewCellStyleSubtitle;
    }else if([itemName isEqualToString:@"UITableViewCellStyleValue1"]){
        return UITableViewCellStyleValue1;
    }
    else if([itemName isEqualToString:@"UITableViewCellStyleValue2"]){
        return UITableViewCellStyleValue2;
    }
    else{
        return UITableViewCellStyleDefault;
    }
}
@end
