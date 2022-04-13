//
//  ZWRootViewControllerJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import UIKit

class ZWRootViewControllerJoe: UIViewController {
    
    //rightline
   public lazy var rightline : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "E6E9EB")
        
        return view
    }()
    
    //topline
    lazy var topLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "E6E9EB")
        
        return view
    }()
    
    // logo 视图
    lazy var LogoImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "商家logo")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    // vip 视图
    lazy var VipImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "vip")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    //======
    //
    lazy var headImageBtn : UIButton = {
        let image = UIButton()
        image.setImage(UIImage.init(named: "vip"), for: .normal)
        return image
    }()
    //
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text =  "My nickname"
     
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.SetUI()
        self.rightLineUI()
    }
    
    func rightLineUI(){
        //右边分割线
        self.view.addSubview(rightline)
        rightline.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom)
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo((OrderTabelViewWidth)*WidthW)
            make.width.equalTo(1.5*WidthW)
        }
        //顶部分割线
        self.view.addSubview(topLineView)
        topLineView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(LogoImage.snp.bottom).offset(28*WidthW);            make.width.equalTo(OrderTabelViewWidth*WidthW)
            make.height.equalTo(1.5*WidthW)
        }
    }
    
    func SetUI(){
       
        //
        self.view.addSubview(LogoImage)
        LogoImage.snp.makeConstraints { make in
            make.left.equalTo(16*WidthW)
            make.top.equalTo(28*WidthW)
            make.width.equalTo(192*WidthW)
            make.height.equalTo(48*WidthW)
        }
    
    
        //
        self.view.addSubview(VipImage)
        VipImage.snp.makeConstraints { make in
            make.left.equalTo(LogoImage.snp.right).offset(252*WidthW)
            make.centerY.equalTo(LogoImage.snp.centerY)
            make.width.equalTo(46*WidthW)
            make.height.equalTo(46*WidthW)
        }
        //===
        //个人头像
        self.view.addSubview(headImageBtn)
        headImageBtn.addTarget(self, action: #selector(headImageBtnClick), for: .touchUpInside)
        headImageBtn.snp.makeConstraints { make in
            make.right.equalTo(self.view.snp.right).offset(-32*WidthW)
            make.width.height.equalTo(48*WidthW)
            make.top.equalTo(self.view.snp.top).offset(24*WidthW)
        }
        //用户名
        self.view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.right.equalTo(headImageBtn.snp.left)
            make.width.height.equalTo(120*WidthW)
            make.centerY.equalTo(headImageBtn.snp.centerY)
        }
        self.nameLabel.text = Cache.user?.nickname
        
        //消息
        self.view.addSubview(MessageImage)
        MessageImage.snp.makeConstraints { make in
            make.right.equalTo(nameLabel.snp.left).offset(-18*WidthW)
            make.width.height.equalTo(40*WidthW)
            make.centerY.equalTo(headImageBtn.snp.centerY)
        }
        //wifi
        self.view.addSubview(WifiImage)
        WifiImage.snp.makeConstraints { make in
            make.right.equalTo(MessageImage.snp.left).offset(-18*WidthW)
            make.width.height.equalTo(32*WidthW)
            make.centerY.equalTo(headImageBtn.snp.centerY)
        }
        // 获取当前系统时间
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MM月dd日 HH:mm"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        //日期时间
        self.view.addSubview(DateLabel)
        DateLabel.text = strNowTime
        DateLabel.snp.makeConstraints { make in
            make.right.equalTo(WifiImage.snp.left).offset(-18*WidthW)
            make.width.height.equalTo(150*WidthW)
            make.centerY.equalTo(headImageBtn.snp.centerY)
        }
    }

    
    @objc func headImageBtnClick(){
        self.clear()
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.view.window?.rootViewController = nav
        self.view.window?.makeKeyAndVisible()
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
