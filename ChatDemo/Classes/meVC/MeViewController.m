//
//  MeViewController.m
//  WeChat
//
//  Created by 郭达 on 2017/5/16.
//  Copyright © 2017年 Guoda. All rights reserved.
//

#import "MeViewController.h"
#import<AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import<AssetsLibrary/AssetsLibrary.h>
#import "Define.h"
#import "UIImage+Scale.h"

typedef NS_ENUM(NSInteger,SelectIndex) {
    SelectIndex_Mian=100,
    SelectIndex_Contact,
    SelectIndex_Discover,
    SelectIndex_Me
};

@interface MeViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    //    UIImagePickerController *picker;
    
    UIView *backBtnView;
    NSInteger buttonTagIndex;
    
}
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(meNotificationChangeBackground:) name:Notification_Me  object:nil];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.imageView = [[UIImageView alloc] init];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:MeImg_path];
    if (image) {
//        UIImage *newImage = [UIImage wechatScaleImg:image];
//        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, newImage.size.height);
//        self.imageView.image = newImage;
//        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, newImage.size.height+120);
        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, image.size.height*SCREENWIDTH/image.size.width);
        self.imageView.image = image;
        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, self.imageView.bounds.size.height+120);
    }
    [self.scrollView addSubview:self.imageView];
    [self.view addSubview:self.scrollView];

    buttonTagIndex = 0;
    [self createBackView];
}

- (void)meNotificationChangeBackground:(NSNotification*)noti {
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:MeImg_path];
    if (image) {
//        UIImage *newImage = [UIImage wechatScaleImg:image];
//        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, newImage.size.height);
//        self.imageView.image = newImage;
//        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, newImage.size.height+120);
        self.imageView.frame = CGRectMake(0, 0, SCREENWIDTH, image.size.height*SCREENWIDTH/image.size.width);
        self.imageView.image = image;
        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, self.imageView.bounds.size.height+120);
        
        backBtnView.frame = CGRectMake(0, self.imageView.bounds.size.height+10, SCREENWIDTH, 100);
    }


}
- (void)createBackView {
    
    backBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, self.imageView.bounds.size.height+10, SCREENWIDTH, 100)];
    [self.scrollView addSubview:backBtnView];
    NSArray *titleArray = @[@"微信",@"联系人",@"发现",@"我的"];
    float x = (SCREENWIDTH-200)/3,y=0;
    for (int i=0; i<4; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, 100, 45);
        button.layer.cornerRadius = 5;
        button.clipsToBounds = YES;
        button.layer.borderColor = [UIColor blueColor].CGColor;
        button.layer.borderWidth = 2;
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(openPhoto:) forControlEvents:UIControlEventTouchUpInside];
        [backBtnView addSubview:button];
        
        if (i==1) {
            x = (SCREENWIDTH-200)/3,y=55;
        }else{
            x =x*2 + 100;
        }
        
        
    }
    
}

- (void)openPhoto:(UIButton*)sender {
    
    buttonTagIndex = sender.tag;
    //相册是可以用模拟器打开的
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author ==ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
        //无权限 引导去开启
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
        return;
        
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        picker.delegate = self;
        
        picker.allowsEditing = YES;
        
        //打开相册选择照片
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }
    
}
//实现图片选择器代理

//参数：图片选择器  字典参数

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //通过key值获取到图片
    
    UIImage * image =info[UIImagePickerControllerOriginalImage];
    
//    NSLog(@"image=%@  info=%@",image, info);
    
    if (image) {
        
        NSString *savePath;
        switch (buttonTagIndex) {
            case SelectIndex_Mian:
            {
                savePath = MainImg_path;
            }
                break;
            case SelectIndex_Contact:
            {
                savePath =ContactImg_path;
            }
                break;
            case SelectIndex_Discover:
            {
                savePath =DiscoverImg_path;
            }
                break;
            case SelectIndex_Me:
            {
                savePath = MeImg_path;
            }
                break;
                
            default:
                break;
        }
        [[NSFileManager defaultManager] removeItemAtPath:savePath error:nil];
        BOOL result =[UIImagePNGRepresentation(image) writeToFile:savePath  atomically:YES]; // 保存成功会返回YES
        NSLog(@"result = %d",result);
        switch (buttonTagIndex) {
            case SelectIndex_Mian:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:Notification_main object:nil];
            }
                break;
            case SelectIndex_Contact:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:Notification_contacts object:nil];
            }
                break;
            case SelectIndex_Discover:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:Notification_discover object:nil];
            }
                break;
            case SelectIndex_Me:
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Me object:nil];
            }
                break;
                
            default:
                break;
        }

    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return;
    //判断数据源类型
#if 0
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        
        
        
        //设置图片背景
        
        //        [userIconBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        
        NSData* imgData = UIImageJPEGRepresentation(image, 1);
        
        //        isPhotoChoose = YES;
        
        NSLog(@"第一次调用这个方法");
        
        [user setObject:imgData forKey:@"saveIcon"];
        
        [user synchronize];
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        
        NSLog(@"在相机中选择图片");
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
        
        
        //设置图片背景
        
        //        [userIconBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        
        NSData* imgData = UIImageJPEGRepresentation(image, 1);
        
        //        isPhotoChoose = YES;
        
        NSLog(@"第一次调用这个方法");
        
        [user setObject:imgData forKey:@"saveIcon"];
        
        [user synchronize];
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
#endif
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
