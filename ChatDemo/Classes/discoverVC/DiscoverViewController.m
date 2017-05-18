//
//  DiscoverViewController.m
//  WeChat
//
//  Created by 郭达 on 2017/5/16.
//  Copyright © 2017年 Guoda. All rights reserved.
//

#import "DiscoverViewController.h"
#import "Define.h"
#import "UIImage+Scale.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(discoverNotificationChangeBackground:) name:Notification_discover  object:nil];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.imageView = [[UIImageView alloc] init];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:DiscoverImg_path];
    if (image) {
//        UIImage *newImage = [UIImage wechatScaleImg:image];
//        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, newImage.size.height);
//        self.imageView.image = newImage;
//        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, newImage.size.height);
        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, image.size.height*SCREENWIDTH/image.size.width);
        self.imageView.image = image;
        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, self.imageView.bounds.size.height);
    }
    [self.scrollView addSubview:self.imageView];
    [self.view addSubview:self.scrollView];

}
- (void)discoverNotificationChangeBackground:(NSNotification*)noti {
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:DiscoverImg_path];
    if (image) {
//        UIImage *newImage = [UIImage wechatScaleImg:image];
//        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, newImage.size.height);
//        self.imageView.image = newImage;
//        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, newImage.size.height);
        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, image.size.height*SCREENWIDTH/image.size.width);
        self.imageView.image = image;
        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, self.imageView.bounds.size.height);
    }


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
