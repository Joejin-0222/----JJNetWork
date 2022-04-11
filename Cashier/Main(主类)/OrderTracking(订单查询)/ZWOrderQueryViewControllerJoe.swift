//
//  ZWOrderQueryViewControllerJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/30.
//

import UIKit

class ZWOrderQueryViewControllerJoe: UIViewController {
    //顶部 分段选择器
    let SementView : ZWCheckSementViewJoe = ZWCheckSementViewJoe()
    //
    let leftView :  ZWOrderQueryLeftView = ZWOrderQueryLeftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.shezhiUI()
    }
    
    func shezhiUI(){
        
        //
        SementView.delegate = self//遵守点击分段选择代理
        SementView.YesNetWork = false //是网络数据
        SementView.IsHiddenFenGeLine = true //隐藏分割线
        self.view.addSubview(SementView.initView())
        SementView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left).offset(0*WidthW)
            make.top.equalTo(self.view.snp.top).offset(100*WidthW)
            make.height.equalTo(72*WidthW)
            make.right.equalTo(self.view.snp.right)
        }
        SementView.dataAarry =  ["全部","新订单","进行中","退款单","取消单","待配送","已完成"]
        SementView.columnNum =  12 //设置为
        self.SementView.ReloadData()
        
        //
        self.view.addSubview(leftView.initView())
        leftView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left).offset(0*WidthW)
            make.top.equalTo(SementView.snp.bottom).offset(10*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.width.equalTo((OrderTabelViewWidth+OrderRightViewWidth)*WidthW)
        }
        
    }


}
extension ZWOrderQueryViewControllerJoe : SementSelectClickDelegate{
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    
    
}
