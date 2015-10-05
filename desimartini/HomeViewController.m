//
//  HomeViewController.m
//  desimartini
//
//  Created by Himmat Rana on 24/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "MartiniListViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"Home";
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super showNavigationWithTitle:@"Home"];
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

- (IBAction)check:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MartiniListViewController *object = [storyboard instantiateViewControllerWithIdentifier:@"martini_listing"];
    
    [self.navigationController pushViewController:object animated:YES];
    
    
    
}
@end
