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

@end

@implementation ViewController

NSArray *movies;
NSArray *moviesDesc;

- (void)viewDidLoad {
    [super viewDidLoad];
    movies= @[@"Filme 1", @"Filme 2", @"Filme 3"];
    moviesDesc= @[@"Filme 1 v moisvdmios msoi os siofn inusnf indfnidf indv insf niussonidsnm so smod mods nisnid s", @"Filme 2 moadsimoavmoisd imo moi omisf mofd oiddmoif dfmoi dmio", @"Filme 3 msaodvomsvmois miod moisf mos msim s nsm sm i mis nisdnisidnsn"];
    
        APIService* service = APIService.new;

        
        [service getPopularMovies:^(NSMutableArray<Movie *> *movies) {
            NSLog(@"funcionou");
    //        return;
        }];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *) [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *movieTitle = movies[indexPath.row];
    NSString *movieDesc = moviesDesc[indexPath.row];

    
    if (indexPath.section == 0 ) {
        cell.movieImage.image = [UIImage imageNamed: @"List"];
        cell.movieRating.text = @"5";
        cell.movieDescription.text = movieDesc;
        cell.movieTitle.text = movieTitle;
    }
    else {
        cell.movieImage.image = [UIImage imageNamed: @"List"];
        cell.movieRating.text = @"0";
        cell.movieDescription.text = movieDesc;
        cell.movieTitle.text = movieTitle;
    }

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    else {
        return 1;
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
    
    MovieDetailViewController *desc = [self.storyboard instantiateViewControllerWithIdentifier:@"DescriptionViewController"];
    [self.navigationController pushViewController:desc animated:YES];
    
}

@end
