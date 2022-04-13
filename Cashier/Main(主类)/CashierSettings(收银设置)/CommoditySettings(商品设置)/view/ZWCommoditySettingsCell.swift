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
        switchBtn.addTarget(self, action: #selector(switchBtnClick(_:)), for: .valueChanged)
        return switchBtn
    }()
    
    @objc func switchBtnClick(_ sender:UISwitch){
        sender.isOn = !sender.isOn
        sender.isOn = sender.isOn ? false : true
        print("switchBtn")
    }
    
    lazy var leftBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "路径"), for: .normal)
        button.setTitle("SKU", for: .normal)
        button.setImage(UIImage(named: "图标"), for: .selected)
        button.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        button.addTarget(self, action: #selector(SKUBtnAction(_:)), for: .touchUpInside)
//        button.isHidden = true
        button.isSelected = true
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        return button
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "路径"), for: .normal)
        button.setTitle("SPU", for: .normal)
        button.setImage(UIImage(named: "图标"), for: .selected)
        button.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        button.addTarget(self, action: #selector(SPUBtnAction(_:)), for: .touchUpInside)
//        button.isHidden = true
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        return button
    }()
   
    @objc func SKUBtnAction( _ btn: UIButton){
        print("SKUBtnAction")
        btn.isSelected = !btn.isSelected
        
        rightBtn.isSelected = !btn.isSelected
        
    }
    @objc func SPUBtnAction(_ sender: UIButton){
        print("SPUBtnAction")
        sender.isSelected = !sender.isSelected
        
        leftBtn.isSelected = !sender.isSelected
    }
    
    
    lazy var redL: UILabel = {
        let label = UILabel()
        label.text = "立即更新"
        label.textColor = UIColor.init(hex: "#FE4B48")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.isUserInteractionEnabled = true
        return label
    }()
    
   
    
    lazy var timeL: UILabel = {
        let label = UILabel()
        label.text = "最近更新于56分钟前"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
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
        
        //右边按钮SUP
        BackView.addSubview(self.rightBtn)
        rightBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-40*WidthW)
            make.width.equalTo(150*WidthW)
            make.height.equalTo(30*WidthW)
        }
        //左边的按钮SKP
        BackView.addSubview(self.leftBtn)
        leftBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(rightBtn.snp.left).offset(10*WidthW)
            make.width.equalTo(150*WidthW)
            make.height.equalTo(30*WidthW)
        }
        

        
        BackView.addSubview(self.redL)
        redL.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-40*WidthW)
//            make.width.equalTo(100*WidthW)
            make.height.equalTo(30*WidthW)
        }
        
        BackView.addSubview(self.timeL)
        timeL.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(redL.snp.left).offset(-20*WidthW)
//            make.width.equalTo(100*WidthW)
            make.height.equalTo(30*WidthW)
        }

        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(upDataClick(_:)))

        redL.addGestureRecognizer(tap)
    }
    @objc func upDataClick (_ r:UITapGestureRecognizer){
       print("upDataClick")
        
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
    
    var typeIndex: Int?{
        didSet{
            guard let typeIndex = typeIndex else { return }
            if typeIndex == 0{//swicth
                SwitchBtn.isHidden = false
                leftBtn.isHidden = true
                rightBtn.isHidden = true
                redL.isHidden = true
                timeL.isHidden = true
            }else if typeIndex == 1 {//按钮展示
                
                SwitchBtn.isHidden = true
                leftBtn.isHidden = false
                rightBtn.isHidden = false
                redL.isHidden = true
                timeL.isHidden = true
                
            }else if typeIndex == 2 {//只有一个label
                SwitchBtn.isHidden = true
                leftBtn.isHidden = true
                rightBtn.isHidden = true
                redL.isHidden = false
                timeL.isHidden = true
                
            }else{//两个label
                SwitchBtn.isHidden = true
                leftBtn.isHidden = true
                rightBtn.isHidden = true
                redL.isHidden = false
                timeL.isHidden = false
                
            }
        }
        
        
    }
    
    
    
}
