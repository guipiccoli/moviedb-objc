//
//  ViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

NSArray *movies;

- (void)viewDidLoad {
    [super viewDidLoad];
    movies= @[@"Filme 1", @"Filme 2", @"Filme 3"];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = movies[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


@end
