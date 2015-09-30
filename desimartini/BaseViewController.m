//
//  BaseViewController.m
//  desimartini
//
//  Created by Himmat Rana on 24/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "BaseViewController.h"
#import "SWRevealViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.navigationController.navigationBar.barTintColor = [UIColor brownColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(229/255.0) green:(52/255.0) blue:(51/255.0) alpha:1.0];
    
    
    
}

-(void)showNavigationWithTitle:(NSString *)title{
    
    /*UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:(229/255.0) green:(52/255.0) blue:(51/255.0) alpha:1.0];
    [self.view addSubview:myNav];
    */
    
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:title];
    UIImage *menuImage = [UIImage imageNamed:@"menu"];
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [menuButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
       
    }
    
    
    
    
    //[menuButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [menuButton setImage:menuImage forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 33, 40);
    
    UIView *leftItemsView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 40)];
    leftItemsView.backgroundColor = [UIColor clearColor];
    [leftItemsView addSubview:menuButton];
    
    //if (((UserDetail*)[UserDetail sharedManager]).userId) {
    //[leftItemsView addSubview:notificationButton];
    //[leftItemsView addSubview:notificationArrow];
    //[leftItemsView addSubview:notificationCountLabel];
    //}
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftItemsView];
    //self.navigationController.navigationBar.lef
    
    navigItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationController.navigationBar.items = [NSArray arrayWithObjects: navigItem,nil];
    
    
    /*UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:nil];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self action:nil];
    

    navigItem.rightBarButtonItem = doneItem;
    navigItem.leftBarButtonItem = cancelItem;
    myNav.items = [NSArray arrayWithObjects: navigItem,nil];
    
    [UIBarButtonItem appearance].tintColor = [UIColor blueColor];
     */
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
