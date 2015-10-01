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
    self.news = [[News alloc] init];
    self.news.ID = [data objectForKey:@"id"];
    self.news.title = [data objectForKey:@"title"];
    self.news.image = [[[data objectForKey:@"news_thumbnail"] objectForKey:@"image_version2"] objectForKey:@"large"];
    
    //NSLog(@"title=%@",[data objectForKey:@"title"]);
    __weak UITableViewCell *weakCell = cell;
    __weak UIImageView *martiniImage =     ((UIImageView*)[weakCell.contentView viewWithTag:1001]);
    UILabel *titleLabel =     ((UILabel*)[weakCell.contentView viewWithTag:1002]);

    
    
    titleLabel.text =  self.news.title;
    
    
    
    NSURL *url = [NSURL URLWithString:self.news.image];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"menu"];
    

    
    [martiniImage setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       martiniImage.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    
    //[((UIImageView*)[weakCell.contentView viewWithTag:1001]) setImageWithURLString:new.image usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    //((UILabel*)[cell.contentView viewWithTag:1003]).text = [NSString stringWithFormat:@"%@",newsObj.createdDate];
    //((UILabel*)[cell.contentView viewWithTag:1004]).text = [NSString stringWithFormat:@"%@",newsObj.viewCount ];
    
    
    return cell;
}



@end
