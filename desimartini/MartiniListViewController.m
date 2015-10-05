//
//  MartiniListViewController.m
//  desimartini
//
//  Created by Himmat Rana on 30/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "MartiniListViewController.h"
#import <Google/Analytics.h>

@interface MartiniListViewController ()
@property (strong, nonatomic) VCFloatingActionButton *addButton;

@end

@implementation MartiniListViewController
@synthesize addButton;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.martiniList =[[NSMutableArray alloc] init];
    [self getMartiniList];
    self.screenName = @"MartiniShots";
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 20, [UIScreen mainScreen].bounds.size.height - 44 - 20, 44, 44);
    
    addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:self.martiniShotsTable];
    
    //    NSDictionary *optionsDictionary = @{@"fb-icon":@"Facebook",@"twitter-icon":@"Twitter",@"google-icon":@"Google Plus",@"linkedin-icon":@"Linked in"};
    //    addButton.menuItemSet = optionsDictionary;
    
    
    addButton.imageArray = @[@"fb-icon",@"twitter-icon",@"google-icon",@"linkedin-icon"];
    addButton.labelArray = @[@"Facebook",@"Twitter",@"Google Plus",@"Linked in"];
    
    
    
    addButton.hideWhileScrolling = YES;
    addButton.delegate = self;
    [self.view addSubview:addButton];
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [super showNavigationWithTitle:NSLocalizedString(@"Martini Shots", nil)];
    /*id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"MartiniShots"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
     */
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getMartiniList
{
    AFHTTPSessionManager *manager;
    NSURL *baseURL;
    NSString *url;
    if (self.nextURL != nil)
    {
       manager = [[AFHTTPSessionManager alloc] init];
        url = self.nextURL;
    }
    else
    {
       baseURL = [NSURL URLWithString:@"http://staging.desimartini.com"];
       manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
       url = @"/api/news/martini/";
    }
    //NSDictionary *parameters = @{@"format": @"json"};
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
     {
         NSDictionary *data =  (NSDictionary *)responseObject;
         self.nextURL = [data objectForKey:@"next_url"];
         if ([self.nextURL isKindOfClass:[NSNull class]])
         {
             self.nextURL = nil;
         }
         for (NSDictionary *tempData  in [data objectForKey:@"results"])
         {
             [_martiniList addObject:[News getNews:tempData]];
         }
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

-(void)showData{
    

    
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
    self.news = [self.martiniList objectAtIndex:indexPath.row];
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
    
    if (indexPath.row == [self.martiniList count] - 1 && self.nextURL != nil)
    {
        [self getMartiniList];
    }
    
    //[((UIImageView*)[weakCell.contentView viewWithTag:1001]) setImageWithURLString:new.image usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
    //((UILabel*)[cell.contentView viewWithTag:1003]).text = [NSString stringWithFormat:@"%@",newsObj.createdDate];
    //((UILabel*)[cell.contentView viewWithTag:1004]).text = [NSString stringWithFormat:@"%@",newsObj.viewCount ];
    
    
    return cell;
}

-(void) didSelectMenuOptionAtIndex:(NSInteger)row
{
    NSLog(@"Floating action tapped index %tu",row);
}



@end
