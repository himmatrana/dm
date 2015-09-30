//
//  MartiniListViewController.m
//  desimartini
//
//  Created by Himmat Rana on 30/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "MartiniListViewController.h"

@interface MartiniListViewController ()

@end

@implementation MartiniListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated
{
    //[super viewDidAppear:animated];
    [super showNavigationWithTitle:@"Martini Shots"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
