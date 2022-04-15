//
//  ZWMoreCategoriesView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWMoreCategoriesPopView: basePopView {
    
    //中间商品列表
    fileprivate let CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    override func configUI() {
        //        self.backgroundColor = UIColor.clear
        //
        self.closeBtn.isHidden = true
        //
        self.backView.snp.remakeConstraints { make in
            make.top.equalTo(self.snp.top).offset(200*WidthW)
            make.right.equalTo(self.snp.right).offset(-24*WidthW)
            make.width.equalTo(640*WidthW)
            make.height.equalTo(424*HeighH)
        }
        //
        //
        let myflowLayout = UICollectionViewFlowLayout()
        myflowLayout.sectionHeadersPinToVisibleBounds = false // 头部悬浮
        myflowLayout.minimumLineSpacing = 1
        myflowLayout.minimumInteritemSpacing = 0
        myflowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        myflowLayout.scrollDirection = .vertical
        self.CollectionView.collectionViewLayout = myflowLayout
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        CollectionView.register(ZWCheckOutStoreCellJoe.self, forCellWithReuseIdentifier: "ZWCheckOutStoreCellJoe")
        
        self.addSubview(self.CollectionView)
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom).offset(24*HeighH)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.top).offset(-24*HeighH)
        }
    }
    
}
extension ZWMoreCategoriesPopView:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckOutStoreCellJoe", for: indexPath) as! ZWCheckOutStoreCellJoe
        
        return cell
    }
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5*WidthW;
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10*WidthW;
    }
    
    //item 的尺寸
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width:( self.snp.width - 26*WidthW) / 4, height: 48*HeighH)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("=============点击了 第 \(indexPath.row) 商品")
    }
    
    
    
    
}
