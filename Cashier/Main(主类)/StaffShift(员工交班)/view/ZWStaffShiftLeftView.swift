//
//  ZWStaffShiftLeftView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWStaffShiftLeftView: UIView {
    
    
    var HeaderView : ZWStaffHeaderView =  ZWStaffHeaderView()
    
    var dataArray : NSArray = [["上班时间","系统时间"],["上班时长","首单时间","尾单时间","订单笔数","预订单笔数"]]
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)//UITableView(frame:.zero)
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
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
      
        return self
    }

}

extension ZWStaffShiftLeftView : UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
     
    }
}

extension ZWStaffShiftLeftView : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return  dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arr = self.dataArray[section]
            
        return (arr as AnyObject).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWStaffShiftOneCell =  ZWStaffShiftOneCell.createWithTableViewCell(tableView: tableView) as! ZWStaffShiftOneCell
//        cell.contentImageView.image = UIImage.init(named: self.dataArray[indexPath.row] as! String)
        let arr: NSArray = self.dataArray[indexPath.section] as! NSArray
            
        cell.content1.text = arr[indexPath.row] as? String
        
        if indexPath.section == 0 {
            cell.BackView.backgroundColor = UIColor.init(hex: "#FFDA47")
        }else{//#FEF9D5
            cell.BackView.backgroundColor = UIColor.init(hex: "#FEF9D5")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64*WidthW
    }
    
 
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.00
        }else{
            return 110*WidthW
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footView = UIView()
//        footView.backgroundColor = UIColor.c
        let JiaobanBtn  = UIButton()
        JiaobanBtn.backgroundColor = MainColor
        JiaobanBtn.setTitle("交班", for: .normal)
        JiaobanBtn.setTitleColor(UIColor.white, for: .normal)
        JiaobanBtn.frame = CGRect(x: (525-184)/2*WidthW, y: 60*WidthW, width: 184*WidthW, height: 56*WidthW)
        footView.addSubview(JiaobanBtn)
        JiaobanBtn.cornerRadius(cornerRadius: 28*WidthW, borderColor: MainColor, borderWidth: 1)
        JiaobanBtn.addTarget(self, action: #selector(JiaobanBtnClick), for: .touchUpInside)
        return  footView
    }
    @objc func JiaobanBtnClick(){
        print("======点击了交班")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 160*WidthW
        }
            return 20*WidthW
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return HeaderView.initView()
        }
        return UIView()
    }
 
}
