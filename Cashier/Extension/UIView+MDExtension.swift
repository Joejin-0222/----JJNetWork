//
//  UIView+MDExtension.swift
//  Swift-Base
//
//  Created by 卢荫豪 on 2019/5/12.
//  Copyright © 2019 时代漫游. All rights reserved.
//

import UIKit

extension UIView {
    
    var x : CGFloat {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.origin.x
        }
    }
    
    var y : CGFloat {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.origin.y
        }
    }
    
    var width : CGFloat {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.size.width
        }
    }
    
    var height : CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.size.height
        }
    }
    
    var size : CGSize {
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.size
        }
    }
    
    var centerX : CGFloat {
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
        
        get {
            return self.center.x
        }
    }
    
    var centerY : CGFloat {
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
        
        get {
            return self.center.y
        }
    }

}
