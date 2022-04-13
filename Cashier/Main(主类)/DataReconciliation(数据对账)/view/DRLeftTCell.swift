//
//  DRLeftTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/12.
//

import UIKit

class DRLeftTCell: baseTableViewCell {

    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FEE6E5")
        return view
    }()
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        imageView?.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var contentL: UILabel = {
        let label = UILabel()
        label.text = "测试数据"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E6E8EB")
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
 
    override func configUI() {
        self.backgroundColor = UIColor.init(hex: "#ffffff")
        self.addSubview(backView)
        self.backView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-0*WidthW)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.backView.addSubview(imgView)
        self.imgView.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0*WidthW)
            make.left.equalTo(self.backView.snp.left).offset(64*WidthW)
            make.width.height.equalTo(30*WidthW)
        }
        self.backView.addSubview(contentL)
        contentL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0*WidthW)
            make.left.equalTo(self.imgView.snp.right).offset(20*WidthW)
            make.right.equalTo(self.backView.snp.right).offset(20*WidthW)
        }
        
        self.backView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.backView.snp.bottom).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(20*WidthW)
            make.right.equalTo(self.backView.snp.right).offset(-20*WidthW)
            make.height.equalTo(2*HeighH)
        }
        
    }
    var titleStr: NSString? {
        didSet{
            guard let titleStr = titleStr else { return }
            contentL.text = titleStr as String
        }
    }
    
    var imgStr: NSString? {
        didSet{
            guard let imgStr = imgStr else { return }
            imgView.image = UIImage(named: imgStr as String)
            
        }
    }
    
    var indexSelected: Int? {
        didSet{
            guard let indexSelected = indexSelected else { return }
            if indexSelected == 1 {
                backView.backgroundColor = UIColor(hex: "#FEE6E5")
            }else{
                backView.backgroundColor = UIColor.white
            }
        }
    }
}
