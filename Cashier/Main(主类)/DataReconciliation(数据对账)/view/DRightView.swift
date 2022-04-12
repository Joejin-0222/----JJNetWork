//
//  DRightView.swift
//  Cashier
//
//  Created by mac on 2022/4/12.
//

import UIKit

class DRightView: UIView {

    var headerArray: NSArray = ["日结经营报告","门店经营报告"]
    
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
        return  2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DRRightTCell.self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70*WidthW
    }
 
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hederView: DRHeaderView = DRHeaderView()
        hederView.initView();
        
        
        return hederView
    }
}


