//
//  ZWCheckStoreBottomView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/1.
//

import UIKit
protocol BottomSelectClickDelegate : NSObjectProtocol{
    func BottomSelectIndexPathClick(IndexPath:Int)
}
class ZWCheckStoreBottomView: UIView {
    
    
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
    weak var delegate: BottomSelectClickDelegate?
    var dataArray : NSArray = []
    private var selectIndex:Int = 0   //    记录点击了第几行
    fileprivate let CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    
    func initView() -> UIView {
        self.dataArray = ["选择客户","券码核销","门店活动","限定优惠"]
        //
        let myflowLayout = UICollectionViewFlowLayout()
        myflowLayout.sectionHeadersPinToVisibleBounds = false // 头部悬浮
        myflowLayout.minimumLineSpacing = 0
        myflowLayout.minimumInteritemSpacing = 0
        myflowLayout.sectionInset = UIEdgeInsets(top: 0, left: 13*WidthW, bottom: 0, right: 0)
        myflowLayout.scrollDirection = .horizontal
        self.CollectionView.collectionViewLayout = myflowLayout
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        CollectionView.register(ZWCheckSementCellJoe.self, forCellWithReuseIdentifier: "ZWCheckSementCellJoe")
        CollectionView.contentOffset = CGPoint(x: 0,y: 0)
        self.addSubview(self.CollectionView)
        //        CollectionView.backgroundColor = UIColor.init(hex: "#DCDEE0")
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom).offset(0*WidthW)
        }
        //默认选中第一行
        DispatchQueue.main.async {
            let indexpath = IndexPath.init(row: self.selectIndex , section: 0)
            self.CollectionView.selectItem(at: indexpath, animated: false, scrollPosition: UICollectionView.ScrollPosition.top)
        }
        //分割线view
        let lineView = UIView()
        lineView.backgroundColor = LineColor
        self.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(2*WidthW)
        }
        //
        let moreBtn = UIButton()
        moreBtn.setImage(UIImage.init(named: "收银台-商品底部more"), for: .normal)
        self.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-24*WidthW)
            make.top.equalTo(self.snp.top).offset(16*WidthW)
            make.width.height.equalTo(36*WidthW)
        }
        
        return self
    }
    
}
extension ZWCheckStoreBottomView:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckSementCellJoe", for: indexPath) as! ZWCheckSementCellJoe
        //
        //        let model : SelectStoreModelZJ =  self.dataAarry[indexPath.row] as! SelectStoreModelZJ;
        //        cell.storeLabel.text =  model.sname
        cell.TitleLabel.text = self.dataArray[indexPath.row] as? String
        cell.TitleLabel.font = UIFont.systemFont(ofSize: 26*WidthW)
        cell.TitleLabel.textColor = UIColor.init(hex: "#323233")
        if  self.selectIndex == indexPath.row {
            cell.IndicatorView.isHidden = true
        }else{
            cell.IndicatorView.isHidden = true
        }
        return cell
    }
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0;
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2*WidthW;
    }
    
    //    item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:( self.CollectionView.width - 30) / 6, height: self.CollectionView.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectIndex=indexPath.row
        self.CollectionView.reloadData()
        
        // 04. 执行代理
        delegate?.BottomSelectIndexPathClick(IndexPath: indexPath.row)
    }
}
