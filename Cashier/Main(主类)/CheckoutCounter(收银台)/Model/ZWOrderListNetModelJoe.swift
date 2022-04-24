//
//  ZWOrderListNetModelJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/24.
//

import UIKit

class ZWOrderListNetModelJoe: RootModel {
    
    let industry : Int = 0
    
    let  shouldPayPrice : Double = 0.00 //实际收款金额
    
    let timestamp : Int = 0
    
    let goodsVoList : [GoodsvolistModel] = []
    
    let canDeliveryGapPrice : Double = 0.00
    
    let discountPrices : Double = 0.00
    
    let deliveryPrice : Double = 0.00
    
    let totalPrice : Float = 0.00 //总价格
    
    let shouldPayIntegralNum : Int = 0
    
    let freeDeliveryGapPrice : Double = 0.00
    
    let promotionPrice : Double = 0.00
    
    //优惠 = totalPrice - shouldPayPrice
}
class GoodsvolistModel : RootModel{
    
    
    let remake : String = ""
    
    let totalPromotionPrice : Double = 0.00 //单个 商品 优惠
    
    let nature : String = ""
    
    let num : Int = 0
    
    let refundNum : Int = 0
    
    let orderId : String = ""
    
    let goodsId : String = ""
    
    let discountPrice : Double = 0.00
    
    let price : Int = 0
    
    let promotionRemark : Int = 0
    
    let spuId : String = ""
    
    let totalPrice : Double = 0.00 //单个商品总价
    
    //优惠
}



