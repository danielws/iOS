//
//  DWSMenuViewController.m
//  Week 4
//
//  Created by Daniel Warner Smith on 3/9/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSMenuViewController.h"
#import "DWSNewsstandViewController.h"
#import "DWSParentViewController.h"

@interface DWSMenuViewController ()
@property (nonatomic, strong) UIImageView *menuImageView;
@property (nonatomic, strong) UIButton *newsstandButton;

@end

@implementation DWSMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menuImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.menuImageView.image = [UIImage imageNamed:@"menu"];
    [self.view addSubview:self.menuImageView];
    
    self.newsstandButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.newsstandButton addTarget:self.parentViewController
                             action:@selector(edit:)
       forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.newsstandButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _menuImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _menuImageView.backgroundColor = [UIColor yellowColor];
    
    _newsstandButton.frame = CGRectMake(10, 290, 300, 120);
    _newsstandButton.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
