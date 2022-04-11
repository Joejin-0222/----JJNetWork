//
//  ZWChooseGoodsClassTanKuangView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import UIKit

//import Spring
class ZWChooseGoodsClassTanKuangView: UIView {

    /// 根据RGBA生成颜色(格式为：22,22,22,0.5)
    var SM_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
    }

    typealias clickAlertClosure = (_ index: Int) -> Void //声明闭包，点击按钮传值
    //把申明的闭包设置成属性
    var clickClosure: clickAlertClosure?
    //为闭包设置调用函数
    func clickIndexClosure(_ closure:clickAlertClosure?){
        //将函数指针赋值给myClosure闭包
        clickClosure = closure
    }


    let Screen_width = UIScreen.main.bounds.size.width
    let Screen_height = UIScreen.main.bounds.size.height
    let bgView = UIView() //白色框动画控件
    let titleLabel = UILabel() //标题按钮
    let contentLabel = UILabel() //显示内容
    var title = "" //标题
    var content = "" //内容
    let cancelBtn = UIButton() //取消按钮
    let sureBtn = UIButton() //确定按钮
    let Bgtap = UITapGestureRecognizer() //点击手势

    let scrollview = UIScrollView() //滚动视图层

    init(title: String?, message: String?, cancelButtonTitle: String?, sureButtonTitle: String?,x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat ) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        createAlertView()
        self.titleLabel.text = title

        /**设置 UILable的行间距 **/
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为28
        paraph.lineSpacing = 10
        //样式属性集合
        let attributes = [kCTFontAttributeName:UIFont.systemFont(ofSize: 15),
                kCTParagraphStyleAttributeName: paraph]
        self.contentLabel.attributedText = NSAttributedString(string: message!, attributes: attributes as [NSAttributedString.Key : Any])
        //self.contentLabel.text = message


        self.cancelBtn.setTitle(cancelButtonTitle, for: UIControl.State())
        self.sureBtn.setTitle(sureButtonTitle, for: UIControl.State())
    }

    //MARK:创建
    func createAlertView() {
        //布局
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        Bgtap.addTarget(self, action: #selector(ZWChooseGoodsClassTanKuangView.dismiss))
        self.addGestureRecognizer(Bgtap)
        //spring动画白底(弹出主体)
        bgView.frame = CGRect(x: 0, y: 0, width: width, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.white//背景色
        bgView.layer.cornerRadius = 9
        bgView.clipsToBounds = true

//        bgView.animation = "pop"
//        bgView.curve = "Spring"
//        bgView.duration = 1.0
//        bgView.damping = 0.7
//        bgView.velocity = 0.7
//        bgView.force = 0.3
//        bgView.animate()

        self.addSubview(bgView)
        let width = bgView.frame.size.width
        let height = bgView.frame.size.height
        //标题
        titleLabel.frame = CGRect(x: 0, y: 15, width: width, height: 25)
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.textAlignment = .center
        bgView.addSubview(titleLabel)

        //滚动视图层
        scrollview.frame = CGRect(x: 24, y: 30, width: width, height: height - 70)
        bgView.addSubview(scrollview)

        //内容
        //contentLabel.frame = CGRect(x: 24, y: 56, width: width - 48, height: 68)
        let scrollHeight = scrollview.frame.size.height
        contentLabel.frame = CGRect(x: 0, y: 0, width:width - 48, height: scrollHeight)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 17)
        scrollview.addSubview(contentLabel)
        //取消按钮
        let btnWith = (width - 30) / 2
        cancelBtn.frame = CGRect(x: 10, y: scrollHeight + 20, width: btnWith, height: 45)
        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.addTarget(self, action: #selector(clickBtnAction(_:)), for: .touchUpInside)
        bgView.addSubview(cancelBtn)
        //确认按钮
        sureBtn.frame = CGRect(x: btnWith + 20 , y: scrollHeight + 20, width: btnWith, height: 45)
        sureBtn.backgroundColor = UIColor.yellow
        sureBtn.setTitleColor(UIColor.black, for: UIControl.State())
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        sureBtn.layer.cornerRadius = 3
        sureBtn.clipsToBounds = true
        sureBtn.tag = 2
        sureBtn.addTarget(self, action: #selector(clickBtnAction(_:)), for: .touchUpInside)
        bgView.addSubview(sureBtn)
    }

    //MARK:按键的对应的方法
    @objc func clickBtnAction(_ sender: UIButton) {
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
