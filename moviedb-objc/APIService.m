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

- (void)getSomeMovies: (void (NSMutableArray*))completionHandler {
    
    NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=0d437200fbd8b26a306c3dc5f9bbbaca&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
//        NSString *auxString = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
//        NSLog(@"%@", auxString);
        
        NSError *err;
        NSArray *parsedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray *array = NSMutableArray.new;
        for (NSDictionary *PopularMovie in parsedData) {
            
        }
        completionHandler(array);
                
        NSLog(@"finished getting movies");
    }] resume];
}



- (void)getPopularMovies: completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/movie/popular?api_key=0d437200fbd8b26a306c3dc5f9bbbaca&language=en-US&page=1"]
      cachePolicy:NSURLRequestUseProtocolCachePolicy
      timeoutInterval:10.0];

    [request setHTTPMethod:@"GET"];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      if (error) {
        NSLog(@"%@", error);
      } else {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        NSLog(@"%@",responseDictionary);
        dispatch_semaphore_signal(sema);
      }
    }];
    [dataTask resume];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
}

@end


