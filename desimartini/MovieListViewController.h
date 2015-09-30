//
//  MovieListViewController.h
//  desimartini
//
//  Created by Himmat Rana on 28/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MartiniListViewController.h"
@interface MovieListViewController : BaseViewController
- (IBAction)tempAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
