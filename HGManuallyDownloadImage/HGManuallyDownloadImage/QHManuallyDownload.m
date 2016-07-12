//
//  QHManuallyDownload.m
//  千惠电商
//
//  Created by  易述宏 on 16/7/1.
//  Copyright © 2016年 hunanqinengkeji. All rights reserved.
//

#import "QHManuallyDownload.h"
#import "AFNetworking.h"
#import "NetworkReachability.h"
#import <objc/runtime.h>
#import "AFNetworkReachabilityManager.h"

@implementation QHManuallyDownload

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    self.userInteractionEnabled =YES;
    [self addSubview:self.downloadButton];
    self.status =[NetworkReachability sharedinstance].status;
    if (self.status) {
        self.downloadButton.hidden =YES;
    }else{
    
        self.downloadButton.hidden =NO;
    }
}

-(UIButton *)downloadButton{

    if (!_downloadButton) {
        _downloadButton =[UIButton buttonWithType:UIButtonTypeCustom];
        _downloadButton.frame =CGRectMake((self.frame.size.width-40)/2, (self.frame.size.height-40)/2, 40, 40);
        _downloadButton.backgroundColor =[UIColor redColor];
        [_downloadButton addTarget:self action:@selector(didTappedDownLoadImage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _downloadButton;
}

-(void)didTappedDownLoadImage{

        if (self.tappedBlock) {
            
            self.tappedBlock();
        }
}

@end
