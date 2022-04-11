//
//  ZWStoreManagementVC.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWStoreManagementVC: UIViewController {
    
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
extension ZWStoreManagementVC: UITableViewDelegate{
    
}
extension ZWStoreManagementVC : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let  cell:ZWHeaderViewCell =  ZWHeaderViewCell.createWithTableViewCell(tableView: tableView) as! ZWHeaderViewCell
            
            return cell
        }
        let  cell:ZWContentCell =  ZWContentCell.createWithTableViewCell(tableView: tableView) as! ZWContentCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            return 150*WidthW
        }
        return 72*WidthW
        
        
    }
    //header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //headerview
        let HeaderView : ZWHeaderView = ZWHeaderView()
        if section == 0 {
            HeaderView.titleLabel.text = "品牌管理"
        }else{
            HeaderView.titleLabel.text = "门店管理"
        }
        return HeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60*WidthW
    }
    
}
