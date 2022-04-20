//
//  Cache+User.swift
//  CloudSiteApp
//
//  Created by Kral on 18/3/21.
//

import Foundation

extension Cache {
    

    
    
    /// 收银台分段选择数据
    static var SementData: ZWCheckSementModelJoe? {
        get {
            guard isLogin else { return nil }
            return self.sementData.get(type: ZWCheckSementModelJoe.self)
        }
        set {
           
            self.sementData.save(item: newValue)
        }
    }
   
    
    
    /// 登录保存店铺数据
    static var userSto: SelectStoreModelZJ? {
        get {
            guard isLogin else { return nil }
            return self.userStore.get(type: SelectStoreModelZJ.self)
        }
        set {
           
            self.userStore.save(item: newValue)
        }
    }
   
 
    /// 登录或者注册后缓存的用户信息
    static var user: LoginModel? {
        get {
            guard isLogin else { return nil }
            return self.userKey.get(type: LoginModel.self)
        }
        set {
            guard let newValue = newValue,
                newValue.token != nil else {
                
                self.userKey.clear()
                isLogin = false
                return
            }
            
            isLogin = true
            self.userKey.save(item: newValue)
        }
    }
    
    /// 是否登录
    static var isLogin: Bool {
        get {
            if let cached = self.isLoginKey.get(type: Bool.self) {
                return cached
            }
            return false
        }
        set {
            self.isLoginKey.save(item: newValue)
        }
    }
    
    /// cookie
    static var cookie: [String: String] {
        get {
            if let cookie = self.cookieKey.get(type: [String: String].self) {
                return cookie
            }
            return [:]
        }
        set {
            self.cookieKey.save(item: newValue)
        }
    }
    
    static var cookieString: String {
        get {
            var kvs: [String] = []
            for item in cookie {
                if item.key == "locale" {
                    let userDefault = UserDefaults.standard
                    let languages:NSArray = userDefault.object(forKey: "AppleLanguages") as! NSArray
                    let languageStr = languages.object(at: 0) as! String
                    let sub1 = String(languageStr.prefix(2))
                    
                    if sub1 == "ar" || sub1 == "en" {
                        kvs.append("\(item.key)=en")//\(sub1) //修改 去掉 阿语
                    }else{
                        kvs.append("\(item.key)=en")
                    }
                } else {
                    kvs.append("\(item.key)=\(item.value)")
                }
            }
            
            var cookieStr = kvs.joined(separator: ";")
            print("kvscookie = \(cookie)")
            //cookie里面不设置locale的语言, 服务端默认返回的是HKD
            if cookieStr == "" {
                if let languages:NSArray = UserDefaults.standard.object(forKey: "AppleLanguages") as? NSArray {
                    let languageStr = languages.object(at: 0) as! String
                    let sub1 = String(languageStr.prefix(2))
                    if sub1 == "ar" || sub1 == "en" {
                        cookieStr = "locale=en" //"locale=\(sub1)" //修改 去掉 阿语
                    }else{
                        cookieStr = "locale=en"
                    }
                }
            }
            return cookieStr
        }
    }
    
    static var cartNumber: Int {
        get {
            return self.cartNumberKey.get(type: Int.self) ?? 0
        }
        set {
            self.cartNumberKey.save(item: newValue)
        }
    }
}
