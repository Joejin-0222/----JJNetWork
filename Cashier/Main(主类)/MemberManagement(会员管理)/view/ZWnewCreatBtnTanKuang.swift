//
//  ZWnewCreatBtnTanKuang.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/11.
//

import UIKit

class ZWnewCreatBtnTanKuang: UIView {
    
    
    //顶部
    lazy var titleLabel : UILabel = {
        
        let label = UILabel()
        label.text = "新建会员卡"
        return label
    }()
    
    //backView
    lazy var backView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "ffffff")
        return view
    }()
    //显示和输入框
    var LabelAndTextField :  ZWnewLabelAndTextField = ZWnewLabelAndTextField()
    
    //选择类型的textfield
    lazy var typeTextField: UITextField = {
        let  TF = UITextField()
        TF.text = "  电子会员卡"
        TF.font = UIFont.systemFont(ofSize: 20*WidthW)
        TF.textColor = Title_color
        TF.isEnabled = false
        return TF
    }()
    
    let bgView = UIView() //白色框动画控件
    
    let cancelBtn = UIButton() //取消按钮
    
    var titles: [(String, UIImage?)] = [
        ("浮光西安会员卡", UIImage(named: "user")),
        ("浮光上海会员卡", UIImage(named: "user")),
        ("浮光城都会员卡", UIImage(named: "user")),
        ("浮光北京会员卡", UIImage(named: "user")),
        ("浮光杭州会员卡", UIImage(named: "user")),
        ("浮光渭南会员卡", UIImage(named: "user"))
    ]
    
    
    lazy var oneL: UILabel = {
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "* 选择卡类型")
        
        let strSubAttr1: [NSMutableAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 1, green: 0.29, blue: 0.28,alpha:1.000000)]
        attrString.addAttributes(strSubAttr1, range: NSRange(location: 0, length: 2))

        let strSubAttr2: [NSMutableAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2,alpha:1.000000)]
        attrString.addAttributes(strSubAttr2, range: NSRange(location: 2, length: 5))

        label.attributedText = attrString
        return label
    }()
    
    lazy var towL: UILabel = {
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "* 手机号")
        
        let strSubAttr1: [NSMutableAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 1, green: 0.29, blue: 0.28,alpha:1.000000)]
        attrString.addAttributes(strSubAttr1, range: NSRange(location: 0, length: 2))

        let strSubAttr2: [NSMutableAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2,alpha:1.000000)]
        attrString.addAttributes(strSubAttr2, range: NSRange(location: 2, length: 3))

        label.attributedText = attrString
        return label
    }()
    
    lazy var thirdL: UILabel = {
        let label = UILabel()
        label.text = "姓名"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    lazy var fourL: UILabel = {
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "* 配送方式")
        
        let strSubAttr1: [NSMutableAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 1, green: 0.29, blue: 0.28,alpha:1.000000)]
        attrString.addAttributes(strSubAttr1, range: NSRange(location: 0, length: 2))

        let strSubAttr2: [NSMutableAttributedString.Key: Any] = [.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2,alpha:1.000000)]
        attrString.addAttributes(strSubAttr2, range: NSRange(location: 2, length: 4))

        label.attributedText = attrString
        return label
    }()
    
    lazy var towView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    lazy var thirdView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "ffffff")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    lazy var fourView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FAFAFA")
        return view
    }()
    
    lazy var phoneTF: UITextField = {
        let  TF = UITextField()
        TF.placeholder = "输入手机号"
        TF.font = UIFont.systemFont(ofSize: 20*WidthW)
        TF.textColor = Title_color
        TF.isEnabled = false
        return TF
    }()
    lazy var nameTF: UITextField = {
        let  TF = UITextField()
        TF.placeholder = "输入姓名"
        TF.font = UIFont.systemFont(ofSize: 20*WidthW)
        TF.textColor = Title_color
        TF.isEnabled = false
        return TF
    }()
    
    lazy var manBtn: UIButton = {
        let button = UIButton()
        button.setTitle("男", for: .normal)
        button.setImage(UIImage(named: "路径"), for: .normal)
        button.setImage(UIImage(named: "图标"), for: .selected)
        button.setTitleColor(Title_color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20*WidthW)
        button.addTarget(self, action: #selector(sexBtnClick(_:)), for: .touchUpInside)
        button.tag = 110
        return button
    }()
    
    lazy var womanBtn: UIButton = {
        let button = UIButton()
        button.setTitle("女", for: .normal)
        button.setImage(UIImage(named: "路径"), for: .normal)
        button.setImage(UIImage(named: "图标"), for: .selected)
        button.setTitleColor(Title_color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20*WidthW)
        button.addTarget(self, action: #selector(sexBtnClick(_:)), for: .touchUpInside)
        button.tag = 111
        return button
    }()
    
    lazy var lastBtn: UIButton = {
        let button = UIButton()
        button.setTitle("立即开通", for: .normal)
        button.setTitleColor(UIColor.init(hex: "ffffff"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
        button.layer.cornerRadius = 28*WidthW
        button.backgroundColor = MainColor
        button.addTarget(self, action: #selector(lastBtnClick(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func lastBtnClick(_ sender:UIButton){
        print("点击了立即开通按钮")
        let kaSuccessView:ZWKaSucessView = ZWKaSucessView().initView() as! ZWKaSucessView
        kaSuccessView.show()
    }
    
    @objc func sexBtnClick(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        if sender.tag == 110{
            womanBtn.isSelected = !sender.isSelected
        }else{
            manBtn.isSelected = !sender.isSelected
        }
    }
    
    init(title: String?, message: String?, cancelButtonTitle: String?, sureButtonTitle: String?,x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat ) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        createAlertView()
        
    }
    
    //MARK:创建
    func createAlertView() {
        ProgressHUD.hideHud()
        //布局
        self.frame = CGRect(x: x, y: y, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        
        //spring动画白底(弹出主体)
        
        let bgviewWidth = LeftItemWidth+OrderRightViewWidth+OrderTabelViewWidth
        
        bgView.frame = CGRect(x: (bgviewWidth)*WidthW, y: 0, width: ScreenWidth - (bgviewWidth)*WidthW, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.init(hex: "#FAFAFA")//背景色
        self.addSubview(bgView)
        bgView.isUserInteractionEnabled = true
        //
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bgView.snp.centerX)
            make.top.equalTo(self.snp.top).offset(102*WidthW)
            make.width.equalTo(160*WidthW)
            make.height.equalTo(60*WidthW)
        }
        //取消按钮 返回按钮
        cancelBtn.frame = CGRect(x: 63*WidthW, y: 70*WidthW, width: 92*WidthW, height: 92*WidthW)
        //        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        cancelBtn.addTarget(self, action: #selector(clickBtnAction(sender:)), for: .touchUpInside)
        bgView.addSubview(cancelBtn)
        
        //
//        backView.backgroundColor = UIColor.white
//        bgView.addSubview(backView)
//        backView.snp.makeConstraints { make in
//            make.bottom.equalTo(self.bgView.snp.bottom).offset(-482*WidthW)
//            make.top.equalTo(self.titleLabel.snp.top).offset(166*WidthW)
//            make.left.equalTo(self.bgView.snp.left).offset(325*WidthW)
//            make.right.equalTo(self.bgView.snp.right).offset(-325*WidthW)
//        }
        //
//        backView.addSubview(LabelAndTextField.initView())
        


        let textField = DropBoxTextField(frame: CGRect(x: 465*WidthW, y: 296*WidthW, width: 360*WidthW, height: 64*WidthW), customTextField: self.typeTextField)
        bgView.addSubview(textField)
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        /// 设置选项内容
        textField.count = titles.count
        textField.itemForRowAt = { [weak self] (index) -> (String, UIImage?) in
            guard let title = self?.titles[index].0 else {
                return ("", nil)
            }
            return (title, nil);
        }
        textField.didSelectedAt = { (index, title, textField) in
            print("选中第 \(index) 行，标题 \(title)")
            textField.drawUp()
        }
        
        bgView.addSubview(self.oneL)
        oneL.snp.makeConstraints { make in
            make.right.equalTo(textField.snp.left).offset(-24*WidthW)
            make.top.equalToSuperview().offset(296*WidthW)
            make.height.equalTo(64*WidthW)
        }
        
        bgView.addSubview(self.towView)
        towView.snp.makeConstraints { make in
            make.left.right.equalTo(textField)
            make.height.equalTo(64*WidthW)
            make.top.equalToSuperview().offset(384*WidthW)
        }
        towView.addSubview(self.phoneTF)
        phoneTF.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15*WidthW)
            make.top.right.bottom.equalToSuperview()
        }
        
        bgView.addSubview(self.towL)
        towL.snp.makeConstraints { make in
            make.right.equalTo(towView.snp.left).offset(-24*WidthW)
            make.height.equalTo(64*WidthW)
            make.centerY.equalTo(towView.snp.centerY)

        }

        bgView.addSubview(self.thirdView)
        thirdView.snp.makeConstraints { make in
            make.left.right.equalTo(textField)
            make.height.equalTo(64*WidthW)
            make.top.equalTo(towView.snp.bottom).offset(24*WidthW)
        }

        thirdView.addSubview(self.nameTF)
        nameTF.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10*WidthW)
            make.top.right.bottom.equalToSuperview()
        }

        bgView.addSubview(self.thirdL)
        thirdL.snp.makeConstraints { make in
            make.right.equalTo(thirdView.snp.left).offset(-24*WidthW)
            make.height.equalTo(64*WidthW)
            make.centerY.equalTo(thirdView.snp.centerY)
        }


        bgView.addSubview(self.fourView)
        fourView.snp.makeConstraints { make in
            make.left.right.equalTo(textField)
            make.height.equalTo(64*WidthW)
            make.top.equalTo(thirdView.snp.bottom).offset(24*WidthW)
        }

        bgView.addSubview(self.fourL)
        fourL.snp.makeConstraints { make in
            make.right.equalTo(fourView.snp.left).offset(-24*WidthW)
            make.height.equalTo(64*WidthW)
            make.centerY.equalTo(fourView.snp.centerY)
        }

        fourView.addSubview(self.manBtn)
        manBtn.snp.makeConstraints { make in
            make.left.centerY.equalToSuperview()
            make.width.equalTo(80*WidthW)
            make.height.equalTo(40*WidthW)
        }
        
        fourView.addSubview(self.womanBtn)
        womanBtn.snp.makeConstraints { make in
            make.left.equalTo(self.manBtn.snp.right).offset(24*WidthW)
            make.height.equalTo(40*WidthW)
            make.width.equalTo(80*WidthW)
            make.centerY.equalToSuperview()
        }
        
        bgView.addSubview(self.lastBtn)
        lastBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-80*WidthW)
            make.width.equalTo(184*WidthW)
            make.height.equalTo(56*WidthW)
        }
    }
    
    
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    
    //MARK:按键的对应的方法
    @objc func clickBtnAction( sender : UIButton) {
        
        dismiss()
    }
    //MARK:消失
    @objc func dismiss() {
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.bgView.alpha = 0
            self.alpha = 0
        }, completion: { (finish) -> Void in
            if finish {
                self.removeFromSuperview()
            }
        })
    }
    /** 指定视图实现方法 */
    func show() {
        let wind = UIApplication.shared.keyWindow
        self.alpha = 0
        
        wind?.addSubview(self)
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.alpha = 1
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
