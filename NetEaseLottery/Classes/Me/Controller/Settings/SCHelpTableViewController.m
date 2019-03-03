//
//  SCHelpTableViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 2/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCHelpTableViewController.h"
#import "SCQuestionItem.h"
#import "SCHelpAnswersViewController.h"
#import "SCNavigationController.h"

@interface SCHelpTableViewController ()
@property(nonatomic,strong)NSArray *quesitions;
@end

@implementation SCHelpTableViewController
- (NSArray *)quesitions{
    if(_quesitions == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tempQuestions = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCQuestionItem *item = [SCQuestionItem questionItemWithDictionary:dict];
            [tempQuestions addObject:item];
        }
        _quesitions = tempQuestions;
    }
    return _quesitions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.quesitions.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCQuestionItem *item = self.quesitions[indexPath.row];
    static NSString *reuseIdentifier = @"question_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = item.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SCHelpAnswersViewController *answersController = [[SCHelpAnswersViewController alloc]init];
    SCQuestionItem *item = self.quesitions[indexPath.row];
    NSString *buttonTitle = @"Back";
    answersController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:buttonTitle style:UIBarButtonItemStylePlain target:self action:@selector(returnToPrevious)];
    answersController.questionItem = item;
    SCNavigationController *sc = [[SCNavigationController alloc]initWithRootViewController:answersController];
    [self presentViewController:sc animated:YES completion:nil];
}
-(void)returnToPrevious{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
