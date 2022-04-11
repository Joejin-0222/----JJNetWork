//
//  ZWCommoditySettingsCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWCommoditySettingsCell: UITableViewCell {

    
    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()

    
    lazy var content01: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "显示商品库存"
        return label
    }()
   //
    lazy var SwitchBtn: UISwitch = {
        let switchBtn = UISwitch()
        // 设置控件开启状态填充色
        switchBtn.onTintColor = MainColor
        // 设置控件关闭状态填充色
        switchBtn.tintColor = UIColor.init(hex: "#EBEDF0")
        // 设置控件开关按钮颜色
        switchBtn.thumbTintColor = UIColor.white
        switchBtn.isOn = true
        return switchBtn
    }()
   
    lazy var LineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#E6E8EB")
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        //底层view
        BackView.cornerRadius(cornerRadius: 1, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 1)
        self.addSubview(BackView)
        self.BackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-73*WidthW)
            make.left.equalTo(self.snp.left).offset(73*WidthW)
            make.bottom.equalTo(self.snp.bottom)
        }
       

        //标题
        BackView.addSubview(self.content01)
         self.content01.snp.makeConstraints { make in
             make.top.equalTo(BackView.snp.top).offset(24*WidthW)
             make.left.equalTo(BackView.snp.left).offset(36*WidthW)
             make.height.equalTo(30 * WidthW)
         }
       //

        //标题
        BackView.addSubview(self.SwitchBtn)
        SwitchBtn.addTarget(self, action: #selector(SwitchBtnClick(sender:)), for: .valueChanged)
         self.SwitchBtn.snp.makeConstraints { make in
             make.centerY.equalTo(self.content01.snp.centerY).offset(0*WidthW)
             make.right.equalTo(BackView.snp.right).offset(-36*WidthW)
         }
        
    }
    @objc func SwitchBtnClick(sender:UISwitch){
        if sender.isOn {
            
            // 设置控件开启状态填充色
//            switchBtn.onTintColor = MainColor
//            // 设置控件关闭状态填充色
//            switchBtn.tintColor = UIColor.init(hex: "#EBEDF0")
        }else{
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWCommoditySettingsCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWCommoditySettingsCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
