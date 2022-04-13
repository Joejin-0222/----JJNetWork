//
//  ZWLeftItemViewJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/30.
//

import UIKit

// 01. 定义协议
protocol LeftItemDelegate: NSObjectProtocol{
    // 02. 定义协议方法
    func ItemSelectIndexPathClick (IndexPath:Int,ItemName:String)
}


class ZWLeftItemViewJoe: UIView {
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
      weak var delegate: LeftItemDelegate?
      
    
    var dataAarry  : NSArray = []
    private var selectIndex:Int=0   //    记录点击了第几行
    
    lazy var flowLayout:UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    lazy var collectionView:UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.isPagingEnabled = true
        view.backgroundColor = UIColor.clear
        view.register(ZWLeftItemCellJoe.self, forCellWithReuseIdentifier: "ZWLeftItemCellJoe")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    //
    lazy var LogoView: UIView = {
        let view = UIView()
        return view
    }()
    lazy var LeftItemIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "leftItemLogo")
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFill
        return view
    }()
   
    
    
    func initView() -> UIView {
        self.dataAarry = ["收银台","订单查询","会员管理","员工交班","商品库存","数据对账","切换店铺","","收银设置","进入后台"]
        
        self.backgroundColor =  UIColor.init(hex: "#FE4B48")
        
        //
    
        //标题图标
        self.addSubview(LogoView)
        LogoView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.width.height.equalTo(LeftItemWidth*WidthW)
        }
        LogoView.backgroundColor = MainColor
        //
        LogoView.addSubview(LeftItemIcon)
        LeftItemIcon.snp.makeConstraints { make in
            make.centerX.equalTo(LogoView.snp.centerX)
            make.centerY.equalTo(LogoView.snp.centerY)
            make.width.height.equalTo(82*WidthW)
        }
        
        //
        flowLayout.itemSize = CGSize(width: LeftItemWidth*WidthW, height: (ScreenHeight - LeftItemWidth*WidthW)/CGFloat(self.dataAarry.count) )
        flowLayout.sectionInset = UIEdgeInsets(top: 0*WidthW, left:0, bottom: 0, right:0)
        
        self.addSubview(collectionView)
        collectionView.backgroundColor =  UIColor.init(hex: "#FE4B48")
        collectionView.isScrollEnabled = false
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(LogoView.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(self.snp.width)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
        //默认选中第一行
        DispatchQueue.main.async {
            let indexpath = IndexPath.init(row: self.selectIndex , section: 0)
            self.collectionView.selectItem(at: indexpath, animated: false, scrollPosition: UICollectionView.ScrollPosition.top)
        }
        return self
    }
}

extension ZWLeftItemViewJoe:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.dataAarry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWLeftItemCellJoe", for: indexPath) as! ZWLeftItemCellJoe
        
        //        let model : SelectStoreModelZJ =  self.dataAarry[indexPath.row] as! SelectStoreModelZJ;
        
//        if indexPath.row == 0{
//            cell.LeftItemLabel.text = ""
//        }else{
            cell.LeftItemLabel.text = (self.dataAarry [indexPath.row] as! String)
//        }
        
        if  self.selectIndex == indexPath.row {
            cell.LeftItemIcon.image =  UIImage.init(named: "\(self.dataAarry [indexPath.row] as! String)select" )
//            cell.LeftItemView.backgroundColor = UIColor.white
            cell.LeftItemLabel.textColor = UIColor.init(hex: "#FE4B48")
            cell.backImage.isHidden = false
        }else{
                   
                    
            cell.LeftItemIcon.image =  UIImage.init(named: self.dataAarry [indexPath.row] as! String)
            cell.LeftItemView.backgroundColor = UIColor.init(hex: "#FE4B48")
            cell.LeftItemLabel.textColor = UIColor.white
            cell.backImage.isHidden = true
        }
        
        return cell
    }
}
extension ZWLeftItemViewJoe: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 7 {
            
        }else{
            self.selectIndex=indexPath.row
            self.collectionView.reloadData()
            
            // 04. 执行代理
            delegate?.ItemSelectIndexPathClick(IndexPath: indexPath.row,ItemName: self.dataAarry[indexPath.row] as! String)
        }
        
    }
}
