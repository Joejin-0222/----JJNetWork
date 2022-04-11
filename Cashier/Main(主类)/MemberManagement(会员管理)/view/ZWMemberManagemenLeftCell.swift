//
//  ZWMemberManagemenLeftCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWMemberManagemenLeftCell: UITableViewCell {

    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()

    
    lazy var contentImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = StandingPColor
        imageview.image = UIImage.init(named: "")
        return imageview
    }()
    
    lazy var content1 : UILabel = {
        let label = UILabel()
        label.text = "浮光西安会员卡"
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    lazy var content2 : UILabel = {
        let label = UILabel()
        label.text = "123214127417407497"
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    lazy var content3 : UILabel = {
        let label = UILabel()
        label.text = "卡号:1401808408148148"
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
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
        
        self.backgroundColor = UIColor.init(hex: "#ffffff")
        //底层view
//        BackView.cornerRadius(cornerRadius: 1, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 1)
        self.addSubview(BackView)
        self.BackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-17*WidthW)
            make.left.equalTo(self.snp.left).offset(17*WidthW)
            make.bottom.equalTo(self.snp.bottom)
        }
       //
        BackView.addSubview(contentImageView)
        self.contentImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.BackView.snp.centerY).offset(0*WidthW)
            make.left.equalTo(self.BackView.snp.left).offset(21*WidthW)
            make.width.equalTo(208*WidthW)
            make.height.equalTo(120*WidthW)
        }
        //
        BackView.addSubview(content1)
        content1.snp.makeConstraints { make in
            make.top.equalTo(self.contentImageView.snp.top).offset(0*WidthW)
            make.left.equalTo(self.contentImageView.snp.right).offset(10*WidthW)
            make.right.equalTo(self.snp.right).offset(-10*WidthW)
        }
        //
        BackView.addSubview(content2)
        content2.snp.makeConstraints { make in
            make.top.equalTo(self.content1.snp.bottom).offset(18*WidthW)
            make.left.equalTo(self.content1.snp.left).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-10*WidthW)
        }
        //
        BackView.addSubview(content3)
        content3.snp.makeConstraints { make in
            make.bottom.equalTo(contentImageView.snp.bottom).offset(0*WidthW)
            make.left.equalTo(self.content1.snp.left).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-10*WidthW)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
       
        let classString =  String(describing: ZWMemberManagemenLeftCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWMemberManagemenLeftCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
