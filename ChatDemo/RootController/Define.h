//
//  Define.h
//  WeChat
//
//  Created by 郭达 on 2017/5/16.
//  Copyright © 2017年 Guoda. All rights reserved.
//

#ifndef Define_h
#define Define_h

/**
 *  颜色0x------
 *
 *  @param rgbValue
 *
 *  @return UIColor
 */
#define XUIColor(rgbValue,alp) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alp]

#define XUIImage(X) [UIImage imageNamed:X]

#define Documets_Path ([NSString stringWithFormat:@"%@/Documents/",NSHomeDirectory()])

#define MainImg_path [NSString stringWithFormat:@"%@/main.png",Documets_Path]

#define ContactImg_path [NSString stringWithFormat:@"%@/contact.png",Documets_Path]

#define DiscoverImg_path [NSString stringWithFormat:@"%@/discover.png",Documets_Path]

#define MeImg_path [NSString stringWithFormat:@"%@/me.png",Documets_Path]

/**3
 *  屏幕的大小
 */
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define Notification_main @"Notification_main"

#define Notification_contacts @"Notification_contacts"

#define Notification_discover @"Notification_discover"

#define Notification_Me @"Notification_Me"

#endif /* Define_h */
