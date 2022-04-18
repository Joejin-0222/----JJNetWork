//
//  Cache.swift
//  CloudSiteApp
//
//  Created by Kral on 16/3/21.
//

import Foundation

import HandyJSON

/// 缓存层
/// 注意，这里只能存储遵循 HandyJSON 的类型的对象和一些遵循 NSCoding 的基本类型的对象
enum Cache: String {
    
    /// 存储方法
    ///
    /// - Parameter
    /// - item: 存储的对象
    func save(item : Any?) {
        
        guard let item = item else { return }
        
        var toSaveValue: NSCoding? = nil
        
        if item is HandyJSON {
            // 单纯的数据模型的存储
            let model = item as! HandyJSON
            if let toSaveJSONString = model.toJSONString() {
                toSaveValue = toSaveJSONString as NSCoding?
            }
        } else if item is NSCoding {
            // 是可以直接存储的内容，比如 String, Int 等遵循 NSCoding 协议的类型
            toSaveValue = (item as! NSCoding)
        }
        
        // 保存
        if  let toSaveValue = toSaveValue {
            PINCache.shared.setObjectAsync(toSaveValue, forKey: rawValue, completion: nil)
        }
    }
    
    /// 获取数据
    ///
    /// - Parameters:
    ///   - type: 获取的数据要被转换的类型
    /// - Returns: DataType
    func get<D>(type: D.Type) -> D? {
        let cachedValue = PINCache.shared.object(forKey: rawValue)
        
        // 是一个模型
        if type is HandyJSON.Type,
            let cachedString = cachedValue as? String,
            let handyJsonType = type as? HandyJSON.Type {
            return handyJsonType.deserialize(from: cachedString) as? D
        }
        
        // 是一个不需要转换的类型
        return cachedValue as? D
    }
    
    /// 清理缓存
    func clear() {
        PINCache.shared.removeObject(forKey: rawValue)
    }
    
    case sementData = "sementData"//收银台分段选择数据
    case userStore = "userStore"//店铺信息数据
    case isLoginKey = "isLoginKey"
    case userKey = "loginUserKey"//登录用户数据
    case currentCurrencyKey = "currentCurrencyKey"
    case currencyListKey = "currencyListKey"
    case isAutoSettedCurrencyKey = "isAutoSettedCurrencyKey"
    case cookieKey = "cookieKey"
    case currentLanguageKey = "currentLanguageKey"
    case cartNumberKey = "cartNumberKey"
    
    // debug
    case testVersionSwitchKey = "testVersionSwitchKey"
    case showDebugEntryKey = "showDebugEntryKey"
}
