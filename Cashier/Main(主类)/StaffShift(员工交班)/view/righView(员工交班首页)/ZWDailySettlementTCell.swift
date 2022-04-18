//
//  ZWDailySettlementTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

class ZWDailySettlementTCell: baseTableViewCell {

    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F3F3F5")
        return view
    }()
    
    lazy var contentL: UILabel = {
        let label = UILabel()
        label.text = "#1"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var timeL: UILabel = {
        let label = UILabel()
        label.text = "2021-10-04 14:00 至 2021-10-04 17:00"
        label.textColor = UIColor.init(hex: "#58607A")
        label.font = UIFont.systemFont(ofSize: 22*WidthW)
        return label
    }()
    
    
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        imageView?.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var rightBtn: UIButton = {
       let button = UIButton()
        button.setTitle("未交班", for: .normal)
        button.setImage(UIImage(named: "编组 47"), for: .normal)
        button.setTitleColor(UIColor.init(hex: "#FE4B48"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var leftBtn: UIButton = {
       let button = UIButton()
        button.setTitle("fafaf", for: .normal)
        button.setImage(UIImage(named: "aodio"), for: .normal)
        button.setTitleColor(UIColor.init(hex: "#576080"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18*WidthW)
        button.imageView?.contentMode = .scaleAspectFit
        return button
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

            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        }
        

        self.backView.addSubview(contentL)
        contentL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0*WidthW)
            make.left.equalTo(self.backView.snp.left).offset(20*WidthW)
        }
        
        self.backView.addSubview(self.timeL)
        self.timeL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0*WidthW)
            make.left.equalTo(self.contentL.snp.right).offset(20*WidthW)
        }
        
        self.backView.addSubview(self.rightBtn)
        self.rightBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0*WidthW)
            make.right.equalToSuperview().offset(-20*WidthW)
            make.width.equalTo(150*WidthW)
            make.height.equalTo(40*WidthW)
        }
        
        self.backView.addSubview(self.leftBtn)
        self.leftBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0*WidthW)
            make.right.equalTo(self.rightBtn.snp.left).offset(-20*WidthW)
            make.width.equalTo(150*WidthW)
            make.height.equalTo(40*WidthW)
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
