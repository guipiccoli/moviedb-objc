//
//  MovieDetailViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 17/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MovieDetailViewController
@synthesize movieDescription = _movieDescription;
@synthesize movieRating = _movieRating;
@synthesize movieTitle = _movieTitle;
@synthesize movieImage = _movieImage;
@synthesize movieGenres = _movieGenres;

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 2, 0);
    
}

@end
