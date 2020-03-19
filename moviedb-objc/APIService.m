//
//  APIService.m
//  moviedb-objc
//
//  Created by Fernando Locatelli Maioli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIService.h"

@interface APIService ()

@end

@implementation APIService

- (void)getPopularMovies: (void (NSMutableArray *))completionHandler {
    
    NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=0d437200fbd8b26a306c3dc5f9bbbaca&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
//        NSString *auxString = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
//        NSLog(@"%@", auxString);
        
        NSError *err;
        NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray<Movie *> *array = NSMutableArray.new;
        for (NSDictionary *popularMovie in parsedData[@"results"]) {
            Movie *movieAux = Movie.new;
            
            movieAux.name = popularMovie[@"original_title"];
            movieAux.descriptiton = popularMovie[@"overview"];
            movieAux.rating = popularMovie[@"vote_average"];
            movieAux.image = popularMovie[@"poster_path"];
            movieAux.genres = @"";
            [array addObject:movieAux];
        }
        
        if (completionHandler) {
            completionHandler(array);
        }
        NSLog(@"finished getting movies");
    }] resume];
}

@end


