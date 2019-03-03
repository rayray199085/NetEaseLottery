//
//  SCLiveResultTableViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCLiveResultTableViewController.h"
#import "UIView+SCFrame.h"

@interface SCLiveResultTableViewController ()
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIToolbar *toolbar;
@property(nonatomic,weak)UITableViewCell *selectedCell;
@end

@implementation SCLiveResultTableViewController
- (UIToolbar *)toolbar{
    if(_toolbar == nil){
        _toolbar = [[UIToolbar alloc]init];
        _toolbar.height = 44;
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSelectedTime)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc]initWithTitle:@"Confirm" style:UIBarButtonItemStylePlain target:self action:@selector(saveSelectedTime)];
        _toolbar.items = @[cancel,space,confirm];
    }
    return _toolbar;
}
-(void)saveSelectedTime{
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    self.selectedCell.detailTextLabel.text = time;
    [self hideDatePicker];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    switch (indexPath.section) {
        case 1:
            [userDefaults setObject:time forKey:@"startTime"];
            break;
        case 2:
            [userDefaults setObject:time forKey:@"endTime"];
            break;
    }
}
-(void)cancelSelectedTime{
    [self hideDatePicker];
}
-(void)hideDatePicker{
    [self.view endEditing:YES];
}
- (UIDatePicker *)datePicker{
    if(_datePicker ==nil){
        _datePicker = [[UIDatePicker alloc]init];
        [_datePicker setLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
        _datePicker.datePickerMode = UIDatePickerModeTime;
    }
    return _datePicker;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *startTime = [userDefaults valueForKey:@"startTime"];
    NSString *endTime = [userDefaults valueForKey:@"endTime"];
    
    NSIndexPath *startIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView selectRowAtIndexPath:startIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    UITableViewCell *startCell = [self.tableView cellForRowAtIndexPath:startIndexPath];
    
    if(startTime == nil || [startTime isEqualToString:@""]){
        startCell.detailTextLabel.text = @"00:00";
    }else{
        startCell.detailTextLabel.text = startTime;
    }
    NSIndexPath *endIndexPath = [NSIndexPath indexPathForRow:0 inSection:2];
    [self.tableView selectRowAtIndexPath:endIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    UITableViewCell *endCell = [self.tableView cellForRowAtIndexPath:endIndexPath];
    if(endTime == nil || [endTime isEqualToString:@""]){
        endCell.detailTextLabel.text = @"00:00";
    }else{
        endCell.detailTextLabel.text = endTime;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section > 0){
        UITextField *textField = [[UITextField alloc]init];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.selectedCell = cell;
        textField.inputView = self.datePicker;
        textField.inputAccessoryView = self.toolbar;
        [cell addSubview:textField];
        [textField becomeFirstResponder];
    }
}
@end
