//
//  ZWRLLeftTBViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit

class ZWRLLeftTBViewKB: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var tableView: UITableView = {
        let tw = UITableView(frame: .zero, style: .grouped)
        tw.backgroundColor = UIColor.init(hex: "#FAFAFA")
        tw.tableFooterView = UIView()
        tw.separatorStyle = .none
        tw.delegate = self
        tw.dataSource = self
        tw.separatorStyle = .none
        tw.register(cellType: ZWRecordVLogTCell.self)
//        tw.uHead = URefreshHeader{ [weak self] in self?.loadData() }
//        tw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return tw
    }()
    
    lazy var againBtn: UIButton = {
        let button = UIButton()
        button.setTitle("重打交班小票", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#ffffff"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
        button.backgroundColor = MainColor
        button.layer.cornerRadius = 28*WidthW
        return button
    }()
    
    
    func initView()->UIView{
//        self.backgroundColor = UIColor.blue
        self.backgroundColor = Tab_backColor
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-124*WidthW)
        }
        
        self.addSubview(self.againBtn)
        againBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-48*WidthW)
            make.width.equalTo(216*WidthW)
            make.height.equalTo(56*WidthW)
        }
        
        
        
        return self
    }
    
    
    
    
}
extension ZWRLLeftTBViewKB: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWRecordVLogTCell.self)
        cell.indexSelected = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108*WidthW
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90*WidthW
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: DRHeaderView = DRHeaderView().initView() as! DRHeaderView
        headerView.redLineView.isHidden = true
        headerView.titleL.text = "交班/交班记录"
        headerView.rightBtn.setTitle("时间筛选", for: .normal)
        headerView.rightBtn.setImage(UIImage(named: "编组 41-1"), for: .normal)
        headerView.rightBtn.snp.updateConstraints { make in
            make.width.equalTo(200*WidthW)
            make.right.equalTo(headerView.snp.right).offset(-10*WidthW)
            make.width.equalTo(130*WidthW)
        }
        headerView.rightBtn.layer.borderWidth = 0;
        
        headerView.rightBtnBlock = {(Int) in
            print("时间选择")
        }
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}
