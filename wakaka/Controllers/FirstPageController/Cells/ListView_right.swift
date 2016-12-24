//
//  listView_right.swift
//  wakaka
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ListView_right: UIView ,UITableViewDelegate,UITableViewDataSource{

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.addSubview(self.mainTableView)
        
        let beatAnimator = BeatAnimator(frame: CGRect(x: 0, y: 0, width: KS_Width / 2 - 5, height: 80))
        
        self.mainTableView.addPullToRefreshWithAction({
            
            OperationQueue().addOperation {
                
                sleep(2)
                
                self.mainTableView.reloadData()
                
                OperationQueue.main.addOperation {
                    
                    self.mainTableView.stopPullToRefresh()
                }
            }
            
        }, withAnimator: beatAnimator)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * 数据源 懒加载
     */
    lazy var dataArr: NSMutableArray = {
        
        let dataArr:NSMutableArray = NSMutableArray.init()
        
        return dataArr
    }()
    
    /**
     * tableView 懒加载
     */
    lazy var mainTableView: UITableView = {
        
        let mainTableView:UITableView = UITableView.init(frame:CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height) , style: UITableViewStyle.plain)
        
        mainTableView.delegate = self
        
        mainTableView.dataSource = self
        
        mainTableView.showsVerticalScrollIndicator = false
        
        mainTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        mainTableView.rowHeight = 44.0
        
        
        mainTableView.register(UINib.init(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: indentifier)
        
        return mainTableView
    }()
    
    /**
     * TableView 代理方法 return cell数量
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    /**
     * TableView 代理方法 return FirstTableViewCell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:FirstTableViewCell = tableView.dequeueReusableCell(withIdentifier: indentifier) as! FirstTableViewCell
        
        var listModel:ListModel? = nil
        
        if self.dataArr.count > indexPath.row {
            
            listModel = self.dataArr.object(at: indexPath.row) as? ListModel
            
            listModel?.row = indexPath.row
        }
        
        cell.bindDataWithModel_right(listModel: listModel!)
        
        cell.cellHeight_right = {[unowned self]
            (cellHeight) -> () in
            
            print("cellHeight_right = ",cellHeight)
            
            listModel?.cellHeight = cellHeight
            
            self.mainTableView.reloadData()
        }
        
        return cell
        
    }
    
    /**
     * TableView return 高度
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var listModel:ListModel? = nil
        
        if self.dataArr.count > indexPath.row {
            
            listModel = self.dataArr.object(at: indexPath.row) as? ListModel
            
            listModel?.row = indexPath.row
        }
        
        if listModel?.cellHeight == 0 {
            
            return 100
        }
        
        
        return (listModel?.cellHeight)!
    }

}
