//
//  UIButton+Extension.swift
//  XJSwiftKit
//
//  Created by Mr.Yang on 2021/10/14.
//

import UIKit



// MARK: - Create
public extension XJExtension where Base: UIButton {
    /// UIButton创建
    /// - Parameters:
    ///   - bgColor: 背景颜色
    ///   - imageName: 图片
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - font: 字体大小
    /// - Returns: UIButton
    static func create(bgColor: UIColor = UIColor.white,
                     imageName: String? = nil,
                     title: String? = nil,
//                     titleColor: UIColor = Color_333333_333333,
                     font: CGFloat = 16) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = bgColor
        if let imageName = imageName {
            button.setImage(UIImage(named: imageName), for: .normal)
        }
        if let title = title {
            button.setTitle(title, for: .normal)
        }
//        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: font)
        return button
    }
}




// MARK:- 二、链式调用
public extension UIButton {
    
    /*
    枚举 设置 图片的位置
    */
    enum ButtonImagePosition : Int{
     
        case PositionTop = 0
        case Positionleft
        case PositionBottom
        case PositionRight
    }
    
    
    // MARK: 2.1、设置title
    /// 设置title
    /// - Parameters:
    ///   - text: 文字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func title(_ text: String, _ state: UIControl.State = .normal) -> Self {
        setTitle(text, for: state)
        return self
    }
    
    // MARK: 2.2、设置文字颜色
    /// 设置文字颜色
    /// - Parameters:
    ///   - color: 文字颜色
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func textColor(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    // MARK: 2.3、设置字体大小(UIFont)
    /// 设置字体大小
    /// - Parameter font: 字体 UIFont
    /// - Returns: 返回自身
    @discardableResult
    func font(_ font: UIFont) -> Self {
        titleLabel?.font = font
        return self
    }
    
    // MARK: 2.4、设置字体大小(CGFloat)
    /// 设置字体大小(CGFloat)
    /// - Parameter fontSize: 字体的大小
    /// - Returns: 返回自身
    @discardableResult
    func font(_ fontSize: CGFloat) -> Self {
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return self
    }
    
    // MARK: 2.5、设置字体粗体
    /// 设置粗体
    /// - Parameter fontSize: 设置字体粗体
    /// - Returns: 返回自身
    @discardableResult
    func boldFont(_ fontSize: CGFloat) -> Self {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        return self
    }
    
    // MARK: 2.6、设置图片
    /// 设置图片
    /// - Parameters:
    ///   - image: 图片
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.7、设置图片(通过Bundle加载)
    /// 设置图片(通过Bundle加载)
    /// - Parameters:
    ///   - bundle: Bundle
    ///   - imageName: 图片名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(in bundle: Bundle? = nil, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.8、设置图片(通过Bundle加载)
    /// 设置图片(通过Bundle加载)
    /// - Parameters:
    ///   - aClass: className bundle所在的类的类名
    ///   - bundleName: bundle 的名字
    ///   - imageName: 图片的名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.10、设置背景图片
    /// 设置背景图片
    /// - Parameters:
    ///   - image: 图片
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    // MARK: 2.11、设置背景图片(通过Bundle加载)
    /// 设置背景图片(通过Bundle加载)
    /// - Parameters:
    ///   - aClass: className bundle所在的类的类名
    ///   - bundleName: bundle 的名字
    ///   - imageName: 图片的名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        setBackgroundImage(image, for: state)
        return self
    }
    
    // MARK: 2.12、设置背景图片(通过Bundle加载)
    /// 设置背景图片(通过Bundle加载)
    /// - Parameters:
    ///   - bundle: Bundle
    ///   - imageName: 图片的名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(in bundle: Bundle? = nil, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        setBackgroundImage(image, for: state)
        return self
    }
    
    /**
    imageName:图片的名字
    title：button 的名字
    type ：image 的位置
    Space ：图片文字之间的间距
    */
        func setImageAndTitle(imageName:String,title:String,type:ButtonImagePosition,Space space:CGFloat)  {
          
            self.setTitle(title, for: .normal)
            self.setImage(UIImage(named:imageName), for: .normal)
            
            let imageWith :CGFloat = (self.imageView?.frame.size.width)!;
            let imageHeight :CGFloat = (self.imageView?.frame.size.height)!;
          
            var labelWidth :CGFloat = 0.0;
            var labelHeight :CGFloat = 0.0;

            labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
            labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);

            var  imageEdgeInsets :UIEdgeInsets = UIEdgeInsets();
            var  labelEdgeInsets :UIEdgeInsets = UIEdgeInsets();
           
            switch type {
            case .PositionTop:
                imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth);
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space/2.0, right: 0);
                break;
            case .Positionleft:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
                labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
                break;
            case .PositionBottom:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth);
                labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0, right: 0);
                break;
            case .PositionRight:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space+25*WidthW, bottom: 0, right: -labelWidth-space/2.0);
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0 - 50*WidthW, bottom: 0, right: imageWith+space/2.0);
                break;
            }
            
            // 4. 赋值
            self.titleEdgeInsets = labelEdgeInsets;
            self.imageEdgeInsets = imageEdgeInsets;
        }
    
}


