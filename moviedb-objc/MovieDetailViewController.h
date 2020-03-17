//
//  MovieDetailViewController.h
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 17/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieDetailViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *movieDescription;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieGenres;

@end

NS_ASSUME_NONNULL_END
