//
//  ZWLeftTableviewCell.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWLeftTableviewCell: UITableViewCell {
    
    lazy var BackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()

    
    lazy var contentImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = StandingPColor
        return imageview
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
//        BackView.cornerRadius(cornerRadius: 1, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 1)
        self.addSubview(BackView)
        self.BackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-40*WidthW)
            make.left.equalTo(self.snp.left).offset(40*WidthW)
            make.bottom.equalTo(self.snp.bottom)
        }
       //
        BackView.addSubview(contentImageView)
        self.contentImageView.snp.makeConstraints { make in
            make.top.equalTo(self.BackView.snp.top).offset(10*WidthW)
            make.right.equalTo(self.BackView.snp.right).offset(0*WidthW)
            make.left.equalTo(self.BackView.snp.left).offset(0*WidthW)
            make.bottom.equalTo(self.BackView.snp.bottom).offset(-10*WidthW)
        }
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func createWithTableViewCell(tableView:UITableView) -> UITableViewCell {
        let classString =  String(describing: ZWLeftTableviewCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: classString)
        if cell == nil {
            cell = ZWLeftTableviewCell.init(style: .default, reuseIdentifier: classString)
        }
        return cell!
    }
}
