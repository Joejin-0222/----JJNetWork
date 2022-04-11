//
//  UserInfo.swift
//  Cashier
//
//  Created by mac on 2022/3/14.
//

import UIKit

class UserInfo:  NSObject, NSCoding {
    var status :Int64 = 0 //
    var creator :Int64 = 0 //
    var ifPush :Int64 = 0//
    var nickname :String = "" //
    var updateTime :Int64 = 0 //
    var headPhone :String = "" //
    var shopId :Int64 = 0 //
    var isNew :Int64 = 0 //
    var umengToken :String = "" //
    var openAutoPoi : Int64 = 0
    var viewId :Int64 = 0 //
    var type :Int64 = 0 //
    var id :Int64 = 0 //
    var tenantId :Int64 = 0 //
    var token :String = "" //
    var lastLoginTime :Int64 = 0 //
    var phone :String = ""
    var avatar :String = ""
    var modifier :Int64 = 0 //
    var createTime :Int64 = 0 //
    var password :String = ""
    var username :String = ""
    var lastAccessTenant :String = ""
    var state :String = ""
    var poiIdList :String = ""
    var role :Int64 = 0
    var code :Int64 = 0
        
    override init() {}
    
    func encode(with coder: NSCoder) {
        coder.encode(status, forKey: "status")
        coder.encode(creator, forKey: "creator")
        coder.encode(ifPush, forKey: "ifPush")
        
        coder.encode(nickname, forKey: "nickname")
        coder.encode(updateTime, forKey: "updateTime")
        coder.encode(headPhone, forKey: "headPhone")
        
        coder.encode(shopId, forKey: "shopId")
        coder.encode(isNew, forKey: "isNew")
        coder.encode(umengToken, forKey: "umengToken")
        
        coder.encode(openAutoPoi, forKey: "openAutoPoi")
        coder.encode(viewId, forKey: "viewId")
        coder.encode(type, forKey: "type")
        
        coder.encode(id, forKey: "id")
        coder.encode(tenantId, forKey: "tenantId")
        coder.encode(token, forKey: "token")
        
        coder.encode(lastLoginTime, forKey: "lastLoginTime")
        coder.encode(phone, forKey: "phone")
        coder.encode(avatar, forKey: "avatar")
        
        coder.encode(modifier, forKey: "modifier")
        coder.encode(createTime, forKey: "createTime")
        coder.encode(password, forKey: "password")
        
        coder.encode(username, forKey: "username")
        coder.encode(lastAccessTenant, forKey: "lastAccessTenant")
        coder.encode(state, forKey: "state")
        
        coder.encode(poiIdList, forKey: "poiIdList")
        coder.encode(role, forKey: "role")
        coder.encode(code, forKey: "code")
        
    }

    required init(coder: NSCoder) {
        self.status = coder.decodeInt64(forKey: "status")
        self.creator = coder.decodeInt64(forKey: "creator")
        self.ifPush = coder.decodeInt64(forKey: "ifPush")
        self.nickname = coder.decodeObject(forKey: "nickname") as! String
        self.updateTime = coder.decodeInt64(forKey: "updateTime")
        self.headPhone = coder.decodeObject(forKey: "headPhone") as! String
        self.shopId = coder.decodeInt64(forKey: "shopId")
        self.isNew = coder.decodeInt64(forKey: "isNew")
        self.umengToken = coder.decodeObject(forKey: "umengToken") as! String
        self.openAutoPoi = coder.decodeInt64(forKey: "openAutoPoi")
        self.viewId = coder.decodeInt64(forKey: "viewId")
        self.type = coder.decodeInt64(forKey: "type")
        self.id = coder.decodeInt64(forKey: "id")
        self.tenantId = coder.decodeInt64(forKey: "tenantId")
        self.token = coder.decodeObject(forKey: "token") as! String
        self.lastLoginTime = coder.decodeInt64(forKey: "lastLoginTime")
        self.phone = coder.decodeObject(forKey: "phone") as! String
        self.avatar = coder.decodeObject(forKey: "avatar") as! String
        self.modifier = coder.decodeInt64(forKey: "modifier")
        self.createTime = coder.decodeInt64(forKey: "createTime")
        self.password = coder.decodeObject(forKey: "password") as! String
        self.username = coder.decodeObject(forKey: "username") as! String
        self.lastAccessTenant = coder.decodeObject(forKey: "lastAccessTenant") as! String
        self.state = coder.decodeObject(forKey: "state") as! String
        self.poiIdList = coder.decodeObject(forKey: "poiIdList") as! String
        self.role = coder.decodeInt64(forKey: "role")
        self.code = coder.decodeInt64(forKey: "code")
    }
}
