//
//  ZWLeftTableviewView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWLeftTableviewView: UIView {
    var dataArray : NSArray = ["库存盘点","门店要货","本店调出"]
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    func initView()->UIView{
        //
        self.addSubview(TableView)
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
        
        
        return self
    }

}

extension ZWLeftTableviewView : UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
        
        let alertView = ZWLeftTableClickTanKuangView(title: "", message: "", cancelButtonTitle: "", sureButtonTitle: "",x:0, y: 0, width:( ScreenWidth), height: ScreenHeight)
        alertView.dataAarry =   ["收银台取单","小程序取单"]
        self.isUserInteractionEnabled = true
        alertView.isUserInteractionEnabled = true
        alertView.show()
  
        //获取点击事件
        alertView.clickIndexClosure { (index) in
            print("点击了第" + "\(index)" + "个按钮")
        }
    }
}

extension ZWLeftTableviewView : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWLeftTableviewCell =  ZWLeftTableviewCell.createWithTableViewCell(tableView: tableView) as! ZWLeftTableviewCell
        cell.contentImageView.image = UIImage.init(named: self.dataArray[indexPath.row] as! String)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140*WidthW
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
 
 
}
