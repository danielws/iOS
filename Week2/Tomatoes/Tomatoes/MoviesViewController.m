//
//  MoviesViewController.m
//  Tomatoes
//
//  Created by Daniel Warner Smith on 2/20/14.
//  Copyright (c) 2014 Daniel Warner Smith. All rights reserved.
//

#import "MoviesViewController.h"
#import "Movie.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *movies;
@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.movies = [[NSMutableArray alloc] init];
        
        Movie *lego = [[Movie alloc] init];
        lego.title = @"The Lego Movie";
        [self.movies addObject:lego];
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

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    Movie *movie = self.movies[indexPath.row];
    cell.textLabel.text = movie.title;
    
    return cell;
}

@end
