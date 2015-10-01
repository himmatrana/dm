//
//  News.h
//  desimartini
//
//  Created by Himmat Rana on 30/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic,retain) NSString *ID;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *video;
@property (nonatomic) short category;
@property (nonatomic) short region;
@property (nonatomic, retain) NSString *createdDate;
@property (nonatomic, retain) NSString *viewCount;
@property (nonatomic, retain) NSMutableArray *relatedNews;
@property (nonatomic, retain) NSArray *linkTags;
@property (nonatomic, retain) NSMutableArray *textTags;
@property (nonatomic, retain) NSMutableArray *friendsData;
@property (nonatomic, retain) NSString *url;

+(News *) getNews:(NSDictionary *)temp;

@end
