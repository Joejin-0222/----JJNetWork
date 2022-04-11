//
//  ZWCashierSettingItemCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import UIKit

class ZWCashierSettingItemCell: UITableViewCell {

    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()
    lazy var IconImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "set收银设置")
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    lazy var content01: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "收银设置"
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
        
        //底层view
        self.addSubview(BackView)
        BackView.frame = self.bounds
        //logo
        self.addSubview(self.IconImage)
        self.IconImage.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(20*WidthW)
            make.right.equalTo(self.contentView.snp.right).offset(64*WidthW)
            make.width.height.equalTo(32*WidthW)
        }
        
        
       //标题
         self.addSubview(self.content01)
         self.content01.snp.makeConstraints { make in
             make.left.equalTo(self.IconImage.snp.right).offset(20*WidthW)
             make.centerY.equalTo(self.IconImage.snp.centerY)
             make.height.equalTo(26 * WidthW)
             make.width.equalTo(220 * WidthW)
         }
       
     
//        //
//        self.addSubview(self.LineView)
//        self.LineView.snp.makeConstraints { make in
//            make.left.equalTo(28*WidthW)
//            make.right.equalTo(self.contentView.snp.right).offset(-28*WidthW)
//            make.height.equalTo(1*WidthW)
//            make.bottom.equalTo(self.contentView.snp.bottom)
//        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWCashierSettingItemCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWCashierSettingItemCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
