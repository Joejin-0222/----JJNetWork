//
//  ZWcontentCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWContentCell: UITableViewCell {

 
    
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
        label.text = "门店名称"
        return label
    }()
   //所属行业：烘培类
    lazy var content02: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        label.text = "锦业路门店02"
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
        BackView.addSubview(self.content02)
         self.content02.snp.makeConstraints { make in
             make.centerY.equalTo(self.content01.snp.centerY).offset(0*WidthW)
             make.right.equalTo(BackView.snp.right).offset(-36*WidthW)
             make.height.equalTo(30 * WidthW)
         }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWContentCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWContentCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
