//
//Created by ESJsonFormatForMac on 22/04/24.
//

import UIKit


class ZWDailyModel : RootModel{

    var workTime: String?

    var cashierTopUpDataVo: Cashiertopupdatavo?

    var notCouponCodeCount: Int = 0

    var tagOrderSum: Int = 0

    var cashierSalesDataVo: Cashiersalesdatavo?

    var tagTotalMoney: Int = 0

    var handoverStatus: Int = 0

    var cancelCouponSum: Cancelcouponsum?

    var biaojiOrderPayList: [String]?

    var endTime: String?

    var cashierGatheringDataVoList: String?

    var roleName: String?

    var viewId: String?

    var headPortrait: String?

    var account: String?

    var nickNime: String?

    var firstWorkTime: String?
    required init() {}

}

class Cashiertopupdatavo : RootModel{

    var cashierPaymentDataVo: [String]?

    var num: Int = 0

    var payAmount: Int = 0

    var giveAmount: Int = 0
    required init() {}

}

class Cancelcouponsum : RootModel{

    var meituan: Int = 0

    var meiling: Int = 0

    var koubei: Int = 0
    required init() {}

}

class Cashiersalesdatavo : RootModel{

    var refundAmount: Int = 0

    var malingAmount: Int = 0

    var totalPrice: Int = 0

    var biaojiOrderPayList: String?

    var cashierGatheringData: [Cashiergatheringdata]?

    var tagActualTotalMoney: Int = 0

    var tailSingleTime: String?

    var cashActualPrice: Int = 0

    var preorderCount: Int = 0

    var discountAmount: Int = 0

    var tagOrderSum: Int = 0

    var refundTagAmount: Int = 0

    var refundSingular: Int = 0

    var salesSingular: Int = 0

    var returnCashPrice: Int = 0

    var returnCashNum: Int = 0

    var refundTagData: String?

    var returnCashierData: [String]?

    var firstSingleTime: String?

    var cashSalePrice: Int = 0

    var cashActualNum: Int = 0

    var actualIncome: Int = 0

    var tagTotalMoney: Int = 0
    
    required init() {}

}

class Cashiergatheringdata : RootModel{

    var payName: String?

    var num: Int = 0

    var payCode: Int = 0

    var sumPayPrice: Int = 0
    
    required init() {}

}

