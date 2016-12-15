//
//  MainTabBarController.swift
//  wakaka
//
//  Created by apple on 16/12/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUptabController()

        // Do any additional setup after loading the view.
    }
    
    //创建分栏控制器内容
    func setUptabController() -> Void {
        
        let firstController = FirstViewController.init()
        
        let navFirstController = BaseNavigationController.init(rootViewController: firstController)
        
        navFirstController.title = "首页"
        
        navFirstController.tabBarItem.image = UIImage.init(named: "first")
        
        let secondController = SecondViewController.init()
        
        let navSecondController = BaseNavigationController.init(rootViewController:secondController)
        
        navSecondController.title = "槑"
        
        navSecondController.tabBarItem.image = UIImage.init(named: "second")
        
        let threeController = ThreeViewController.init()
        
        let navThreeController = BaseNavigationController.init(rootViewController: threeController)
        
        navThreeController.title = "我的"
        
        navThreeController.tabBarItem.image = UIImage.init(named: "me")

        self.viewControllers = [navFirstController,navSecondController,navThreeController]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
