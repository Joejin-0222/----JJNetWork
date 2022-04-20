//
//  ZWOrderCellJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWOrderCellJoe: UITableViewCell {
    
    
    lazy var content01: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 27*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "小溪柏油蛋糕"
        return label
    }()
    lazy var closeIcon: UIButton = {
        let view = UIButton()
        view.setImage(UIImage.init(named: "首页删除"), for: .normal)
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var content02: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        label.text = "￥15.88"
        return label
    }()
    
    lazy var content03: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "x1"
        return label
    }()
    
    lazy var content04: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#FE4B48")
        label.text = "-￥2.00"
        return label
    }()
    lazy var content05: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "￥13.72"
        return label
    }()
    lazy var LineView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "首页虚线")
//        view.backgroundColor = UIColor.init(hex: "#E6E8EB")
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.backgroundColor = UIColor.init(hex: "#FEE6E5")
            self.closeIcon.isHidden = false
        }else {
            self.backgroundColor = UIColor.white
            
            self.closeIcon.isHidden = true
        }
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let WIDTH = 525/4*WidthW
        
        //标题
        self.addSubview(self.content01)
        self.content01.snp.makeConstraints { make in
            make.left.equalTo(28*WidthW)
            make.top.equalTo(24*WidthW)
            make.right.equalTo(self.contentView.snp.right).offset(-50*WidthW)
        }
        //删除
        self.addSubview(self.closeIcon)
        self.closeIcon.snp.makeConstraints { make in
            make.top.equalTo(self.content01.snp.top)
            make.right.equalTo(self.contentView.snp.right).offset(-20*WidthW)
            make.width.height.equalTo(32*WidthW)
        }
        //价格
        self.addSubview(self.content02)
        self.content02.snp.makeConstraints { make in
            make.left.equalTo(0*WidthW)
            make.top.equalTo(self.content01.snp.bottom).offset(40*WidthW)
            make.width.equalTo(WIDTH)
        }
        //数量
        self.addSubview(self.content03)
        self.content03.snp.makeConstraints { make in
            make.left.equalTo(self.content02.snp.right)
            make.top.equalTo(self.content01.snp.bottom).offset(40*WidthW)
            make.width.equalTo(WIDTH)
        }
        //优惠券减免价格
        self.addSubview(self.content04)
        self.content04.snp.makeConstraints { make in
            make.left.equalTo(self.content03.snp.right)
            make.top.equalTo(self.content01.snp.bottom).offset(40*WidthW)
            make.width.equalTo(WIDTH)
        }
        //单品总价
        self.addSubview(self.content05)
        self.content05.snp.makeConstraints { make in
            make.left.equalTo(self.content04.snp.right)
            make.top.equalTo(self.content01.snp.bottom).offset(40*WidthW)
            make.width.equalTo(WIDTH)
        }
        print("=========\(OrderTabelViewWidth*WidthW)")
        
        //
        self.addSubview(self.LineView)
        self.LineView.snp.makeConstraints { make in
            make.left.equalTo(28*WidthW)
            make.right.equalTo(self.contentView.snp.right).offset(-28*WidthW)
            make.height.equalTo(2*WidthW)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWOrderCellJoe.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWOrderCellJoe.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
