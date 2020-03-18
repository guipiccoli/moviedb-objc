//
//  APIService.h
//  moviedb-objc
//
//  Created by Fernando Locatelli Maioli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface APIService : NSObject

- (void)getSomeMovies:(void (^)(NSMutableArray<Movie *>*))completionHandler;

@end
