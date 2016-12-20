//
//  ListModel.swift
//  wakaka
//
//  Created by apple on 16/12/20.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ListModel: NSObject {
    
    /**
     * 评论数量
     */
    var comments_count:Int = 0
    /**
     * 天数
     */
    var days:Int = 0
    
    /**
     * 结束日期
     */
    var end_date:String = ""
    
    
    var featured:Int = 0
    
    /**
     * 封面图片
     */
    var front_cover_photo_url:String = ""
    
    /**
     * ID
     */
    var id:Int = 0
    
    /**
     * 等级
     */
    var level:Int = 0
    
    /**
     * 喜欢个数
     */
    var likes_count:Int = 0
    
    /**
     * 姓名
     */
    var name:String = ""
    
    /**
     * 图片个数
     */
    var photos_count:Int = 0
    
    /**
     * 资源
     */
    var source:String = ""
    
    /**
     * 开始日期
     */
    var start_date:String = ""
    
    /**
     * 用户相关信息
     */
    var user = User()
    
    /**
     * 行数
     */
    var row:Int = 0
    
    /**
     * cellHeight
     */
    var cellHeight:CGFloat = 0.0
    
    
   /*
     
    /**
     * 个人理解 字典相关
     */
    func setupMappingElementClass() -> [String : AnyClass] {
        
        return ["user": User.self]
    }
    
   
    /**
     * 替换名称
     */
    func setupMappingReplaceProperty() -> [String : String] {
        return ["tt": "title", "imgs": "images"]
    }
 
 */
    
    /**
     * 个人理解  数组相关
     */
    func setupMappingObjectClass() -> [String : AnyClass] {
        
        return ["user": User.self]
    }
    
 

}
