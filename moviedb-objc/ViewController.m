//
//  ViewController.m
//  moviedb-objc
//
//  Created by Guilherme Piccoli on 16/03/20.
//  Copyright © 2020 Guilherme Piccoli. All rights reserved.
//

#import "ViewController.h"
#import "APIService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    APIService* service = APIService.new;
//    ˆHandler teste = ˆvoid(NSMutableArray *movies) {
//
//    };
    void(^teste)(NSMutableArray<Movie *>*) = ^void(NSMutableArray<Movie *> *movies) {
        NSLog(@"funcionou");
        return;
    };
    
    [service getSomeMovies:teste];
}

@end
