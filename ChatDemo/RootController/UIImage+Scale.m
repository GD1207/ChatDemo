//
//  UIImage+Scale.m
//  WeChat
//
//  Created by 郭达 on 2017/5/17.
//  Copyright © 2017年 Guoda. All rights reserved.
//

#import "UIImage+Scale.h"
#import "Define.h"

@implementation UIImage (Scale)


+ (UIImage*)wechatScaleImg:(UIImage *)image{
    
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    CGFloat newWidth = SCREENWIDTH;
    CGFloat newHeight = SCREENWIDTH * height/width;
    
    CGSize targetSize = CGSizeMake(newWidth,newHeight);
    UIGraphicsBeginImageContext(targetSize);
    [image drawInRect:CGRectMake(0,0,newWidth,newHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
