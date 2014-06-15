//
//  LoginViewController.m
//  Facebook-Feed
//
//  Created by Jairo Avalos on 6/11/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()
// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)checkPassword;
- (IBAction)keyboardDismissed:(id)sender;
- (IBAction)onPasswordType:(id)sender;
- (IBAction)onAttemptLogin:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *loginContainer;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailnumberField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;


@property int origLoginContainerY;
@property int origSignupLabelY;


@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Setting app status bar to white
         [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Get original y position for view to reposition later
    self.origLoginContainerY = self.loginContainer.frame.origin.y;
    self.origSignupLabelY = self.signUpLabel.frame.origin.y;
    
    // Set login button to disable to start
    self.loginButton.userInteractionEnabled = NO;
  
  // Add the indicator view to the screen
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.indicatorView.frame = CGRectMake(250, 212, self.indicatorView.frame.size.width, self.indicatorView.frame.size.height);
    [self.loginContainer addSubview:self.indicatorView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginContainer.frame = CGRectMake(self.loginContainer.frame.origin.x, self.view.frame.size.height - kbSize.height - self.loginContainer.frame.size.height, self.loginContainer.frame.size.width, self.loginContainer.frame.size.height);
                     }
                     completion:nil];
    
    // Move the sign up link
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.view.frame.size.height - kbSize.height - self.signUpLabel.frame.size.height * 2, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the keyboard back
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginContainer.frame = CGRectMake(self.loginContainer.frame.origin.x, self.origLoginContainerY, self.loginContainer.frame.size.width, self.loginContainer.frame.size.height);
                     }
                     completion:nil];
    
    // Move the sign up link back
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.signUpLabel.frame = CGRectMake(self.signUpLabel.frame.origin.x, self.origSignupLabelY, self.signUpLabel.frame.size.width, self.signUpLabel.frame.size.height);
                     }
                     completion:nil];
}


- (void)checkPassword {
    // If the password is correct, allow login
    if ([self.passwordField.text isEqual:@"password"]) {
      
      // Create new feed view and go to it
      AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
      appDelegate.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
      [self presentViewController:appDelegate.tabBarController animated:YES completion:nil];
      
    } else {
      // Otherwise, throw up an alert
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
      [alertView show];
    }
  
    // Stop loading
  [self.loginButton setSelected:NO];
  [self.indicatorView stopAnimating];

}

- (IBAction)keyboardDismissed:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onPasswordType:(id)sender {
    
    // If password and username are entered, allow login
    if (self.emailnumberField.text.length > 0 && self.passwordField.text.length > 0) {
        self.loginButton.userInteractionEnabled = YES;
    }
    
    // If password deleted, do not let button be selectable
    if (self.passwordField.text.length == 0) self.loginButton.userInteractionEnabled = NO;
}

- (IBAction)onAttemptLogin:(id)sender {
    // Show loading state. Change button bg and start indicatorview
    [self.loginButton setSelected:YES];
    [self.indicatorView startAnimating];
  
    // Delay checking for 2 seconds, then check password
    NSTimeInterval loginDelay = 2;
    [self performSelector:@selector(checkPassword) withObject:nil  afterDelay:loginDelay];
}


@end
