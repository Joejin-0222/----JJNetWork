//
//  DRightView.swift
//  Cashier
//
//  Created by mac on 2022/4/12.
//

import UIKit

class DRightView: UIView {

    var headerArray: NSArray = ["日结经营报告","门店经营报告"]
    
    //0 经营数据  财务报表  商品报表  会员报表
    var indexType: Int = 0
    
    lazy var tableView: UITableView = {
        let tView = UITableView(frame: .zero, style: .grouped)
        tView.backgroundColor = UIColor.clear
        tView.dataSource = self
        tView.delegate = self
        return tView
    }()
    
    func initView()->UIView{
        
        self.addSubview(tableView)
        tableView.estimatedRowHeight =  130
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor =  UIColor.white
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.register(cellType: DRRightTCell.self)
        tableView.register(cellType: DRRightheaderTCell.self)
        tableView.register(cellType: ZWFinancialTCell.self)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 30*WidthW, left: 0, bottom: -84*WidthW, right: -68*width))
        }
        
        return self
    }

}

extension DRightView :UITableViewDelegate{
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
 
    }
}
extension DRightView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if indexType == 1{
            return 3
        }
        if indexType == 2{
            return 1
        }
        return  2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if indexType == 1{
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexType == 0  {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DRRightTCell.self)
            if indexPath.row == 0 {
                cell.isTopCell = true
                cell.isShow = true
                let dataDict = ["leftStr":"名称","middleStr":"金额","rightStr":"对比昨日"]
                cell.rightL.textColor = Title_color
                cell.dataDict = dataDict as NSDictionary
            }else{
                cell.isTopCell = false
                if indexPath.row == 1 {
                    cell.isShow = false
                }else{
                    cell.isShow = true
                }
                cell.rightL.textColor = UIColor.init(hex: "FE4B48")
                let dataDict = ["leftStr":"应收营业额","middleStr":"200000","rightStr":"67%"]
                cell.dataDict = dataDict as NSDictionary
            }
            return cell
        }else if indexType == 1{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWFinancialTCell.self)
            
            return cell
        }
        else if indexType == 2{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DRRightheaderTCell.self)
            if indexPath.row == 0 {
                cell.isTopCell = true
                let dataDict = ["leftStr":"名称","middleStr":"出货148","middleRightStr":"销量128","rightStr":"已收金额：1234567元"]
                cell.rightL.textColor = Title_color
                cell.dataDict = dataDict as NSDictionary
            }
                
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DRRightTCell.self)
            if indexPath.row == 0 {
                cell.isTopCell = true
                cell.isShow = true
                let dataDict = ["leftStr":"名称","middleStr":"金额","rightStr":"对比昨日"]
                cell.rightL.textColor = Title_color
                cell.dataDict = dataDict as NSDictionary
            }else{
                cell.isTopCell = false
                if indexPath.row == 1 {
                    cell.isShow = false
                }else{
                    cell.isShow = true
                }
                cell.rightL.textColor = UIColor.init(hex: "FE4B48")
                let dataDict = ["leftStr":"应收营业额","middleStr":"200000","rightStr":"67%"]
                cell.dataDict = dataDict as NSDictionary
            }
            return cell
        }
       
  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.indexType == 1{
            return 150*WidthW
        }
        return 70*WidthW
    }
 
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if indexType == 0  || indexType == 2{
            return 80
        }
        if indexType == 1 && section == 0{
            return 80
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if indexType == 0 || indexType == 2 {
            let hederView: DRHeaderView = DRHeaderView()
            hederView.initView()
            return hederView
        }
        if indexType == 1 && section == 0{
            let hederView: DRHeaderView = DRHeaderView()
            hederView.initView()
            hederView.redLineView.snp.updateConstraints { make in
                make.left.equalTo(hederView.snp.left).offset(72*WidthW)
            }
            return hederView
        }
       return UIView()
    }
}


