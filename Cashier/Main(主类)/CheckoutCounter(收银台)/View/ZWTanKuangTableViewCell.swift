//
//  ZWTanKuangTableViewCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWTanKuangTableViewCell: UITableViewCell {
    
    
    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()
    lazy var infoImage : UIImageView = {
        let imageview = UIImageView()
        //        imageview.image = UIImageView.init(image: "")
        imageview.backgroundColor = UIColor.init(hex: "#DCDEE0")
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
        label.text = "x9"
        return label
    }()
    //
    lazy var content03: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "￥80:00"
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
            make.right.equalTo(self.snp.right).offset(0*WidthW)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.bottom.equalTo(self.snp.bottom)
        }
        //
        BackView.addSubview(infoImage)
        infoImage.snp.makeConstraints { make in
            make.left.equalTo(BackView.snp.left).offset(32*WidthW)
            make.centerY.equalTo(BackView.snp.centerY)
            make.width.height.equalTo(64*WidthW)
        }
        
        //
        BackView.addSubview(self.content03)
        self.content03.snp.makeConstraints { make in
            make.top.equalTo(self.infoImage.snp.top).offset(0*WidthW)
            make.right.equalTo(BackView.snp.right).offset(-36*WidthW)
        }
        //标题
        BackView.addSubview(self.content01)
        self.content01.snp.makeConstraints { make in
            make.top.equalTo(infoImage.snp.top).offset(0*WidthW)
            make.left.equalTo(infoImage.snp.right).offset(16*WidthW)
            make.right.equalTo(BackView.snp.right).offset(-16*WidthW)
        }
        //
        BackView.addSubview(self.content02)
        self.content02.snp.makeConstraints { make in
            make.bottom.equalTo(infoImage.snp.bottom).offset(0*WidthW)
            make.left.equalTo(content01.snp.left)
        }
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWTanKuangTableViewCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWTanKuangTableViewCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
