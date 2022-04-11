//
//  UIbutton+Extension.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import Foundation
import UIKit

/*
枚举 设置 图片的位置
*/
enum ButtonImagePosition : Int{
 
    case PositionTop = 0
    case Positionleft
    case PositionBottom
    case PositionRight
}

extension UIButton {
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
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0 - 25*WidthW, bottom: 0, right: imageWith+space/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
}
