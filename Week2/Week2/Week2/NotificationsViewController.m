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
#import "DWSNotification.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DWSNotification *notifObject;
@property (strong, nonatomic) NSArray *notifs;

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.notifs = [DWSNotification fakeNotifs];
    //Tell the tableview about the custom cell
    [self.tableView registerClass:[DWSNotificationCell  class]
           forCellReuseIdentifier:@"DWSNotificationCell"];
    
    //Set the right bar button item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ios7_tabbar_moreicon_normal"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onMessagePress:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_white"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onMessagePress:)];
    
#pragma mark - View Styling
    //Style the top Nav
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.navigationItem.titleView = titleLabel;
    titleLabel.text = @"Notifications";
    [titleLabel sizeToFit];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];

    self.tableView.separatorColor = [UIColor clearColor];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 180, 0)];

    
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
    DWSNotification *notification = self.notifs[indexPath.row];
    
    
    NSString *userName = notification.actor;
    NSString *dateLabel = notification.timeStamp;
    NSString *messageLabel = notification.notifMessage;
    UIImage *userImage = notification.userImage;
    UIImage *notifBadge = notification.notifBadge;

    NSString *identifier = @"DWSNotificationCell";
    
    DWSNotificationCell *notificationCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!notificationCell) {
        notificationCell = [[DWSNotificationCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:identifier];
    }
    
    notificationCell.notificationLabel.attributedText = [notification prettyString];
    notificationCell.userNameLabel.text = userName;
    notificationCell.messageLabel.text = messageLabel;
    notificationCell.dateLabel.text = dateLabel;
    notificationCell.userImage.image = userImage;
    notificationCell.notifBadgeImage.image = notifBadge;
    
    //notificationCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return notificationCell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell layoutSubviews];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81;
}

#pragma mark - Private Methods


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    StoryViewController *storyViewController = [[StoryViewController alloc]init];
    storyViewController.storyInfo = [self.notifs objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:storyViewController animated:YES];
}

- (void)onMessagePress:(id)sender {
    
}


@end
