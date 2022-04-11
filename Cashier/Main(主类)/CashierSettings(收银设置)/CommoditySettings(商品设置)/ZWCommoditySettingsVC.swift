//
//  ZWCommoditySettingsVC.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWCommoditySettingsVC: MainRootController {
    
    var DataArray : NSArray = [["显示商品库存","显示商品图片","商品规格显示","隐藏售完商品"],["检查商品与活动更新","上传离线数据"]]
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetTabelviewUI()
    }
    func SetTabelviewUI(){
        //
        self.view.addSubview(TableView)
        TableView.separatorStyle = .none
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(0*WidthW)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        //影藏店铺logo
    }
    
    
}
extension ZWCommoditySettingsVC: UITableViewDelegate{
    
}
extension ZWCommoditySettingsVC : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.DataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arr : NSArray = self.DataArray[section] as! NSArray
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let arr : NSArray = self.DataArray[indexPath.section] as! NSArray
        if indexPath.section == 0 {
            let  cell:ZWCommoditySettingsCell =  ZWCommoditySettingsCell.createWithTableViewCell(tableView: tableView) as! ZWCommoditySettingsCell
            cell.selectionStyle = .none
            
            
            cell.content01.text = arr[indexPath.row] as? String
        }
        let  cell:ZWCommoditySettingsCell =  ZWCommoditySettingsCell.createWithTableViewCell(tableView: tableView) as! ZWCommoditySettingsCell
        cell.selectionStyle = .none
        
        cell.content01.text = arr[indexPath.row] as? String
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 72*WidthW
    }
    
    //header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //headerview
        let HeaderView : ZWHeaderView = ZWHeaderView()
        if section == 0 {
            HeaderView.titleLabel.text = "商品战术设置"
        }else{
            HeaderView.titleLabel.text = "数据同步与更新"
        }
        return HeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60*WidthW
    }
    
}
