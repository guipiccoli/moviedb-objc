//
//  ViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "ViewController.h"
#import "MovieDetailViewController.h"
#import "MovieCell.h"
#import "APIService.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property NSMutableArray<Movie*> *moviesNowPlaying;
@property NSMutableArray<Movie*> *moviesPopular;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.moviesPopular = NSMutableArray.new;
    self.moviesNowPlaying = NSMutableArray.new;

    APIService *service = APIService.new;
        [service getPopularMovies:^(NSMutableArray<Movie *> *movies) {
            self.moviesPopular = movies;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
            return;
        }];
        [service getNowPlayingMovies:^(NSMutableArray<Movie *> *movies) {
            self.moviesNowPlaying = movies;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                    
                [self.tableView reloadData];
            });
            return;
        }];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *) [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0 ) {
        Movie *moviePopular = self.moviesPopular[indexPath.row];
        
        cell.movieTitle.text = moviePopular.name;
        cell.movieRating.text = [NSString stringWithFormat:@"%@", moviePopular.rating];
        cell.movieDescription.text = moviePopular.descriptiton;
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500/%@", moviePopular.image]]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageView.image = [UIImage imageWithData: data];
            });
        });
    }

    else if (indexPath.section == 1) {
        Movie *movieNowPlaying = self.moviesNowPlaying[indexPath.row];
        
        cell.movieTitle.text = movieNowPlaying.name;
        cell.movieRating.text = [NSString stringWithFormat:@"%@", movieNowPlaying.rating];
        cell.movieDescription.text = movieNowPlaying.descriptiton;
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500/%@", movieNowPlaying.image]]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageView.image = [UIImage imageWithData: data];
            });
        });
    }

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _moviesPopular.count;
    }
    else {
        return _moviesNowPlaying.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Popular Movies";
    }
    else {
        return @"Now playing";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieDetailViewController *movieDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"DescriptionViewController"];
    
    Movie *movie = Movie.new;
    if (indexPath.section == 0) {
        movie = _moviesPopular[indexPath.row];
    }
    else if (indexPath.section == 1) {
        movie = _moviesNowPlaying[indexPath.row];
    }
    
    movieDetail.titleMovie = movie.name;
    movieDetail.description = movie.descriptiton;
    movieDetail.image = movie.image;
    movieDetail.genres = movie.genres;
    movieDetail.rating = movie.rating;
    
    
    [self.navigationController pushViewController:movieDetail animated:YES];
}

@end
