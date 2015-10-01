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
    [self showData];
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

-(void)showData{
    
    NSURL *baseURL = [NSURL URLWithString:@"http://staging.desimartini.com"];
    //NSDictionary *parameters = @{@"format": @"json"};
    

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    

    NSLog(@"test");
        [manager GET:@"/api/news/martini/" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
       {
            NSDictionary *data =  (NSDictionary *)responseObject;
            _martiniList = [data objectForKey:@"results"];
            [self.martiniShotsTable reloadData];
        }
        failure:^(NSURLSessionDataTask *task, NSError *error)
        {
           NSLog(@"error");
           /* UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
           */
        }];
}

#pragma mark - UITableView Delegate/Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.martiniList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"martini" forIndexPath: indexPath];
    //News *news = [[News alloc] init];
    NSDictionary *data = [self.martiniList objectAtIndex:indexPath.row];
    NSLog(@"title=%@",[data objectForKey:@"title"]);
    UILabel *title =     ((UILabel*)[cell.contentView viewWithTag:1002]);
    
    
    title.text =  [data objectForKey:@"title"];
    
    //[((UIImageView*)[cell.contentView viewWithTag:1001]) setImageWithURLString:new.image usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    //((UILabel*)[cell.contentView viewWithTag:1003]).text = [NSString stringWithFormat:@"%@",newsObj.createdDate];
    //((UILabel*)[cell.contentView viewWithTag:1004]).text = [NSString stringWithFormat:@"%@",newsObj.viewCount ];
    
    
    return cell;
}



@end
