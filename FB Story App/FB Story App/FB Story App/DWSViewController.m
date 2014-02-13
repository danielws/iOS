//
//  DWSViewController.m
//  FB Story App
//
//  Created by Daniel Warner Smith on 2/12/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSViewController.h"

@interface DWSViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fieldContainerConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DWSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePostPress:(id)sender {
    self.textField.text = @"";
    [self.textField resignFirstResponder];
}

- (IBAction)handleTapOut:(id)sender {
    [self.textField resignFirstResponder];
}

- (void)handleKeyboardNotification:(NSNotification *)notif
{
    NSLog(@"%@", notif.userInfo);
    [UIView animateWithDuration:[notif.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue]
                          delay:0
                        options:[notif.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]
                     animations:^{
                         CGRect frameEnd = [notif.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
                         CGFloat constraintHeight = self.view.bounds.size.height - frameEnd.origin.y;
                         self.fieldContainerConstraint.constant = constraintHeight;
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.text=@"";
    [textField resignFirstResponder];
    return NO;
}

@end
