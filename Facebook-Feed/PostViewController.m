//
//  PostViewController.m
//  Facebook-Feed
//
//  Created by Jairo Avalos on 6/15/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()
@property (strong, nonatomic) IBOutlet UITextField *postTextField;

@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
  
    self.navigationItem.title = @"Update Status";
  

    // Make keyboard active on load
    [self.postTextField becomeFirstResponder];
    
    // Setting up the cancel button for the post view. NOT WORKING RIGHT NOW
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
    cancelButton.tintColor = [UIColor colorWithRed:93.0/255.0 green:147.0/255.0 blue:252.0/255.0 alpha:1];
    self.navigationItem.leftBarButtonItem = cancelButton;
    cancelButton.action = @selector(dismissPostView);
    
    // Setting up the post button
    UIBarButtonItem *postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStylePlain target:nil action:nil];
    postButton.tintColor = [UIColor lightGrayColor];
    postButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = postButton;
  
}

- (void)dismissPostView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
