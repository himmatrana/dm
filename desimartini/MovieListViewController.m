//
//  MovieListViewController.m
//  desimartini
//
//  Created by Himmat Rana on 28/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "MovieListViewController.h"
#import "SWRevealViewController.h"

@interface MovieListViewController ()

@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super showNavigationWithTitle:@"Movies"];
    
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

- (IBAction)tempAction:(UIButton *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MartiniListViewController *object = [storyboard instantiateViewControllerWithIdentifier:@"martini_listing"];
    
    [self.navigationController pushViewController:object animated:YES];
    //[self.navigationController pushViewController: animated:<#(BOOL)#>]
}
@end
