//
//  QHManuallyDownload.h
//  千惠电商
//
//  Created by  易述宏 on 16/7/1.
//  Copyright © 2016年 hunanqinengkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworkReachabilityManager.h"


typedef void(^ManuallyDownloadImage)();

@interface QHManuallyDownload : UIImageView

@property(strong,nonatomic)UIButton * downloadButton;

@property(strong,nonatomic)ManuallyDownloadImage tappedBlock;


@property(assign,nonatomic)BOOL status;

@end
