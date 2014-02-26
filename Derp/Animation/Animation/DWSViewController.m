//
//  DWSViewController.m
//  Animation
//
//  Created by Daniel Warner Smith on 2/25/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSViewController.h"

@interface DWSViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueSquare;

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goButton:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect endFrame = self.blueSquare.frame;
        endFrame.origin = CGPointMake(endFrame.origin.x + 40, endFrame.origin.y);
        self.blueSquare.frame = endFrame;
    }];
   
}


@end
