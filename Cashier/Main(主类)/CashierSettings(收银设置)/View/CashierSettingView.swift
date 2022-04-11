//
//  CashierSettingView.swift
//  Cashier
//
//  Created by mac on 2022/3/15.
//



protocol CashierSetItemSelectDelegate : NSObjectProtocol {
    func SelectItemClick(index:Int,Name:String)
}

import UIKit

import SkeletonView

class CashierSettingView: UIView {
    
    weak var delegate : CashierSetItemSelectDelegate?
    
    var DaraArray : NSArray = [["门店管理","门店管理","员工管理"],["商品设置","商品设置"],["收银设置","支付设置","其他收银设置"],["设备管理","小票机管理","本机管理","其他设备"],["更多设置","网路助手","数据同步","检查更新"]]
    
    //topline
    lazy var topLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "E6E9EB")
        
        return view
    }()
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()

    
    func initView()->UIView{
        
        self.backgroundColor = UIColor.white
        //顶部分割线
        self.addSubview(topLineView)
        topLineView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(1.5*WidthW)
        }
        //
        self.addSubview(TableView)
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(topLineView.snp.bottom).offset(20*WidthW)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
        
        
        return self
    }
  
  
}

extension CashierSettingView : UITableViewDelegate {
    
}

extension CashierSettingView : SkeletonTableViewDataSource,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.DaraArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arr : NSArray = self.DaraArray[section] as! NSArray
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWCashierSettingItemCell =  ZWCashierSettingItemCell.createWithTableViewCell(tableView: tableView) as! ZWCashierSettingItemCell
        let arr : NSArray = self.DaraArray[indexPath.section] as! NSArray
        
        cell.content01.text = arr[indexPath.row] as? String

        if indexPath.row == 0{
            cell.IconImage.image = UIImage.init(named: "set\((arr[indexPath.row] as? String)!)")
            cell.content01.font = UIFont(name: "PingFangHK-Bold", size: 22*WidthW)
        }else{
            cell.IconImage.image = UIImage.init(named: "")
            cell.content01.font = UIFont.systemFont(ofSize: 22*WidthW)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70*WidthW
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }
        return 5
    }
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if indexPath.section == 0 {
            return "CashierSettingView"
        }
        return "CashierSettingView"
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            return
        }else{
            let arr : NSArray = self.DaraArray[indexPath.section] as! NSArray
            
             let name = arr[indexPath.row] as? String
            
            self.delegate?.SelectItemClick(index: indexPath.row,Name: name ?? "")
        }
    }

}
