//
//  RequestsViewController.m
//  Facebook-Feed
//
//  Created by Jairo Avalos on 6/15/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "RequestsViewController.h"

@interface RequestsViewController ()

@end

@implementation RequestsViewController

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
  
  // Do any additional setup after loading the view from its nib.
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:68.0/255.0 green:100.0/255.0 blue:161.0/255.0 alpha:1];
  self.navigationController.navigationBar.translucent = NO;
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  
  self.navigationItem.title = @"Requests";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
