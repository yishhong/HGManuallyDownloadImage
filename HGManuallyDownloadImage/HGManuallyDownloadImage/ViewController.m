//
//  ViewController.m
//  HGManuallyDownloadImage
//
//  Created by  易述宏 on 16/7/6.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "QHManuallyDownload.h"

@interface ViewController ()

@property(strong,nonatomic)QHManuallyDownload * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ImageVieChangeStatusTapped];
}

-(void)ImageVieChangeStatusTapped{

    NSLog(@"hello");
    QHManuallyDownload * imageView= [[QHManuallyDownload alloc]initWithFrame:CGRectMake(80, 100, 200, 300)];
    NSString * stringUrl = @"http://e.hiphotos.baidu.com/image/pic/item/9f510fb30f2442a725292060d543ad4bd01302d4.jpg";
    NSURL * imageUrl =[NSURL URLWithString:stringUrl];
    BOOL status =imageView.status;
    NSLog(@"%i",self.imageView.status);
    if (status) {
        [imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@""]];
    }else{
        imageView.image =[UIImage imageNamed:@""];
    }
    [self.view addSubview:imageView];
    __weak typeof(self) weakSelf =self;
    self.imageView.tappedBlock=^(){
        __strong typeof(weakSelf) strongSelf =weakSelf;
        [strongSelf.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@""]];
    };
    
    self.imageView =imageView;

}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
