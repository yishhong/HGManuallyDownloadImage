//
//  NetworkReachability.m
//  HGManuallyDownloadImage
//
//  Created by  易述宏 on 16/7/6.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "NetworkReachability.h"
#import "AFNetworkReachabilityManager.h"
#import <objc/runtime.h>


@implementation NetworkReachability

+(instancetype)sharedinstance{
    
    static NetworkReachability * sharedinstance =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedinstance =[[self alloc]init];
    });
    return sharedinstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self statuesChange];
    }
    return self;
}

-(void)netStatusChange:(AFNetworkReachabilityStatus)status{

    switch (status) {
        case AFNetworkReachabilityStatusUnknown:
        case AFNetworkReachabilityStatusNotReachable:
        case AFNetworkReachabilityStatusReachableViaWWAN:
            NSLog(@"没有网络");
            _status = NO;
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            NSLog(@"WiFi");
            _status = YES;
        default:
            break;
    }
}

-(void)statuesChange{
    
    AFNetworkReachabilityManager * manager =[AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"没有网络");
                _status = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                _status = YES;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}
@end
