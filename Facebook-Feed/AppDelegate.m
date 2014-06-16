//
//  AppDelegate.m
//  Facebook-Feed
//
//  Created by Jairo Avalos on 6/11/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "FeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = loginVC;
  
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
  
    // Create the view controllers, each within a navigation controller
    FeedViewController *feedVC = [[FeedViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:feedVC];
    [navVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"News Feed" image:[[UIImage imageNamed:@"news-feed-unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"news-feed-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
  
    RequestsViewController *requestsVC = [[RequestsViewController alloc] init];
    UINavigationController *requestNavVC = [[UINavigationController alloc] initWithRootViewController:requestsVC];
    [requestNavVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Requests" image:[[UIImage imageNamed:@"requests"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"requests-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
  
  
    MessagesViewController *messagesVC = [[MessagesViewController alloc] init];
    UINavigationController *messagesNavVC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    [messagesNavVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Messages" image:[[UIImage imageNamed:@"messages"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"messages-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];

  
    NotificationsViewController *notificationsVC = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavVC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    [notificationsNavVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Notifications" image:[[UIImage imageNamed:@"notifications"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"notifications-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];

  
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    UINavigationController *moreNavVC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    [moreNavVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"More" image:[[UIImage imageNamed:@"more"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"more-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];

  
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = @[navVC, requestNavVC, messagesNavVC, notificationsNavVC, moreNavVC];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.translucent = NO;
  
    self.window.backgroundColor = [UIColor whiteColor];
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
