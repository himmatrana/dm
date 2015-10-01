//
//  MartiniListViewController.h
//  desimartini
//
//  Created by Himmat Rana on 30/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "News.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
@interface MartiniListViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
 @property NSMutableArray *martiniList;
 @property News *news;
 @property NSString *nextURL;
 @property (weak, nonatomic) IBOutlet UITableView *martiniShotsTable;
@end
