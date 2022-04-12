//
//  ZWOrderQueryLeftView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/11.
//

import UIKit

class ZWOrderQueryRightView: UIView {
    
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
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
        
        
        return self
    }

}

extension ZWOrderQueryRightView : UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
 
    }
}

extension ZWOrderQueryRightView : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6//dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWOrderQueryRightCellJoe =  ZWOrderQueryRightCellJoe.createWithTableViewCell(tableView: tableView) as! ZWOrderQueryRightCellJoe
//        cell.contentImageView.image = UIImage.init(named: self.dataArray[indexPath.row] as! String)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158*WidthW
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
 
 
}
