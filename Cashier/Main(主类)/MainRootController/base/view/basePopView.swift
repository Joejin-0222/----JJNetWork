//
//  basePopView.swift
//  Cashier
//
//  Created by mac on 2022/4/13.
//

import UIKit

class basePopView: UIView {
    var flag:Bool = false
    //承接子视图的view
    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius  = 10
        view.clipsToBounds = true
        return view
        
    }()
    //关闭按钮
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "icon关闭"), for: .normal)
        btn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        return btn
    }()
    let delegate  = UIApplication.shared.delegate as! AppDelegate
    //关闭按钮的方法
    @objc func closeBtnClick(){
        self.alpha = 0;
        self.isHidden = true
        self.removeFromSuperview()
//        delegate.window?.viewWithTag(1012)?.removeFromSuperview()
    }
    
    func initView()->UIView{
                
        self.tag = 1012;
        self.frame = CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        
        self.backgroundColor = UIColor.init(hex: "#131314").alpha(0.65)
        
        self.addSubview(self.backView)
        self.backView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(1000*WidthW)
            make.height.equalTo(824*HeighH)
        }
        
        self.addSubview(self.closeBtn)
        self.closeBtn.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(-50*HeighH)
            make.right.equalTo(backView.snp.right).offset(-10*WidthW)
            make.width.height.equalTo(50*WidthW)
        }
       
        self.configUI()
        
        return self
    }
    /** 指定视图实现方法 */
    func show() {
        
        delegate.window?.addSubview(self)

        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.alpha = 1
        })
    }
    
    //可以重写方法，配置view
    func configUI(){
        
    }
    

    
    //点击背景色直接删除
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch:AnyObject in touches{

            //获取用户点击的坐标

            var point = (touch as AnyObject).location(in: self)

            //将用户点击的点坐标，从self.view.layer转换到mV.View.layer的点坐标

            point = backView.layer.convert(point, from: self.layer)

            print("point\(point)")

            let point2 = backView.layer.convert(point, to: self.layer)

            print("point2\(point2)")

            if backView.layer.contains(point ){
                print(1)
            }else{
                self.closeBtnClick()
            }
        }
    }

}
