//
//  ViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "ViewController.h"
#import "MovieCell.h"

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
    
    self.navigationItem.title = @"Movies";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *) [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.movieImage.image = [UIImage imageNamed: @"List"];
    cell.movieRating.text = @"5";
    cell.movieDescription = [moviesDesc objectAtIndex:indexPath.row];
    cell.movieTitle = [movies objectAtIndex:indexPath.row];

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


@end
