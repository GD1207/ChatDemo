//
//  WeChatViewController.m
//  WeChat
//
//  Created by 郭达 on 2017/5/16.
//  Copyright © 2017年 Guoda. All rights reserved.
//

#import "WeChatViewController.h"
#import "Define.h"
@interface WeChatViewController ()

@end

@implementation WeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
//    52,50,56   46  44 50
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:46/255.0 green:44/255.0 blue:50/255.0 alpha:1];

//    self.navigationController.navigationBar.barTintColor = XUIColor(0x313034, 0.95);

    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

//    UIImage *image = [UIImage imageNamed:@"navback"];
//    UIImage *newImg = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile];
//    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg"] forBarMetrics:2];
    
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
