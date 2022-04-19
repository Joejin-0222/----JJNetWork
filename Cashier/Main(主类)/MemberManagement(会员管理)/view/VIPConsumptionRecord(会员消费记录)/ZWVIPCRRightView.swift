//
//  ZWVIPCRRightView.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit

class ZWVIPCRRightView: UIView {

  
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "会员卡累计消费金额¥480，共计14笔订单"
        label.textColor = UIColor.init(hex: "#FE7774")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.backgroundColor = UIColor.init(hex: "#FEEFEF")
        label.layer.cornerRadius = 28*WidthW
        label.clipsToBounds = true
        label.textAlignment = .center
        return label
    }()
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.init(hex: "ffffff")
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: ZWVIPRightOrderTCell.self)
        tw.register(cellType: ZWVIPGoodsTCell.self)
        tw.layer.borderColor = UIColor.init(hex: "#EBEDF0").cgColor
        tw.layer.borderWidth = 1
        tw.layer.cornerRadius = 10
        return tw
    }()
    
    
    
    func initView()->UIView{
        self.backgroundColor = Tab_backColor
        
        
//        self.addSubview(self.headerLabel)
//        self.headerLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(10*WidthW)
//            make.height.equalTo(80*WidthW)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(583*WidthW)
//        }
        
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10*WidthW)
            make.left.equalToSuperview().offset(40*WidthW)
            make.right.equalToSuperview().offset(-40*WidthW)
            make.bottom.equalToSuperview().offset(-40*WidthW)
        }

        
        
        
        return self
    }
    
    
    
    
}
extension ZWVIPCRRightView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWVIPRightOrderTCell.self)
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWVIPGoodsTCell.self)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 110*WidthW
        }else{
            return 100*WidthW
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 86*WidthW
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let headerView = UIView()
            
            headerView.backgroundColor = UIColor.white
            
            headerView.addSubview(self.headerLabel)
            headerLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.equalTo(583*WidthW)
                make.height.equalTo(56*WidthW)
            }
            
            return headerView
        }
        return UIView()
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80*WidthW
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.white
        let lineView = UIView(frame: CGRect(x: 40*WidthW, y: 40*WidthW, width: (self.width - 80) * WidthW, height: 1*WidthW))
        lineView.backgroundColor = UIColor.init(hex: "#EBEDF0")
        footerView.addSubview(lineView)
        return footerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}
