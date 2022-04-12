//
//  ZWOrderQueryLeftCellJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/12.
//

import UIKit

class ZWOrderQueryRightCellJoe: UITableViewCell {
    
    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()
    lazy var view01 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F3F3F5")
        return view
    }()
    lazy var NumLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "#00"
        return label
    }()
    
    lazy var infoImage : UIImageView = {
        let imageview = UIImageView()
        //        imageview.image = UIImageView.init(image: "")
        imageview.backgroundColor = UIColor.init(hex: "#DCDEE0")
        return imageview
    }()
    
    lazy var content00: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "出货中"
        return label
    }()
    // shoulogo
    lazy var shoulogoImage : UIImageView = {
        let imageview = UIImageView()
        //        imageview.image = UIImageView.init(image: "")
        imageview.backgroundColor = StandingPColor
        return imageview
    }()
    lazy var content01: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "栗栗小熊柏油蛋糕栗栗小熊柏油榛子坚果脆皮"
        return label
    }()
    //
    lazy var content02: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "18888888888"
        return label
    }()
    //
    lazy var content03: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        label.text = "赵**(女士)"
        return label
    }()
    
    //商家接单btn
    lazy var businessStype: UIButton = {
        let btn = UIButton()
        btn.setTitle("商家接单", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = MainColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        return btn
    }()
    //订单查询时间
    lazy var timeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "订单查询时间"), for: .normal)
        btn.setTitle("14:24:11", for: .normal)
        btn.setTitleColor(MainColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        return btn
    }()
    //
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
        BackView.cornerRadius(cornerRadius: 8, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 1)
        self.addSubview(BackView)
        self.BackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(12*WidthW)
            make.right.equalTo(self.snp.right).offset(0*WidthW)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-12*WidthW)
        }
        //
        BackView.addSubview(view01)
        view01.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.height.equalTo(self.snp.height)
            make.width.equalTo(119*WidthW)
        }
        
        view01.addSubview(NumLabel)
        NumLabel.snp.makeConstraints { make in
            make.top.equalTo(view01.snp.top).offset(20*WidthW)
            make.width.equalTo(view01.snp.width)
            make.height.equalTo(20*WidthW)
        }
        //
        view01.addSubview(infoImage)
        infoImage.snp.makeConstraints { make in
            make.left.equalTo(BackView.snp.left).offset(32*WidthW)
            make.top.equalTo(NumLabel.snp.bottom).offset(10*WidthW)
            make.width.height.equalTo(64*WidthW)
        }
        
        BackView.addSubview(content00)
        content00.cornerRadius(cornerRadius: 0, borderColor: UIColor.init(hex: "#F2F3F5"), borderWidth: 1)
        content00.snp.makeConstraints { make in
            make.left.equalTo(view01.snp.right).offset(0*WidthW)
            make.height.equalTo(self.snp.height).offset(-20*WidthW)
            make.width.equalTo(141*WidthW)
        }
        BackView.addSubview(shoulogoImage)
        shoulogoImage.snp.makeConstraints { make in
            make.left.equalTo(content00.snp.right).offset(23*WidthW)
            make.top.equalTo(BackView.snp.top).offset(36*WidthW)
            make.width.height.equalTo(25*WidthW)
        }
        
        //标题
        BackView.addSubview(self.content01)
        self.content01.snp.makeConstraints { make in
            make.top.equalTo(shoulogoImage.snp.top).offset(0*WidthW)
            make.left.equalTo(shoulogoImage.snp.right).offset(12*WidthW)
            make.right.equalTo(BackView.snp.right).offset(-16*WidthW)
        }
        
        //
        BackView.addSubview(self.content02)
        self.content02.snp.makeConstraints { make in
            make.top.equalTo(content01.snp.bottom).offset(10*WidthW)
            make.left.equalTo(content01.snp.left)
        }
        
        //
        BackView.addSubview(self.content03)
        self.content03.snp.makeConstraints { make in
            make.top.equalTo(self.content02.snp.top).offset(0*WidthW)
            make.right.equalTo(BackView.snp.right).offset(-36*WidthW)
            make.left.equalTo(content02.snp.right).offset(10*WidthW)
        }
        //
        businessStype.cornerRadius(cornerRadius: 24*WidthW)
        BackView.addSubview(businessStype)
        businessStype.snp.makeConstraints { make in
            make.top.equalTo(BackView.snp.top).offset(24*WidthW)
            make.right.equalTo(BackView.snp.right).offset(-22*WidthW)
            make.width.height.equalTo(160*WidthW)
            make.height.height.equalTo(48*WidthW)
        }
        //
        
        BackView.addSubview(timeBtn)
        timeBtn.snp.makeConstraints { make in
            make.top.equalTo(businessStype.snp.bottom).offset(10*WidthW)
            make.right.equalTo(businessStype.snp.right).offset(0*WidthW)
            make.width.height.equalTo(160*WidthW)
            make.height.height.equalTo(48*WidthW)
        }
        
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWOrderQueryRightCellJoe.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWOrderQueryRightCellJoe.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
