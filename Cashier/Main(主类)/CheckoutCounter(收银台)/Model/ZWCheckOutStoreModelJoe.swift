//
//  ZWCheckOutStoreModelJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/19.
//

import UIKit

class ZWCheckOutStoreModelJoe: RootModel {
    
    
    var pages : Int = 0
    
    var pageSize : Int = 0
    
    var pageData : [PagedataModel] = []
    
    var total : Int = 0
    
    var pageNum : Int = 0

}

class PagedataModel: RootModel  {
    
    var specBarcode : String = ""
    
    var skuViewId : String = ""
    
    var spuViewId : String = ""
    
    var specs : String = ""
    
    var imageUrl : String = ""
    
    var categoryId : Int = 0
    
    var spuDirectoryParams : String = ""
    
    var currentStock : Int = 0
    
    var skuBaseViewId : String = ""
    
    var originalPrice : Int = 0
    
    var customCode : String = ""
    
    var goodsName : String = ""
    
    var name : String = ""
    
    var salePrice : Int = 0
    
    var isItGspGoods : Int = 0
}

