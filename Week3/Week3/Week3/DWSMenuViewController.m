//
//  DWSMenuViewController.m
//  Week3
//
//  Created by Daniel Warner Smith on 3/2/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSMenuViewController.h"

@interface DWSMenuViewController ()
@property (nonatomic, strong) UIImageView *menuImageView;
@end

@implementation DWSMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:self.menuImageView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _menuImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _menuImageView.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
