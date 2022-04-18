//
//  DRHeaderVi.swift
//  Cashier
//
//  Created by mac on 2022/4/12.
//

import UIKit

typealias rightBtnBlock = (Int)->Void

class DRHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var rightBtnBlock:rightBtnBlock?
    
    lazy var redLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FE4B48")
        return view
    }()
    
    lazy var titleL:UILabel = {
        let label = UILabel()
        label.text = "日结经营报告"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.layer.borderColor = UIColor.init(hex: "#FE4B48").cgColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20*HeighH
        button.setTitle("打 印", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#FE4B48"), for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        return button
    }()
//    右边按钮点击事件
    @objc func tapButton(sender: UIButton) {
        print("打印按钮点击事件")
//        let popview: testPopView = testPopView().initView() as! testPopView
//        popview.show()
//        testPopView().initView1()
        
        if self.rightBtnBlock != nil{
            self.rightBtnBlock!(0)
        }
    }
    
    lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#E6E8EB")
        return view
    }()
    func initView() -> UIView{
        //红色的view
        self.addSubview(redLineView)
        redLineView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).offset(0)
            make.height.equalTo(20*HeighH)
            make.width.equalTo(4*WidthW)
            make.left.equalTo(self.snp.left).offset(20*WidthW)
        }
        //
        self.addSubview(titleL)
        titleL.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).offset(0)
            make.left.equalTo(self.redLineView.snp.right).offset(10*WidthW)
            make.height.equalTo(40*HeighH)
        }
        
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).offset(0)
            make.right.equalTo(self.snp.right).offset(-80*WidthW)
            make.height.equalTo(40*HeighH)
            make.width.equalTo(150*WidthW)
        }
        
        self.addSubview(self.lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(28*WidthW)
            make.right.equalToSuperview().offset(-28*WidthW)
            make.height.equalTo(1*WidthW)
        }
        
        return self
    }

}
