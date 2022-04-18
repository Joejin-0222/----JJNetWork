//
//  ZWOrderYouHuiPopViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWOrderYouHuiPopViewJoe: basePopView {
    
    var dataAarry  : NSArray? = []
    private var selectIndex:Int = 0   //    记录点击了第几行
    let  SelfViewWidth : CGFloat = 840*WidthW //当前view宽
    //中间商品列表
    fileprivate let CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    
    let cancelBtn = UIButton() //取消按钮
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "整单优惠"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    
    override func configUI() {
        self.createAlertView()
    }
    
    //MARK:创建
    func createAlertView() {
        //
        self.backView.snp.remakeConstraints { make in
            make.left.equalTo((LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)
            make.width.equalTo(ScreenWidth - (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)
            make.height.equalTo(ScreenHeight)
            make.top.equalTo(self.snp.top)
        }
        //
        //取消按钮 返回按钮
        cancelBtn.frame = CGRect(x: 63*WidthW, y: 70*WidthW, width: 92*WidthW, height: 92*WidthW)
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        cancelBtn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        self.backView.addSubview(cancelBtn)
        
        //
        self.backView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.left)
            make.right.equalTo(backView.snp.right)
            make.centerY.equalTo(cancelBtn.snp.centerY)
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
        CollectionView.register(ZWOrderYouHuiCollectionCellJoe.self, forCellWithReuseIdentifier: "ZWOrderYouHuiCollectionCellJoe")
        
        CollectionView.register(supplementaryViewType: ZWOrderYouHuiHeaderCellJoe.self, ofKind: UICollectionView.elementKindSectionHeader)
        
        self.backView.addSubview(self.CollectionView)
        CollectionView.backgroundColor = UIColor.white
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(44*HeighH)
            make.left.equalTo(backView.snp.left).offset(63*WidthW)
            make.right.equalTo(backView.snp.right).offset(-63*WidthW)
            make.bottom.equalTo(backView.snp.bottom).offset(-(48)*HeighH)
        }
        
    }
}
extension ZWOrderYouHuiPopViewJoe:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
       return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4//self.dataAarry?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWOrderYouHuiCollectionCellJoe", for: indexPath) as! ZWOrderYouHuiCollectionCellJoe
        cell.TitleLabel.text = "\(indexPath.item + 1)优惠"
        let Index : Int = (indexPath.item+1)%3
        cell.BackImage.image = UIImage.init(named: "整单优惠背景0\(Index)")
        if Index == 0{
            cell.BackImage.image = UIImage.init(named: "整单优惠背景03")
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
        return CGSize(width:( CollectionView.width - 30*WidthW)/3, height: 138*WidthW)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("=============点击了 第 \(indexPath.row) 商品")
        
        self.selectIndex=indexPath.row
        self.CollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0{
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ZWOrderYouHuiHeaderCellJoe", for: indexPath) as! ZWOrderYouHuiHeaderCellJoe
                return headerView
            }else{
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ZWOrderYouHuiHeaderCellJoe", for: indexPath) as! ZWOrderYouHuiHeaderCellJoe
                headerView.titleLabel.text = "整单立减"
                return headerView
            }
        }

        return UICollectionReusableView()
    }
    
    
    //设置HeadView的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: ScreenWidth, height: 70*WidthW)
    }
    
    
    
}
