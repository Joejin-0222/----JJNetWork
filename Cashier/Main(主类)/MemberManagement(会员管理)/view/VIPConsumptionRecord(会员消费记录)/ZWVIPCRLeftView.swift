//
//  ZWVIPCRLeftView.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit
import MapKit

class ZWVIPCRLeftView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var imgArr:NSArray = ["编组 3","编组 3","icon-手机号","icon-会员卡号","icon-卡内总余额"]
    var titleArr:NSArray = ["姓名：","会员卡名称：","手机号：","会员卡号：","卡内总余额："]
    var subArr:NSArray = ["Diwea","浮光西安会员卡","18765430026","706463526374856392","¥108.00"]
    
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "会员卡信息"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.init(hex: "#FAFAFA")
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: ZWVIPLeftTCell.self)
        return tw
    }()
    
    lazy var againBtn: UIButton = {
        let button = UIButton()
        button.setTitle("充值", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#ffffff"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW,weight: UIFont.Weight.medium)
        button.backgroundColor = MainColor
        button.layer.cornerRadius = 28*WidthW
        return button
    }()
    
    
    func initView()->UIView{
        self.backgroundColor = Tab_backColor
        self.addSubview(self.headerLabel)
        self.headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28*WidthW)
            make.top.right.equalToSuperview()
            make.height.equalTo(80*WidthW)
        }
        
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-124*WidthW)
        }
        
        self.addSubview(self.againBtn)
        againBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-48*WidthW)
            make.width.equalTo(216*WidthW)
            make.height.equalTo(56*WidthW)
        }
        
        
        
        return self
    }
    
    
    
    
}
extension ZWVIPCRLeftView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWVIPLeftTCell.self)
        if indexPath.row == self.imgArr.count - 1{
            cell.tipHidden = true
        }else{
            cell.tipHidden = false
        }
        cell.imgView.image = UIImage(named: self.imgArr[indexPath.row] as! String)
        cell.leftLabel.text = (self.titleArr[indexPath.row] as! String)
        cell.rightL.text = (self.subArr[indexPath.row] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90*WidthW
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}
