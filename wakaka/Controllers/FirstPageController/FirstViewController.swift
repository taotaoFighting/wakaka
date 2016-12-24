//
//  FirstViewController.swift
//  wakaka
//
//  Created by apple on 16/12/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Alamofire
import TTReflect

class FirstViewController: BaseViewController //,UITableViewDelegate,UITableViewDataSource
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        
        self.automaticallyAdjustsScrollViewInsets = false
        
//        self.view .addSubview(self.mainTableView)
        
        self.requestData()
        
        self.view.addSubview(self.listView_left)
        
        self.view.addSubview(self.listView_right)
        
        
        
        
    }
    
    lazy var listView_left:ListView = {
      
        let listView:ListView = ListView.init(frame: CGRect(x: 0, y: 0, width: KS_Width / 2 - 5, height: KS_Height - 64 - 49))
        
        return listView
        
    }()
    
    lazy var listView_right:ListView_right = {
        
        let listView_right:ListView_right = ListView_right.init(frame: CGRect(x: KS_Width / 2 + 5, y: 64, width: KS_Width / 2 - 5, height: KS_Height - 64 - 49))
        
        return listView_right
        
    }()
    
    /**
     * 请求数据
     */
    func requestData() -> Void {
        
        Alamofire.request(FIRSTURL).responseJSON { (response) in
            
            let jsonArr:NSArray = response.result.value as! NSArray
            
            print(jsonArr)
            
            jsonArr .enumerateObjects({ (dict, Int, nil) in
                
                print("dict = ",dict)
                
                let tmpDict:NSDictionary = dict as! NSDictionary
                
                let listModel = Reflect<ListModel>.mapObject(json: tmpDict)
                
//                self.dataArr .add(listModel)
                
                self.listView_left.dataArr .add(listModel)
                
                self.listView_right.dataArr.add(listModel)
                
            })
            
//            self.listView_left.dataArr = self.dataArr
            
            self.listView_left.mainTableView.reloadData()
            
//            let tmpArr:NSMutableArray = NSMutableArray.init(array: self.dataArr)
//            
//            self.listView_right.dataArr = tmpArr
            
            self.listView_right.mainTableView.reloadData()
            
//            print("count = ",self.dataArr.count)
//            
//            self.mainTableView.reloadData()
        }
        
        
    
    }
    
    /**
     * 数据源 懒加载
     */
    lazy var dataArr: NSMutableArray = {
        
        let dataArr:NSMutableArray = NSMutableArray.init()
        
        return dataArr
    }()
    
    
 /*
    
    /**
     * tableView 懒加载
     */
    lazy var mainTableView: UITableView = {
        
        let mainTableView:UITableView = UITableView.init(frame:CGRect.init(x: 0, y: 0, width: KS_Width, height: KS_Height) , style: UITableViewStyle.plain)
        
        mainTableView.delegate = self
        
        mainTableView.dataSource = self
        
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
        
        cell.bindDataWithModel(listModel: listModel!)
        
        if listModel?.cellHeight == 0 {
            
            cell.cellHeight = {[unowned self]
                (cellHeight) -> () in
                
                print("cellHeight = ",cellHeight)
                
                listModel?.cellHeight = cellHeight
                
                if indexPath.row == self.dataArr.count - 1{
                    
                    self.mainTableView .reloadData()
                }
            }

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

        
        return (listModel?.cellHeight)!
    }
    
 */
    
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
