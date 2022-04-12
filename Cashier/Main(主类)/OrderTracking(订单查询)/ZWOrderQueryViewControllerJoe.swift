//
//  ZWOrderQueryViewControllerJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/30.
//

import UIKit

class ZWOrderQueryViewControllerJoe: ZWRootViewControllerJoe {
    //顶部 分段选择器
    let SementView : ZWCheckSementViewJoe = ZWCheckSementViewJoe()
    //
    let RightView :  ZWOrderQueryRightView = ZWOrderQueryRightView()
    //分段选择底部view
    let SementBottomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.shezhiUI()
    }
    
    func shezhiUI(){
        
        //
        SementBottomView.cornerRadius(cornerRadius: 34*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        self.view.addSubview(SementBottomView)
        SementBottomView.snp.makeConstraints { make in
            make.left.equalTo(self.rightline.snp.right).offset(64*WidthW)
            make.top.equalTo(self.view.snp.top).offset(108*WidthW)
            make.height.equalTo(68*WidthW)
            make.right.equalTo(self.view.snp.right).offset(-115*WidthW)
        }
        //
        SementView.delegate = self//遵守点击分段选择代理
        SementView.YesNetWork = false //是网络数据
        SementView.IsHiddenFenGeLine = false //隐藏分割线
        SementBottomView.addSubview(SementView.initView())
        SementView.snp.makeConstraints { make in
            make.left.equalTo(self.SementBottomView.snp.left).offset(10*WidthW)
            make.top.equalTo(self.SementBottomView.snp.top).offset(0*WidthW)
            make.height.equalTo(68*WidthW)
            make.right.equalTo(self.SementBottomView.snp.right).offset(-10*WidthW)
        }
        SementView.dataAarry =  ["全部","新订单","进行中","退款单","取消单","待配送","已完成"]
        SementView.columnNum =  7 //设置为
        self.SementView.ReloadData()
        
        //
        self.view.addSubview(RightView.initView())
        RightView.snp.makeConstraints { make in
            make.left.equalTo(self.SementView.snp.left).offset(0*WidthW)
            make.top.equalTo(SementView.snp.bottom).offset(27*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right).offset(-72*WidthW)
        }
        
    }


}
extension ZWOrderQueryViewControllerJoe : SementSelectClickDelegate{
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    
    
}
