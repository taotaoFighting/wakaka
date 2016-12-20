//
//  FirstTableViewCell.swift
//  wakaka
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Kingfisher

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var foreImageView: UIImageView!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    /**
     * 定义必报 格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
     */
    typealias changeCellHeight = (_ height:CGFloat) ->Void
    
    var cellHeight : changeCellHeight?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerImageView.layer.cornerRadius = 30
        
        self.headerImageView.clipsToBounds = true
        
        // Initialization code
    }
    
    func bindDataWithModel(listModel:ListModel) -> Void {
        
        self.userNameLabel.text = listModel.user.name
        
        self.titleLabel.text = listModel.name
        
        self.subTitleLabel.text = listModel.start_date.appending("  --  >").appending(listModel.end_date)

//        self.foreImageView.kf.setImage(with: URL.init(string: listModel.front_cover_photo_url))
        
        self.headerImageView.kf.setImage(with: URL.init(string: listModel.user.image))
        
        
        
        self.foreImageView.kf.setImage(with: URL.init(string: listModel.front_cover_photo_url), placeholder: nil, options: nil, progressBlock: { (receivedSize, totalSize) -> () in
            print("Download Progress: \(receivedSize)/\(totalSize)")
        }, completionHandler: { (image, error, cacheType, imageURL) -> () in
            
            print("%f%f",image?.size.height ?? "2",image?.size.width ?? "1")
            
            if self.cellHeight != nil{
                
                self.cellHeight!(KS_Width / (image?.size.width)! * (image?.size.height)!)
            }
           
            
        })
        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
