//
//  DWSViewController.m
//  FB Story App
//
//  Created by Daniel Warner Smith on 2/12/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

// This is the implementation file. This stuff isn't exposed.

//Import all of the files that you want to use in this controller.
#import "DWSViewController.h"
#import <QuartzCore/QuartzCore.h>

// Declare the class interface for DWSViewController.
                                //Adhere to UITextFieldDelegate protocol
@interface DWSViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fieldContainerConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *card;
@property (weak, nonatomic) IBOutlet UIView *cardShadow;
@property (weak, nonatomic) IBOutlet UIImageView *storyImage;
@property (weak, nonatomic) IBOutlet UIView *imageShadow;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *postButton;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;

@end

@implementation DWSViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [self setNeedsStatusBarAppearanceUpdate];
    //GET THE HEIGHT OF THE KEYBOARD
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    //STYLE THE STORY CARD
    //Card View
    //Don't render card outside of the bounds.
    self.card.layer.masksToBounds = YES;
    //Set the corner radius of the card view
    self.card.layer.cornerRadius = 3;
    //Shadow Layer
    //Set the shadow color
    self.cardShadow.layer.shadowColor = [UIColor blackColor].CGColor;
    //Set the shadow offset
    self.cardShadow.layer.shadowOffset = CGSizeMake(0, 1);
    self.cardShadow.layer.shadowOpacity = 0.4;
    self.cardShadow.layer.shadowRadius = 1;
    
    //STYLE THE STORY IMAGE
    //Image View
    //Shadow Layer
    self.imageShadow.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageShadow.layer.shadowOffset = CGSizeMake(0, 1);
    self.imageShadow.layer.shadowOpacity = 0.4;
    self.imageShadow.layer.shadowRadius = 1.5;
    
    //ADD LEFT PADDING TO TEXTFIELD
    //Create a view with the size of the padding we want on the left
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    //Shove it in there
    self.textField.leftView = paddingView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.delegate = self;
    
    self.postButton.enabled = NO;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)handlePostPress:(id)sender {
    self.textField.text = @"";
    self.postButton.enabled = NO;
    [self.textField resignFirstResponder];
}

- (IBAction)handleTapOut:(id)sender {
    [self.textField resignFirstResponder];
}

// Toggle the Like button on and off
- (IBAction)likeButtonToggle:(id)sender {
    if (self.likeButton.selected == YES) {
        self.likeButton.selected = NO;
    }
    else {
        self.likeButton.selected = YES;
    }
}

//Increase or Decrease the Like Count


#pragma mark - Text Field Delegate

// Enable the Post button when text is entered
- (BOOL)textField:(UITextField *)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString *)string {
    NSString *future =
        [(textField.text ?: @"") stringByReplacingCharactersInRange:range
                                                         withString:string];
    self.postButton.enabled = future.length > 0;
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.postButton.enabled = NO;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.text = @"";
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - Notification Handlers

// Variable starts with a "-" to indicate that it's an instance variable
// Method name
// ":" starts the parameter declaration. The parameter type is enclosed in ()
// Multiple prameters look like this: - (void)someMethodWithFirstValue:(SomeType)value1 secondValue:(AnotherType)value2;
// parameter name comes after the ()
- (void)handleKeyboardNotification:(NSNotification *)notif
{
    NSLog(@"%@", notif.userInfo);
    [UIView animateWithDuration:[notif.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue]
                          delay:0
                        options:[notif.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]
                     animations:^{
                         CGRect frameEnd = [notif.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
                         CGFloat constraintHeight = self.view.bounds.size.height - frameEnd.origin.y;
                         self.fieldContainerConstraint.constant = MAX(constraintHeight, 45);
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}


@end
