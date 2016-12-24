//
//  LocalNotifition.swift
//  wakaka
//
//  Created by apple on 16/12/23.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class LocalNotifition: NSObject {

    /** 添加创建并添加本地通知 */
    class func addNotification(notificationMsg:String) {
        // 初始化一个通知
        let localNoti = UILocalNotification()
        
        // 通知的触发时间，例如即刻起5秒后
        let fireDate = NSDate().addingTimeInterval(5)
        
        localNoti.fireDate = fireDate as Date
        // 设置时区
        localNoti.timeZone = NSTimeZone.default
        // 通知上显示的主题内容
        localNoti.alertBody = notificationMsg
        // 收到通知时播放的声音，默认消息声音
        localNoti.soundName = UILocalNotificationDefaultSoundName
        //待机界面的滑动动作提示
        localNoti.alertAction = "打开应用"
        // 应用程序图标右上角显示的消息数
        localNoti.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
        // 通知上绑定的其他信息，为键值对
        localNoti.userInfo = ["id": "1",  "name": "槑"]
        
        // 添加通知到系统队列中，系统会在指定的时间触发
        UIApplication.shared.scheduleLocalNotification(localNoti)
    }

    
}
