//
//  AppDelegate+HGNetWorkStatusChange.m
//  HGManuallyDownloadImage
//
//  Created by  易述宏 on 16/7/7.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "AppDelegate+HGNetWorkStatusChange.h"
#import "AFNetworkReachabilityManager.h"

@implementation AppDelegate (HGNetWorkStatusChange)

-(void)netWorkStatusChange{
    
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2/G3/G4/G");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                break;
                
            default:
                break;
        }
        
    }];
}

@end
