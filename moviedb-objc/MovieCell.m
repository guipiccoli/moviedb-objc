//
//  MovieCell.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

@synthesize movieImage = _movieImage;
@synthesize movieTitle = _movieTitle;
@synthesize movieDescription = _movieDescription;
@synthesize movieRating = _movieRating;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
