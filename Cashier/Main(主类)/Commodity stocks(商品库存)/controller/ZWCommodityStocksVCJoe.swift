//
//  ZWCommodityStocksVCJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWCommodityStocksVCJoe: ZWRootViewControllerJoe {

    var StoreView : ZWCheckOutStoreViewJoe = ZWCheckOutStoreViewJoe()//右半边商品view
   
    //
    var leftTableView : ZWLeftTableviewView = ZWLeftTableviewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
    }
    
    func initUI(){
        //
        self.view.addSubview(leftTableView.initView())
        leftTableView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(138*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        //右半边商品view
        self.view.addSubview(StoreView.initView())
        StoreView.snp.makeConstraints { make in
            make.left.equalTo(leftTableView.snp.right).offset(1*WidthW)
            make.top.equalTo(0)
            make.height.equalTo(ScreenHeight)
            make.right.equalTo(self.view.snp.right)
        }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
