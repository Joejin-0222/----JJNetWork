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
    
    //rightline
    lazy var rightline : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "E6E9EB")
        
        return view
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
   
      
      let cancelBtn = UIButton() //取消按钮
      let DeleteBtn = UIButton() //删除按钮
      let sureBtn = UIButton() //确定按钮
      let JieSuanBtn = UIButton() //结算按钮
      let Bgtap = UITapGestureRecognizer() //点击手势
      
    
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
    
        
//        //
//        //右边分割线
//        bgView.addSubview(rightline)
//        rightline.snp.makeConstraints { make in
//            make.bottom.equalTo(self.bgView.snp.bottom)
//            make.top.equalTo(self.bgView.snp.top)
//            make.left.equalTo((  OrderTabelViewWidth) *  WidthW)
//            make.width.equalTo(1.5*WidthW)
//        }
//
        
        //取消按钮 返回按钮
        //        let btnWith = (width - 30) / 2
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
