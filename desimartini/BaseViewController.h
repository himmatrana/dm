//
//  BaseViewController.h
//  desimartini
//
//  Created by Himmat Rana on 24/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/Analytics.h>

@interface BaseViewController : GAITrackedViewController //UIViewController
-(void) showNavigationWithTitle:(NSString *)title;
@end
