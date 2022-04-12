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
    
    
    
    let bgView = UIView() //白色框动画控件
    
    let cancelBtn = UIButton() //取消按钮
    
    
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
        backView.backgroundColor = UIColor.white
        bgView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.bottom.equalTo(self.bgView.snp.bottom).offset(-482*WidthW)
            make.top.equalTo(self.titleLabel.snp.top).offset(166*WidthW)
            make.left.equalTo(self.bgView.snp.left).offset(325*WidthW)
            make.right.equalTo(self.bgView.snp.right).offset(-325*WidthW)
        }
        //
//        backView.addSubview(LabelAndTextField.initView())
        
        
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
