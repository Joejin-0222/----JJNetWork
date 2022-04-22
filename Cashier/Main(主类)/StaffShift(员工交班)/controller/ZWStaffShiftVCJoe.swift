//
//  ZWStaffShiftVCJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWStaffShiftVCJoe: ZWRootViewControllerJoe {

    var leftTableView : ZWStaffShiftLeftView =  ZWStaffShiftLeftView()
    var rightView :   ZWStaffShiftRightView = ZWStaffShiftRightView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sehzhiUI()
    }
    
    func loadData(){
//        ZHFNetwork.request(target: <#T##ZHFService#>, success: <#T##ZHFNetwork.successCallback##ZHFNetwork.successCallback##(_ result: Any) -> Void#>, error1: <#T##ZHFNetwork.errorCallback##ZHFNetwork.errorCallback##(_ statusCode: Int) -> Void#>, failure: <#T##ZHFNetwork.failureCallback##ZHFNetwork.failureCallback##(_ error: MoyaError) -> Void#>)
    }
    
    func sehzhiUI(){
        //
        self.view.addSubview(leftTableView.initView())
        leftTableView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(38*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        //
        self.view.addSubview(rightView.initView())
        rightView.snp.makeConstraints { make in
            make.left.equalTo(self.rightline.snp.right).offset(0*WidthW)
            make.top.equalTo(self.LogoImage.snp.top).offset(58*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
            
        }
    }
  

}
