//
//  ZWCheckOutStoreModelJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/19.
//

import UIKit

class ZWCheckOutStoreModelJoe: RootModel {


        let pages : Int = 0

        let pageSize : Int = 0

       let pageData : [PagedataModel] = []

        let total : Int = 0

        let pageNum : Int = 0

}

class PagedataModel: RootModel  {

    let specBarcode : String = ""

    let skuViewId : String = ""

    let spuViewId : String = ""

    let specs : String = ""

    let imageUrl : String = ""

    let categoryId : Int = 0

    let spuDirectoryParams : String = ""

    let currentStock : Int = 0

    let skuBaseViewId : String = ""

    let originalPrice : Int = 0

    let customCode : String = ""

    let goodsName : String = ""

    let name : String = ""

    let salePrice : Int = 0

    let isItGspGoods : Int = 0

}

