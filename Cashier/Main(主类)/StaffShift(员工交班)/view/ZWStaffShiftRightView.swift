//
//  ZWStaffShiftRightView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWStaffShiftRightView: UIView, SementSelectClickDelegate {
   
    
    lazy var lineView : UIView = {
       let view = UIView()
        view.backgroundColor = MainColor
        return view
    }()
    
    lazy var titleLabel : UILabel = {
      let label = UILabel()
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.text = "营收数据"
        return label
    }()
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)//UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    var dataArray : NSArray = [["销售金额/元","实收金额/元","退款金额/元","优惠金额/元"],["现金金额","实收金额/元","退款金额/元","收银充值金额","储值金额/元","券码核销张数","美团点评/张","口碑套餐/张","美零商品券/张"]]
    var titleDataArray : NSArray = []
    var sementView : ZWCheckSementViewJoe =  ZWCheckSementViewJoe()
    
    func initView()->UIView{
        
        //
        sementView.delegate = self//遵守点击分段选择代理
        sementView.YesNetWork = false //是网络数据
        sementView.columnNum =  2 //设置为 3列
        self.addSubview(sementView.initView())
        sementView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(447*WidthW)
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.width.equalTo(400*WidthW)
            make.height.equalTo(72*WidthW)
        }
       
        sementView.dataAarry =  ["交班","日结"]
        self.sementView.ReloadData()
     //
        self.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(68*WidthW)
            make.width.equalTo(4*WidthW)
            make.height.equalTo(22*WidthW)
            make.top.equalTo(self.sementView.snp.bottom).offset(46*WidthW)
        }
        //
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(lineView.snp.right).offset(9*WidthW)
            make.centerY.equalTo(lineView.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-30*WidthW)
            make.height.equalTo(26*WidthW)
        }
       //
        //
        self.addSubview(TableView)
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30*WidthW)
            make.left.equalTo(lineView.snp.left).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-68*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-84*WidthW)
        }
        
        return self
    }
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
}

extension ZWStaffShiftRightView : UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
     
    }
}

extension ZWStaffShiftRightView : UITableViewDataSource{
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
            cell.BackView.backgroundColor = UIColor.init(hex: "#F3F3F5")
        }else{//#FEF9D5
            cell.BackView.backgroundColor = UIColor.init(hex: "#F3F3F5")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64*WidthW
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0*WidthW
        }
            return 30*WidthW
    }
    
}
