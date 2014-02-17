//
//  DWSViewController.m
//  MessinAround
//
//  Created by Daniel Warner Smith on 2/13/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSViewController.h"

@interface DWSViewController ()
- (IBAction)onButton:(id)sender; {
    [self sayHello]; //this.sayHello();
}


@end

@implementation DWSViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButton:(id)sender {
}

#pragma mark - Private methods

- (void)sayHello {
    NSLog(@"hello!");
}

-(void)sayMyName:(NSString *)name {
}

@end
