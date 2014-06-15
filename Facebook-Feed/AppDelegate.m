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
    navVC.tabBarItem.title = @"News Feed";
    navVC.tabBarItem.image = [UIImage imageNamed:@"news-feed"];
  
    RequestsViewController *requestsVC = [[RequestsViewController alloc] init];
    UINavigationController *requestNavVC = [[UINavigationController alloc] initWithRootViewController:requestsVC];
  UITabBarItem *requestTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Requests" image:[UIImage imageNamed:@"requests"] selectedImage:[UIImage imageNamed:@"requests"]];
  requestsVC.tabBarItem = requestTabBarItem;
    //requestNavVC.tabBarItem.title = @"Requests";
    //requestNavVC.tabBarItem.image = [UIImage imageNamed:@"requests"];
  
    MessagesViewController *messagesVC = [[MessagesViewController alloc] init];
    UINavigationController *messagesNavVC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    messagesNavVC.tabBarItem.title = @"Messages";
    //messagesNavVC.tabBarItem.image = [UIImage imageNamed:@"messages"];
  [messagesNavVC.tabBarItem setImage:[UIImage imageNamed:@"messages"]];
  
    NotificationsViewController *notificationsVC = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavVC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    notificationsNavVC.tabBarItem.title = @"Notifications";
    notificationsNavVC.tabBarItem.image = [UIImage imageNamed:@"notifications"];
  
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    UINavigationController *moreNavVC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    moreNavVC.tabBarItem.title = @"More";
    moreNavVC.tabBarItem.image = [UIImage imageNamed:@"more"];
  
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = @[navVC, requestNavVC, messagesNavVC, notificationsNavVC, moreNavVC];
  self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
  self.tabBarController.tabBar.translucent = NO;
  
    //[[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //[[UITabBar appearance] setTranslucent:NO];

  
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
