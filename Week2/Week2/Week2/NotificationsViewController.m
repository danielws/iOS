//
//  NotificationsViewController.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/19/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "NotificationsViewController.h"
#import "StoryViewController.h"
#import "DWSNotificationCell.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *notifs;

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.notifs = @[
                        @{ @"name" : @"Ben",
                        @"message" : @"Yo dawg you got a comment on your stuff.",
                           @"time" : @"12:00pm" },
                        @{ @"name" : @"Bob",
                        @"message" : @"Another message for you",
                           @"time" : @"1:00pm" }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
    //Tell the tableview about the custom cell
    [self.tableView registerClass:[DWSNotificationCell  class]
           forCellReuseIdentifier:@"DWSNotificationCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notifs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *notification = self.notifs[indexPath.row];
    
    NSString *userName = notification[@"name"];
    NSString *dateLabel = notification[@"time"];
    NSString *messageLabel = notification[@"message"];
    
    DWSNotificationCell *notificationCell = [tableView dequeueReusableCellWithIdentifier:@"DWSNotificationCell"];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:nil];
    notificationCell.userNameLabel.text = userName;
    notificationCell.messageLabel.text = messageLabel;
    notificationCell.dateLabel.text = dateLabel;
    
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    cell.textLabel.text = @"hello";
    
    return notificationCell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Private Methods
- (IBAction)onTap:(id)sender {
    StoryViewController *storyViewController = [[StoryViewController alloc]init];
    [self.navigationController pushViewController:storyViewController animated:YES];
}

@end
