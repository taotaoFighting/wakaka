//
//  AppDelegate.swift
//  wakaka
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        self.window?.backgroundColor = UIColor.white
        
        self.window?.rootViewController = MainTabBarController.init()
        
        self.window?.makeKeyAndVisible()
        
        //注册通知
        if #available(iOS 9.0, *) {
            
            let register = UIUserNotificationSettings(types: [UIUserNotificationType.alert,UIUserNotificationType.badge,UIUserNotificationType.sound], categories: nil)
            
            UIApplication.shared.registerUserNotificationSettings(register)
        }

        
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        print("3D Touch 传过来的值 = ",shortcutItem.type)
        
        var notifitionMsg:String = ""
        
        
        if "1" == shortcutItem.type {
            
            notifitionMsg = notifitionMsg.appending("关关雎鸠，在河之洲。\n窈窕淑女，君子好逑。\n参差荇菜，左右流之。\n窈窕淑女，寤寐求之。\n求之不得，寤寐思服。\n悠哉悠哉，辗转反侧。\n参差荇菜，左右采之。\n窈窕淑女，琴瑟友之。\n参差荇菜，左右芼之。\n窈窕淑女，钟鼓乐之。  --槑")
            
        }else{
            
            notifitionMsg = notifitionMsg.appending("关关和鸣的雎鸠，相伴河中的小洲。\n那美丽贤淑的女子，是君子的好配偶。\n参差不齐的荇菜，从左去捞它。\n那美丽贤淑的女子，醒来睡去都想追求她。\n追求却没法得到，白天黑夜便总思念她。\n长长的思念哟，叫人翻来覆去难睡下。\n参差不齐的荇菜，从左到右去采它。\n那美丽贤淑的女子，奏起琴瑟来亲近她。\n参差不齐的荇菜，从左到右去拔它。\n那美丽贤淑的女子，敲起钟鼓来取悦她。  --槑")
        }
        
        LocalNotifition.addNotification(notificationMsg: notifitionMsg)
        
    }
    
    //收到本地通知 点击通知 走这个方法
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
      print("点击了本地通知")
        
        let alertMsg = notification.alertBody
        
         let alertController:UIAlertController = UIAlertController.init(title: "^_^", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel:UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.default) { (UIAlertAction) in
            
            print("点击取消")
        }
        
        let ok:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default) { (UIAlertAction) in
            
            print("点击确认")
        }
        
        alertController.addAction(cancel)
        
        alertController.addAction(ok)
        
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: {
            
            
        })
        
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

