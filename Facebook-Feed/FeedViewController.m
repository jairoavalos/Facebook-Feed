//
//  FeedViewController.m
//  Facebook-Feed
//
//  Created by Jairo Avalos on 6/14/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "FeedViewController.h"
#import "AppDelegate.h"

@interface FeedViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *feedIndicatorView;

//@property (nonatomic, strong) UIActivityIndicatorView *feedIndicatorView;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)loadFeed:(UIImageView*)fbookPostBar {
  // Create feed content
  UIImageView *feedContent = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"feed"]];
  feedContent.frame = CGRectMake(0, 0, feedContent.frame.size.width, feedContent.frame.size.height);
  
  // Create scrollview and add feedcontent to it
  UIScrollView *feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, fbookPostBar.frame.size.height, self.view.frame.size.width, feedContent.frame.size.height - 1)];
  feedScrollView.contentSize = feedContent.frame.size;
  [feedScrollView addSubview:feedContent];
  [self.view addSubview:feedScrollView];
  
  [self.feedIndicatorView stopAnimating];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:100.0/255.0 blue:161.0/255.0 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.navigationItem.title = @"News Feed";
  
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"search-icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
  
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"people-icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
  
    // Add Facebook post bar
    UIImageView *fbookPostBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"status_bar"]];
    CGRect postBarFrame = CGRectMake(0, 0, fbookPostBar.frame.size.width, fbookPostBar.frame.size.height);
    fbookPostBar.frame = postBarFrame;
    [self.view addSubview:fbookPostBar];
  
  
    [self.feedIndicatorView startAnimating];
    // Delay loading for 2 seconds, then show feed
    NSTimeInterval loginDelay = 2;
    [self performSelector:@selector(loadFeed:) withObject:fbookPostBar  afterDelay:loginDelay];

  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
