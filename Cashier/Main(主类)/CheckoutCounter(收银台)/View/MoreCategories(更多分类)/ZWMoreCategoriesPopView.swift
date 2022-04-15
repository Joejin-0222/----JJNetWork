//
//  ZWMoreCategoriesView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWMoreCategoriesPopView: basePopView {
    //
    lazy var bottomView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F3F3F5")
        return view
    }()
    //
    lazy var PutAwayBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("点击收起", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20*WidthW)
        btn.setTitleColor(UIColor.init(hex: "#969799"), for: .normal)
        btn.setImage(UIImage.init(named: "分段弹框收起"), for: .normal)
        return btn
    }()
    
    private var selectIndex:Int = 0   //    记录点击了第几行
    
    let  SelfViewWidth : CGFloat = 640*WidthW //当前view宽
    
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
            make.width.equalTo(SelfViewWidth)
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
        CollectionView.register(ZWMoreCategoriesCellJoe.self, forCellWithReuseIdentifier: "ZWMoreCategoriesCellJoe")
        
        self.backView.addSubview(self.CollectionView)
        CollectionView.backgroundColor = UIColor.white
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(24*HeighH)
            make.left.equalTo(backView.snp.left).offset(24*WidthW)
            make.right.equalTo(backView.snp.right).offset(-24*WidthW)
            make.bottom.equalTo(backView.snp.bottom).offset(-(24+48)*HeighH)
        }
        //
        self.backView.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.height.equalTo(48*WidthW)
            make.left.equalTo(backView.snp.left).offset(0*WidthW)
            make.right.equalTo(backView.snp.right).offset(0*WidthW)
            make.bottom.equalTo(backView.snp.bottom)
        }
        //
        PutAwayBtn.setImageAndTitle(imageName: "分段弹框收起", title: "点击收起", type: .PositionRight, Space: 5*WidthW)
        bottomView.addSubview(PutAwayBtn)
        PutAwayBtn.snp.makeConstraints { make in
            make.centerY.equalTo(bottomView.snp.centerY)
            make.centerX.equalTo(bottomView.snp.centerX)
            make.height.equalTo(48*WidthW)
        }

    }
    override func layoutSubviews() {
        bottomView.setRoundCorners(corners: [.bottomLeft,.bottomRight], with: 10)
    }
 
    
}
extension ZWMoreCategoriesPopView:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWMoreCategoriesCellJoe", for: indexPath) as! ZWMoreCategoriesCellJoe
        
            if  self.selectIndex == indexPath.row {
                cell.backView.backgroundColor = UIColor.init(hex: "#FEEBEA")
                cell.TitleLabel.textColor = MainColor
                
            }else{
                cell.backView.backgroundColor = UIColor.init(hex: "#ffffff")
                cell.TitleLabel.textColor = UIColor.init(hex: "#323233")
                
            }
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:( SelfViewWidth - 68*WidthW) / 4, height: 44*HeighH)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("=============点击了 第 \(indexPath.row) 商品")
        
            self.selectIndex=indexPath.row
            self.CollectionView.reloadData()
            
    }
    
    
    
    
}
