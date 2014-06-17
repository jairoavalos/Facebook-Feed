//
//  MoreViewController.m
//  Facebook-Feed
//
//  Created by Jairo Avalos on 6/15/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "MoreViewController.h"
#import "LoginViewController.h"

@interface MoreViewController ()

@property (strong, nonatomic) UIButton *logoutButton;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:100.0/255.0 blue:161.0/255.0 alpha:1];
  self.navigationController.navigationBar.translucent = NO;
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  
  self.navigationItem.title = @"More";
  
  // Configure the left button
  UIImage *leftButtonImage = [[UIImage imageNamed:@"search-icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
  self.navigationItem.leftBarButtonItem = leftButton;
  
  // Configure the right button
  UIImage *rightButtonImage = [[UIImage imageNamed:@"people-icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
  self.navigationItem.rightBarButtonItem = rightButton;
  
  // Create feed content
  UIImageView *feedContent = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"more-feed"]];
  
  // Create scrollview and add feedcontent to it
  UIScrollView *feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, feedContent.frame.size.height - 1)];
  feedScrollView.contentSize = CGSizeMake(feedContent.frame.size.width, 2640);
  [feedScrollView addSubview:feedContent];
  
  
  
  
  // Setting up the logout button to logout of app
  self.logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 1500, self.view.frame.size.width, 45)];
  [self.logoutButton setImage:[UIImage imageNamed:@"highlighted-wide"] forState:UIControlStateHighlighted];
  [feedScrollView addSubview:self.logoutButton];
  [self.logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
  
  
  
  
  [self.view addSubview:feedScrollView];
}

- (void)logout {
  NSLog(@"Logged out");
  LoginViewController *vc = [[LoginViewController alloc] init];
  vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // Rises from below
  
  [self presentViewController:vc animated:YES completion:nil];
  //a[self dismissViewControllerAnimated:YES completion:nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
