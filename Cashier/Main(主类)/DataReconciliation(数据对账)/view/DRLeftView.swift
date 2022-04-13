//
//  DRLeftView.swift
//  Cashier
//
//  Created by mac on 2022/4/12.
//

import UIKit
typealias tapIndexBlock = (Int) -> ()

class DRLeftView: UIView {

    var dataArray: NSArray = ["经营数据","财务报表","商品报表","会员报表"]
    var imgArray: NSArray = ["dr_01","dr_02","dr_03","dr_04"]
    var selectedArray: NSMutableArray = [1,0,0,0]
    var tapIndexBlock : tapIndexBlock?
    
    
    lazy var tableView:UITableView = {
        let tView = UITableView(frame: .zero, style: .grouped)
        tView.backgroundColor = UIColor.clear
        tView.dataSource = self
        tView.delegate = self
        return tView
    }()
    
    func initView()->UIView{
        //创建
        self.addSubview(tableView)
        tableView.estimatedRowHeight =  130
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor =  UIColor.white
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.register(cellType: DRLeftTCell.self)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
      
        return self
    }
    
}

extension DRLeftView :UITableViewDelegate{
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=====\(indexPath.row)")
        
        
        for index in 0...3 {
            if index == indexPath.row {
                selectedArray[index] = 1
            }else{
                selectedArray[index] = 0
            }
//            print(selectedArray[index])
        }
        
        tableView.reloadData()
        tapIndexBlock!(indexPath.row)
     
    }
}
extension DRLeftView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DRLeftTCell.self)
        cell.titleStr = (dataArray[indexPath.row] as! NSString)
        cell.imgStr = (imgArray[indexPath.row] as! NSString)
        cell.indexSelected = (selectedArray[indexPath.row] as! Int)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108*WidthW
    }
 
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return UIView()
    }
}
