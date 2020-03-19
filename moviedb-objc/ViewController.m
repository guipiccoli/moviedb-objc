//
//  ViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "ViewController.h"
#import "APIService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APIService* service = APIService.new;
//    void(^teste)(NSMutableArray<Movie *>*) = ^void(NSMutableArray<Movie *> *movies) {
//        NSLog(@"funcionou");
//        return;
//    };
    NSArray *array = @[@12, @16, @28];
    [service getMoviesGenres:^(NSString *genres) {
        NSLog(genres);
    } movieIDs: array];
    
//    [service getPopularMovies:^(NSMutableArray<Movie *> *movies) {
//        NSLog(movies[0].name);
//        return;
//    }];
//    [service getNowPlayingMovies:^(NSMutableArray<Movie *> *movies) {
//        NSLog(movies[0].name);
//        return;
//    }];
}

@end
