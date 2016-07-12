//
//  NetworkReachability.h
//  HGManuallyDownloadImage
//
//  Created by  易述宏 on 16/7/6.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"


@interface NetworkReachability : NSObject

+(instancetype)sharedinstance;

@property (nonatomic , readonly, assign) BOOL status;

-(void)netStatusChange:(AFNetworkReachabilityStatus)status;

@end
