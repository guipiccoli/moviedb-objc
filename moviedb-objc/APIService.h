//
//  APIService.h
//  moviedb-objc
//
//  Created by Fernando Locatelli Maioli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject

typedef void (ˆHandler) (NSMutableArray *movies);
- (void)getSomeMovies: (void (NSMutableArray*))completionHandler;

@end
