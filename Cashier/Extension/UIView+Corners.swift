//
//  UIView+Corners.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

extension UIView {

    public func drawline(offset offsetx:CGFloat) {
        /// 获得CGContext，相当于画笔的角色
        let context = UIGraphicsGetCurrentContext()!
        
        /// 画底线
        context.move(to: CGPoint(x:offsetx, y:self.frame.height - 0.2))
//        context.addLine(to: CGPoint(x:XLDevice.deviceWidth - offsetx, y:self.frame.height - 0.2))
        context.setLineWidth(0.2)
//        context.setStrokeColor(XLColor.colorEFEFEF.cgColor)
        context.strokePath()
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        
        let path:UIBezierPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
    }
    
    /// 圆角
    func cornerRadius(cornerRadius:CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    //设置部分圆角
    func setRoundCorners(corners:UIRectCorner,with radii:CGFloat){
        let bezierpath:UIBezierPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let shape:CAShapeLayer = CAShapeLayer.init()
        shape.path = bezierpath.cgPath
        
        self.layer.mask = shape
        self.layer.masksToBounds = true
    }
    
    func setRoundCorners(_ image: UIImage,withRadius radius: CGFloat, corners:UIRectCorner) -> UIImage? {
        let rect = CGRect(x: 0,
                          y: 0,
                          width: (image.size.width),
                          height: (image.size.height))
        //开启上下文
        UIGraphicsBeginImageContext((image.size))
        //设置一个圆形的裁剪区域
        let path:UIBezierPath = UIBezierPath.init(roundedRect: rect,
                                                        byRoundingCorners: corners,
                                                        cornerRadii: CGSize(width: radius, height: radius))

        //把路径设置为裁剪区域(超出裁剪区域以外的内容会被自动裁剪掉)
        path.addClip()
        //把图片绘制到上下文当中
        image.draw(at: CGPoint.zero)
        //从上下文当中生成一张图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        return newImage
    }

    /// 圆角, 边框
    func cornerRadius(cornerRadius:CGFloat, borderColor:UIColor, borderWidth:CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
    
    func shadow(shadowColor:UIColor, shadowOffset:CGSize, shadowRadius:CGFloat, shadowOpacity:Float) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
 
    func maskLayer(opacity:CGFloat, rect:CGRect) {
        let path = UIBezierPath.init(roundedRect: rect, cornerRadius: 0)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.opacity = Float(opacity)
        self.layer.addSublayer(shapeLayer)
    }

}
