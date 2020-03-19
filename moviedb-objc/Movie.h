//
//  Movie.h
//  moviedb-objc
//
//  Created by Fernando Locatelli Maioli on 18/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *descriptiton;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *genres;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *overview;

@end

NS_ASSUME_NONNULL_END
