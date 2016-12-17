//
//  FirstViewController.swift
//  wakaka
//
//  Created by apple on 16/12/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource{
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        
        self.view .addSubview(self.mainTableView)
        

    }
    
    lazy var mainTableView: UITableView = {
        
        let mainTableView:UITableView = UITableView.init(frame:CGRect.init(x: 0, y: 0, width: KS_Width, height: KS_Height) , style: UITableViewStyle.plain)
        
        mainTableView.delegate = self
        
        mainTableView.dataSource = self
        
        mainTableView.register(UINib.init(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: indentifier)
        
        return mainTableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:FirstTableViewCell = tableView.dequeueReusableCell(withIdentifier: indentifier) as! FirstTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let point:CGPoint = scrollView.contentOffset
        
        NSLog("point = (%lu,%lu)", point.x,point.y)
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
