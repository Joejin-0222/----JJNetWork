//
//  ZWStaffShiftRightView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWStaffShiftRightView: UIView, SementSelectClickDelegate {
   
    var index:Int = 0
//    lazy var lineView : UIView = {
//       let view = UIView()
//        view.backgroundColor = MainColor
//        return view
//    }()
//
//    lazy var titleLabel : UILabel = {
//      let label = UILabel()
//        label.textColor = UIColor.init(hex: "#323233")
//        label.font = UIFont.systemFont(ofSize: 24*WidthW)
//        label.text = "营收数据"
//        return label
//    }()
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)//UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    var dataArray : NSArray = [["销售金额/元","实收金额/元","退款金额/元","优惠金额/元"],["现金金额","实收金额/元","退款金额/元","收银充值金额","储值金额/元","券码核销张数","美团点评/张","口碑套餐/张","美零商品券/张"]]
    var titleDataArray : NSArray = []
    var sementView : ZWCheckSementViewJoe =  ZWCheckSementViewJoe()
    
    func initView()->UIView{
        
        //
        sementView.delegate = self//遵守点击分段选择代理
        sementView.YesNetWork = false //是网络数据
        sementView.columnNum =  2 //设置为 3列
        self.addSubview(sementView.initView())
        sementView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(447*WidthW)
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.width.equalTo(400*WidthW)
            make.height.equalTo(72*WidthW)
        }
       
        sementView.dataAarry =  ["交班","日结"]
        self.sementView.ReloadData()
     //
//        self.addSubview(lineView)
//        lineView.snp.makeConstraints { make in
//            make.left.equalTo(self.snp.left).offset(68*WidthW)
//            make.width.equalTo(4*WidthW)
//            make.height.equalTo(22*WidthW)
//            make.top.equalTo(self.sementView.snp.bottom).offset(46*WidthW)
//        }
//        //
//        self.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.left.equalTo(lineView.snp.right).offset(9*WidthW)
//            make.centerY.equalTo(lineView.snp.centerY)
//            make.right.equalTo(self.snp.right).offset(-30*WidthW)
//            make.height.equalTo(26*WidthW)
//        }
//       //
        //
        self.addSubview(TableView)
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.register(cellType: ZWSuccessionTCellKB.self)
        TableView.register(cellType: ZWDailySettlementTCell.self)
        TableView.snp.makeConstraints { make in
            make.top.equalTo(self.sementView.snp.bottom).offset(46*WidthW)
            make.left.equalTo(self.snp.left).offset(70*WidthW)
            make.right.equalTo(self.snp.right).offset(-68*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-84*WidthW)
        }
        //没有model的时候用闭包传值过来的
        self.sementView.selectIndexPathBlock = {
            self.index = $0
            print(self.index)
            self.TableView.reloadData()
        }
        
        return self
    }
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
}

extension ZWStaffShiftRightView : UITableViewDelegate {
    
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
     
    }
}

extension ZWStaffShiftRightView : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.index == 0{
            return  dataArray.count
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.index == 0{
            let arr = self.dataArray[section]
                
            return (arr as AnyObject).count
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.index == 0{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWSuccessionTCellKB.self)
            let arr: NSArray = self.dataArray[indexPath.section] as! NSArray
            
            cell.leftL.text = arr[indexPath.row] as? String
            if indexPath.row == 0 {
               cell.backView.backgroundColor = UIColor.init(hex: "#F3F3F5")
           }else{//#FEF9D5
               cell.backView.backgroundColor = UIColor.white
           }
            cell.detailBtn.tag = indexPath.section + 100 + indexPath.row;
            cell.detailBtn.addTarget(self, action: #selector(detailBtnClick(_:)), for: .touchUpInside)
            return cell
        }else{
            if indexPath.row == 0  {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWDailySettlementTCell.self)
                
                return cell
            }else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWSuccessionTCellKB.self)
                cell.leftL.text = "订单总计：128"
                cell.rightL.text = "预订单总计：128"
                cell.totalL.isHidden = true
                cell.detailBtn.isHidden = true
                cell.rightL.snp.remakeConstraints { make in
                    make.centerY.equalTo(cell.backView.snp.centerY).offset(0)
                    make.left.equalTo(cell.leftL.snp.right).offset(10*WidthW)
                    make.height.equalTo(cell.backView)
                }
                cell.backView.backgroundColor = UIColor.white
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWSuccessionTCellKB.self)
//                let arr: NSArray = self.dataArray[indexPath.section] as! NSArray
                
                cell.leftL.text = "实收金额/元"
//                cell.leftL.text = arr[indexPath.row] as? String
//                if indexPath.row == 0 {
//                   cell.backView.backgroundColor = UIColor.init(hex: "#F3F3F5")
//               }else{//#FEF9D5
//                   cell.backView.backgroundColor = UIColor.white
//               }
                cell.detailBtn.tag = indexPath.section + 100 + indexPath.row;
                cell.detailBtn.addTarget(self, action: #selector(detailBtnClick(_:)), for: .touchUpInside)
                cell.backView.backgroundColor = UIColor.white
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80*WidthW
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 80*WidthW
        }
            return 0*WidthW
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: DRHeaderView = DRHeaderView().initView() as! DRHeaderView
        headerView.titleL.text = "营收数据"
        headerView.rightBtn.setTitle("交班记录", for: .normal)
        headerView.rightBtn.setImage(UIImage(named: "编组 41"), for: .normal)
        headerView.rightBtn.snp.updateConstraints { make in
            make.width.equalTo(200*WidthW)
        }
        headerView.rightBtn.layer.borderWidth = 0;
        return headerView
    }
    
    //明细的点击事件
    @objc func detailBtnClick(_ sender: UIButton){
        print("sender")
        let popview:ZWMoneyInfoKB = ZWMoneyInfoKB().initView() as! ZWMoneyInfoKB
        popview.show()
        
    }
    
}
