//
//  TabbarController.m
//  WeChat
//
//  Created by 郭达 on 2017/5/16.
//  Copyright © 2017年 Guoda. All rights reserved.
//

#import "TabbarController.h"
#import "MeViewController.h"
#import "DiscoverViewController.h"
#import "ContactsViewController.h"
#import "MainViewController.h"
#import "Define.h"
@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MainViewController *mainvc = [[MainViewController alloc] init];
//    UINavigationController *navmain = [[UINavigationController alloc] initWithRootViewController:mainvc];
//    mainvc.title = @"微信";
//    mainvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
//    [mainvc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar_mainframeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//选中图片
    [self setupTabbarWithController:mainvc title:@"微信" image:@"tabbar_mainframe" SelectImg:@"tabbar_mainframeHL"];
    
    ContactsViewController *contactvc = [[ContactsViewController alloc] init];
//    UINavigationController *navcontact = [[UINavigationController alloc] initWithRootViewController:contactvc];
//    contactvc.title = @"联系人";
//    contactvc.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
//    [contactvc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar_contactsHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//选中图片
    [self setupTabbarWithController:contactvc title:@"联系人" image:@"tabbar_contacts" SelectImg:@"tabbar_contactsHL"];

    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self setupTabbarWithController:discover title:@"发现" image:@"tabbar_discover" SelectImg:@"tabbar_discoverHL"];
    
    MeViewController *me = [[MeViewController alloc] init];
    [self setupTabbarWithController:me title:@"我的" image:@"tabbar_me" SelectImg:@"tabbar_meHL"];
    
    
//    self.viewControllers = @[navmain,navcontact];
    
    self.tabBar.tintColor = [UIColor colorWithRed:0/255.0 green:185/255.0 blue:25/255.0 alpha:1];
}
- (void)setupTabbarWithController:(UIViewController*)vc title:(NSString*)title image:(NSString*)image SelectImg:(NSString*)selectimg {
    
    UINavigationController *navcontact = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectimg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];//选中图片
    [self addChildViewController:navcontact];
    
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
