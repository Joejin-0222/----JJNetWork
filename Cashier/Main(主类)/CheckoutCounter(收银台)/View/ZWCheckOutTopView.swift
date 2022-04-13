//
//  ZWCheckOutTopView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import UIKit

class ZWCheckOutTopView: UIView {
    //
    lazy var headImageBtn : UIButton = {
        let image = UIButton()
        image.setImage(UIImage.init(named: "vip"), for: .normal)
        return image
    }()
    //
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "My nickname"
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#232733")
        return label
    }()
    //
    lazy var MessageImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "消息")
        return image
    }()
    //
    lazy var WifiImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "wifi")
        return image
    }()
    //
    lazy var DateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#232733")
        return label
    }()
    //搜索view
    lazy var SearchView : UIView = {
        let view = UIView()
        
        return view
    }()
    //
    lazy var goodNameBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.init(hex: "#DEDFE5")
        btn.setTitle("商品名称", for: .normal)
        btn.setImage(UIImage.init(named: "down"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18*WidthW)
        btn.setTitleColor(UIColor.init(hex: "#3B4152"), for: .normal)
        
        return btn
    }()
    //
    lazy var SaoMaBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "扫一扫"), for: .normal)
        
        return btn
    }()
    //搜索输入框
    lazy var Textfield : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "请输入商品名称、商品码"
        textfield.font = UIFont.systemFont(ofSize: 20*WidthW)
        return textfield
    }()
    func initView() -> UIView {
        self.backgroundColor = UIColor.white
        //个人头像
        self.addSubview(headImageBtn)
        headImageBtn.addTarget(self, action: #selector(headImageBtnClick), for: .touchUpInside)
        headImageBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right)
            make.width.height.equalTo(48*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        //用户名
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.right.equalTo(headImageBtn.snp.left)
            make.width.height.equalTo(120*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        self.nameLabel.text = Cache.user?.nickname
        
        //消息
        self.addSubview(MessageImage)
        MessageImage.snp.makeConstraints { make in
            make.right.equalTo(nameLabel.snp.left).offset(-18*WidthW)
            make.width.height.equalTo(40*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        //wifi
        self.addSubview(WifiImage)
        WifiImage.snp.makeConstraints { make in
            make.right.equalTo(MessageImage.snp.left).offset(-18*WidthW)
            make.width.height.equalTo(32*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        // 获取当前系统时间
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MM月dd日 HH:mm"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        //日期时间
        self.addSubview(DateLabel)
        DateLabel.text = strNowTime
        DateLabel.snp.makeConstraints { make in
            make.right.equalTo(WifiImage.snp.left).offset(-18*WidthW)
            make.width.height.equalTo(150*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        //搜索view
        SearchView.cornerRadius(cornerRadius: 30*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        self.addSubview(SearchView)
        SearchView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.right.equalTo(DateLabel.snp.left).offset(-80*WidthW)
            make.height.equalTo(60*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        //
        goodNameBtn.setImageAndTitle(imageName: "down", title: "商品名称", type: .PositionRight, Space: 1)
        SearchView.addSubview(goodNameBtn)
        goodNameBtn.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(140*WidthW)
        }
        goodNameBtn.addTarget(self, action: #selector(goodNameBtnClick), for: .touchUpInside)
        
        //
        SearchView.addSubview(SaoMaBtn)
        SaoMaBtn.snp.makeConstraints { make in
            make.right.equalTo(SearchView.snp.right).offset(-15*WidthW)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(40*WidthW)
        }
        //
        SearchView.addSubview(Textfield)
        Textfield.snp.makeConstraints { make in
            make.left.equalTo(goodNameBtn.snp.right).offset(13*WidthW)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(SaoMaBtn.snp.left).offset(-10*WidthW)
        }
        
        
        return self
    }
    
    
    @objc func headImageBtnClick(){
        self.clear()
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
    private func clear() {
        Cache(rawValue: "isLoginKey")?.clear()
        Cache(rawValue: "loginUserKey")?.clear()
        Cache(rawValue: "currentCurrencyKey")?.clear()
        Cache(rawValue: "isAutoSettedCurrencyKey")?.clear()
        Cache(rawValue: "cookieKey")?.clear()
    }
    
    @objc func goodNameBtnClick(){
        let alertView = ZWChooseGoodsClassTanKuangView(title: "协议", message: "。", cancelButtonTitle: "取 消", sureButtonTitle: "确 定",x: (150+525+148+24)*WidthW, y: (24+60)*WidthW, width: 200 * WidthW, height: 200 * WidthW)
//        alertView.dismiss()
        alertView.show()
        //获取点击事件
        alertView.clickIndexClosure { (index) in
            print("点击了第" + "\(index)" + "个按钮")
        }
    }
    
}
