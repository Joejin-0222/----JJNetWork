//
//  ZWRecordLongRightViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit


class ZWRecordLogRightViewKB: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var index = 0
    let dayArray = ["","","实收金额/元","退款金额/元","优惠金额/元"]
    var dataArray:NSMutableArray = [["营收数据","销售金额/元","实收金额/元","退款金额/元","优惠金额/元"],["现金金额","实收金额/元","退款金额/元","收银充值金额","储值金额/元","券码核销张数","美团点评/张","口碑套餐/张","美零商品券/张"]]
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = Tab_backColor
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: ZWSuccessionTCellKB.self)
        tw.register(cellType: ZWDailySettlementTCell.self)
        
//        tw.uHead = URefreshHeader{ [weak self] in self?.loadData() }
//        tw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return tw
    }()
    
    
    func initView()->UIView{
//        self.backgroundColor = UIColor.blue
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 70*WidthW, bottom: 0, right: 70*WidthW))
        }
        
        
        return self
    }
    
    
    
    
}
extension ZWRecordLogRightViewKB: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if index == 0 {
            return  dataArray.count
        }
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if index == 0 {
            let arr: NSArray = self.dataArray[section] as! NSArray
            return arr.count
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if index == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWSuccessionTCellKB.self)
            let arr: NSArray = self.dataArray[indexPath.section] as! NSArray
            
            cell.backView.snp.remakeConstraints { make in
                make.edges.equalToSuperview()
            }
            cell.leftL.text = arr[indexPath.row] as? String
            if indexPath.section == 0{
                if indexPath.row == 0 {
                    cell.style = .onlyLeft
               }else{//#FEF9D5
                   cell.backView.backgroundColor = UIColor.white
                   cell.leftL.font = UIFont.systemFont(ofSize: 24*WidthW, weight: UIFont.Weight.regular)
                   if indexPath.row == 1 || indexPath.row == 4{
                       cell.style = .onelyTow
                   }else{
                       cell.style = .none
                   }
               }
            }else{
                if indexPath.row == 0 ||  indexPath.row == 3 || indexPath.row == 5 {
                    cell.style = .onlyLeft
               }else{//#FEF9D5
                   if indexPath.row == 1 || indexPath.row == 2{
                       cell.style = .onelyRed
                   }else{
                       cell.style = .onelyTow
                   }
               }
            }
            
            cell.detailBtn.tag = indexPath.section + 100 + indexPath.row;
            cell.detailBtn.addTarget(self, action: #selector(detailBtnClick(_:)), for: .touchUpInside)
            return cell
        }else{
            if indexPath.row == 0  {
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWDailySettlementTCell.self)
                cell.backView.snp.remakeConstraints { make in
                    make.edges.equalToSuperview()
                }
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
                cell.backView.snp.remakeConstraints { make in
                    make.edges.equalToSuperview()
                }
                cell.backView.backgroundColor = UIColor.white
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWSuccessionTCellKB.self)
                cell.backView.snp.remakeConstraints { make in
                    make.edges.equalToSuperview()
                }
                cell.leftL.text = self.dayArray[indexPath.row] as! String

                cell.detailBtn.tag = indexPath.section + 100 + indexPath.row;
                cell.detailBtn.addTarget(self, action: #selector(detailBtnClick(_:)), for: .touchUpInside)
                cell.backView.backgroundColor = UIColor.white
                if indexPath.row == 4{
                    cell.style = .onelyTow
                }else{
                    cell.style = .none
                }
                    
                    
                    
                return cell
            }
        }
       
    }
    @objc func detailBtnClick(_ sender:UIButton){
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72*WidthW
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 222*WidthW
        }
        return 0.00
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let headerView: ZWRecordLogHeaderViewKB = ZWRecordLogHeaderViewKB().initView() as! ZWRecordLogHeaderViewKB
            if index == 1 {
                headerView.isShow = true
            }
            return headerView
        }
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}
