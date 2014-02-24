//
//  DWSAppDelegate.m
//  Week2
//
//  Created by Daniel Warner Smith on 2/19/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSAppDelegate.h"
#import "StoryViewController.h"
#import "NotificationsViewController.h"
#import "FeedStoryViewController.h"

@implementation DWSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Set white status bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Instatiate the NotificationsViewController
    NotificationsViewController *notificationsViewController = [[NotificationsViewController alloc] init];
    notificationsViewController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_notificationsicon_normal"];
    notificationsViewController.tabBarItem.title = @"Notifications";
    
    //Instatiate the StoryViewController
    //StoryViewController *storyViewController = [[StoryViewController alloc] init];
   // storyViewController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_feedicon_normal"];
    
    FeedStoryViewController *feedStoryViewController = [[FeedStoryViewController alloc] init];
    feedStoryViewController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_feedicon_normal"];
    feedStoryViewController.tabBarItem.title = @"Newsfeed";
    feedStoryViewController.view.backgroundColor = [UIColor colorWithRed:0.827 green:0.839 blue:0.859 alpha:1];


    //Instatiate the NaviagtionController with the NotificationsViewController as the RootViewController
    UINavigationController *notificationsNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationsViewController];

    //Instantiate the Navigation controller for the FeedView
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedStoryViewController];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNavigationController, notificationsNavigationController];
    //Kick off the party: Set the rootViewController of the app window as the tabBarController
    self.window.rootViewController = tabBarController;
    
    
    //Style the navBar
    notificationsNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(0.255) green:(0.373) blue:(0.612) alpha:(1)];
    notificationsNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    notificationsNavigationController.navigationBar.translucent = NO;
    
    feedNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:(0.255) green:(0.373) blue:(0.612) alpha:(1)];
    feedNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    feedNavigationController.navigationBar.translucent = NO;
    
    //Style the tabBar
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.tintColor = [UIColor colorWithRed:(0.278) green:(0.486) blue:(0.902) alpha:(1)];
    [self.window makeKeyAndVisible];
    return YES;
    
    

}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
