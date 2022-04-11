//
//  ZWMemberManagemenLeftView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWMemberManagemenLeftView: UIView {
    
    //
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.text = "会员列表"
        return label
    }()
    //
    lazy var newCreatBtn : UIButton = {
        let Btn = UIButton()
        Btn.setTitle("+新建会员卡", for: .normal)
        Btn.setTitleColor(MainColor, for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 18*WidthW)
        return Btn
    }()
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame: .zero)//UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    func initView()->UIView{
        //
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(28*WidthW)
            make.top.equalTo(self.snp.top).offset(31*WidthW)
        }
        //
        self.addSubview(newCreatBtn)
        newCreatBtn.cornerRadius(cornerRadius: 20*WidthW, borderColor: MainColor, borderWidth: 1)
        newCreatBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-28*WidthW)
            make.top.equalTo(self.snp.top).offset(31*WidthW)
            make.width.equalTo(141*WidthW)
            make.height.equalTo(40*WidthW)
        }
        //
        self.addSubview(TableView)
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(32*WidthW)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(0*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
        
        return self
    }
    
}

extension ZWMemberManagemenLeftView : UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
     
    }
}

extension ZWMemberManagemenLeftView : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWMemberManagemenLeftCell =  ZWMemberManagemenLeftCell.createWithTableViewCell(tableView: tableView) as! ZWMemberManagemenLeftCell

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200*WidthW
    }
    
    

}
