//
//  News.m
//  desimartini
//
//  Created by Himmat Rana on 30/09/15.
//  Copyright © 2015 desimartini. All rights reserved.
//

#import "News.h"

@implementation News

+(News *) getNews:(NSDictionary *)news{
    
    News *tempNews = [[News alloc] init];
    tempNews.ID = [news objectForKey:@"id"];
    tempNews.title = [news objectForKey:@"title"];
    tempNews.image = [[[news objectForKey:@"news_thumbnail"] objectForKey:@"image_version2"] objectForKey:@"large"];
    
    return tempNews;
    
}


@end
