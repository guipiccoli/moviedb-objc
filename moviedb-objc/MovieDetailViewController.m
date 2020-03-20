//
//  MovieDetailViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 17/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "APIService.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



@end

@implementation MovieDetailViewController
@synthesize movieDescription = _movieDescription;
@synthesize movieRating = _movieRating;
@synthesize movieTitle = _movieTitle;
@synthesize movieImage = _movieImage;
@synthesize movieGenres = _movieGenres;

@synthesize description = _description;
@synthesize rating = _rating;
@synthesize image = _image;
@synthesize titleMovie = _titleMovie;
@synthesize genres = _genres;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    APIService *service = APIService.new;
    
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 2, 0);
    
    self.movieDescription.text = _description;
    self.movieTitle.text = _titleMovie;
    self.movieRating.text = [NSString stringWithFormat:@"%@", _rating];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500/%@", self->_image]]];
        if ( data == nil )
            return;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.movieImage.image = [UIImage imageWithData: data];
        });
    });
    
    [service getMoviesGenres:^(NSString * genres) {
        self.movieGenres.text = genres;
    } movieIDs: _genres];
    
    
}

@end
