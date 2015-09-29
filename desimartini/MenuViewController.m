//
//  MenuViewController.m
//  desimartini
//
//  Created by Himmat Rana on 24/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = @[@"userinfo",@"home",@"movies",@"martini",@"news"]; //, @"movies", @"martini", @"news"];
    
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
    
}


@end
