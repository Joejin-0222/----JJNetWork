//
//  ZWOrderShouKuanTanKuang.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/13.
//

import UIKit

class ZWOrderShouKuanTanKuang: UIView ,SementSelectClickDelegate{
    
    var dataAarry  : NSArray? = []

    //顶部 分段选择器
    
    let testSementView : ZWCheckSementViewJoe =  ZWCheckSementViewJoe()
    //
    lazy var topline : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#EBEDF0")
        return view
    }()
    //
    //取消收款
    lazy var QuDanBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("取单收款", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
        Btn.setTitleColor(MainColor, for: .normal)
        Btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return Btn
    }()
    
    typealias clickAlertClosure = (_ index: Int) -> Void //声明闭包，点击按钮传值
    //把申明的闭包设置成属性
    var clickClosure: clickAlertClosure?
    //为闭包设置调用函数
    func clickIndexClosure(_ closure:clickAlertClosure?){
        //将函数指针赋值给myClosure闭包
        clickClosure = closure
    }
    
    let bgView = UIView() //白色框动画控件
   
    
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat ) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
  
        createAlertView()
    }
    
    //MARK:创建
    func createAlertView() {
        
        //布局
        self.frame = CGRect(x: x, y: y, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
  
        //spring动画白底(弹出主体)
        bgView.frame = CGRect(x: (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW, y: 0, width: ScreenWidth, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        bgView.layer.cornerRadius = 0
        bgView.clipsToBounds = true
     
        
        self.addSubview(bgView)
        bgView.isUserInteractionEnabled = true
     
       
        //一级分类
        testSementView.delegate = self//遵守点击分段选择代理
        testSementView.YesNetWork = false //是网络数据
        testSementView.SelectTextColor =  "#FE4B48"
        testSementView.columnNum = 5 //设置为两列
        testSementView.IsHiddenFenGeLine = true //是否显示分割xian
        bgView.addSubview(testSementView.initView())
        testSementView.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left).offset(30*WidthW)
            make.top.equalTo(124*WidthW)
            make.height.equalTo(92*WidthW)
            make.right.equalTo(self.snp.right).offset(-30*WidthW)
        }
        testSementView.dataAarry =  ["扫码收款","现金收款","现金收款","会员卡收款","标记收款"]
        self.testSementView.ReloadData()
        testSementView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        
        bgView.addSubview(topline)
        topline.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left)
            make.right.equalTo(bgView.snp.right)
            make.height.equalTo(3*WidthW)
            make.top.equalTo(testSementView.snp.bottom).offset(-22*WidthW)
        }
        //
        //取单
        QuDanBtn.cornerRadius(cornerRadius: 32*WidthW, borderColor:MainColor, borderWidth: 1)
        self.addSubview(QuDanBtn)
        QuDanBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-104*WidthW)
            make.centerX.equalTo(testSementView.snp.centerX)
            make.width.equalTo(216*WidthW)
            make.height.equalTo(64*WidthW)
        }
        
    }
    
    
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    
    //MARK:按键的对应的方法
    @objc func clickBtnAction( sender : UIButton) {
        if (clickClosure != nil) {
            clickClosure!(sender.tag)
        }
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

