//
//  ZWStaffShiftOneCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWStaffShiftOneCell: UITableViewCell {
    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FFDA47")
        return view
    }()

    
    lazy var contentImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = StandingPColor
        imageview.image = UIImage.init(named: "上班时间")
        return imageview
    }()
    
    lazy var content1 : UILabel = {
        let label = UILabel()
        label.text = "上班时间:"
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#5C2B00")
        return label
    }()
    lazy var content2 : UILabel = {
        let label = UILabel()
        label.text = "2022:02:00 12:43:13"
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#5C2B00")
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
            make.width.height.equalTo(20*WidthW)
        }
        //
        BackView.addSubview(content1)
        content1.snp.makeConstraints { make in
            make.centerY.equalTo(self.BackView.snp.centerY).offset(0*WidthW)
            make.left.equalTo(self.contentImageView.snp.right).offset(10*WidthW)
        }
        //
        BackView.addSubview(content2)
        content2.snp.makeConstraints { make in
            make.centerY.equalTo(self.BackView.snp.centerY).offset(0*WidthW)
            make.right.equalTo(BackView.snp.right).offset(-21*WidthW)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
       
        let classString =  String(describing: ZWStaffShiftOneCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWStaffShiftOneCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
