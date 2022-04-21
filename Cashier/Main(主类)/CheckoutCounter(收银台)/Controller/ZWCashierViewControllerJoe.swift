//
//  ZWCashierViewControllerJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/30.
//

import UIKit

class ZWCashierViewControllerJoe: ZWRootViewControllerJoe ,OrderWayTypeSelectDelegate,GoodsSelectDelegate{
    
    
    var orderView : ZWOrderViewJoe  = ZWOrderViewJoe()  //订单 view
    var StoreView : ZWCheckOutStoreViewJoe = ZWCheckOutStoreViewJoe()//右半边商品view
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.initSetUI()
    }
    
    
    func initSetUI(){
        //订单 view
        orderView.delegate = self
        self.view.addSubview(orderView.initView())
        orderView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(ScreenHeight)
            make.width.equalTo((OrderTabelViewWidth+OrderRightViewWidth)*WidthW)
        }
        //右半边商品view
        StoreView.GoodsDelegate = self //遵守 商品 点击 传到 订单页面数据协议
        self.view.addSubview(StoreView.initView())
        StoreView.snp.makeConstraints { make in
            make.left.equalTo(orderView.snp.right)
            make.top.equalTo(0)
            make.height.equalTo(ScreenHeight)
            make.right.equalTo(self.view.snp.right)
        }
        
        
    }
    // 预订 取单等点击操作
    func SelectOrderWayTypeClick(IndexPath: Int) {
        print("====\(IndexPath)")
    }
    //商品 点击 传到 订单页面数据协议
    func GoodsSelectIndexPathClick(IndexPath: Int, GoodsArray: [goodsModel]) {
        orderView.OrderListDataAarry = GoodsArray 
        orderView.TableView.reloadData()
    }
    
    
    
}
