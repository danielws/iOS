//
//  DWSExoBrainViewController.m
//  Animation
//
//  Created by Daniel Warner Smith on 2/27/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "DWSExoBrainViewController.h"
#import <AudioToolbox/AudioServices.h>


@interface DWSExoBrainViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView *nodeView;
@property (nonatomic, strong) UIView *selected;
@property (nonatomic, assign) int viewCount;
@property (nonatomic, strong) NSMutableDictionary *longPresses;
@property (nonatomic, strong) NSMutableDictionary *pans;

@property (nonatomic, assign) SystemSoundID liftSound;
@property (nonatomic, assign) SystemSoundID dropSound;
@property (nonatomic,assign) SystemSoundID initSound;


- (void)onNodeTap:(UITapGestureRecognizer *)tapGestureRecognizer;
- (void)onNodeLongPress:(UILongPressGestureRecognizer *)longPressGestureRecognizer;
- (void)onPan:(UIPanGestureRecognizer *)peterPanGestureRecognizer;
@end

@implementation DWSExoBrainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.nodeView = [[UIView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onNodeTap:)];

	self.view.backgroundColor = [UIColor blueColor];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    self.longPresses = [NSMutableDictionary dictionary];
    self.pans = [NSMutableDictionary dictionary];
    
    NSString* str =  [[NSBundle mainBundle] pathForResource:@"lift" ofType:@"wav"];
    CFURLRef soundFileURL = (__bridge CFURLRef)[NSURL fileURLWithPath:str ];
    OSStatus errorCode = AudioServicesCreateSystemSoundID(soundFileURL, &_liftSound);
    
    str =  [[NSBundle mainBundle] pathForResource:@"drop" ofType:@"wav"];
    soundFileURL = (__bridge CFURLRef)[NSURL fileURLWithPath:str ];
    errorCode = AudioServicesCreateSystemSoundID(soundFileURL, &_dropSound);
    
    str =  [[NSBundle mainBundle] pathForResource:@"init" ofType:@"wav"];
    soundFileURL = (__bridge CFURLRef)[NSURL fileURLWithPath:str ];
    errorCode = AudioServicesCreateSystemSoundID(soundFileURL, &_initSound);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onNodeTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    AudioServicesPlaySystemSound(self.initSound);
    self.viewCount++;
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    UIView *newNode = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    newNode.center = point;
    newNode.backgroundColor = [UIColor brownColor];
    newNode.tag = self.viewCount;
    
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onNodeLongPress:)];
    UIPanGestureRecognizer *peterPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [newNode addGestureRecognizer:peterPanGestureRecognizer];
    [newNode addGestureRecognizer:longPressGestureRecognizer];
    
    self.longPresses[@(self.viewCount)] = longPressGestureRecognizer;
    self.pans[@(self.viewCount)] = peterPanGestureRecognizer;
    
    peterPanGestureRecognizer.delegate = self;
    longPressGestureRecognizer.delegate = self;
    
    [self.view addSubview:newNode];
}

- (void)onNodeLongPress:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    
    if (CGAffineTransformIsIdentity(longPressGestureRecognizer.view.transform)) {
        AudioServicesPlaySystemSound(self.liftSound);
        [UIView animateWithDuration:0.25 animations:^{
            longPressGestureRecognizer.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }
    
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.25 animations:^{
            longPressGestureRecognizer.view.transform = CGAffineTransformIdentity;
        }
        
         completion:^(BOOL finished) {
             AudioServicesPlaySystemSound(self.dropSound);
         }];
    }
}

- (void)onPan:(UIPanGestureRecognizer *)peterPanGestureRecognizer {
    UIView *view = peterPanGestureRecognizer.view;
    UILongPressGestureRecognizer *viewsLongPress = self.longPresses[@(view.tag)];

    if (viewsLongPress.state != UIGestureRecognizerStateChanged) {
        return;
    }
    
    peterPanGestureRecognizer.view.center = [peterPanGestureRecognizer locationInView:self.view];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] ||
        [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) return NO;
    
    return YES;
}

@end
