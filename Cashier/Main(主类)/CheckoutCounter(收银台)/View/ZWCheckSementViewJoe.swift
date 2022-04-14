//
//  ZWCheckSementViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/1.
//

import UIKit

protocol SementSelectClickDelegate : NSObjectProtocol{
    func SelectIndexPathClick(IndexPath:Int,model:ZWCheckSementModelJoe)
}
typealias selectIndexPathBlock = (_ index: Int) -> Void

class ZWCheckSementViewJoe: UIView {
    var cornerRadius : CGFloat = 0.00 //圆角大小
    var selectBackgroundColor : UIColor = UIColor.clear //选中后的背景色
    var BackgroundColor : UIColor = UIColor.clear //背景色
    var textFont : CGFloat = 24.00 //字体大小
    var SelectTextColor : String = "#323233" //选中字体颜色
    var TextColor : String = "#969799" //字体颜色
    var IsScrollEnabled : Bool = false //是否滚动
    var IsHiddenIndicator : Bool = false //是否显示指示器
    var IsHiddenFenGeLine : Bool = false //是否隐藏分割线
    var YesNetWork : Bool = false //是否网络数据
    var SementModel = ZWCheckSementModelJoe()
    var dataAarry  : NSArray? = []
    var columnNum : CGFloat = 2 //列 默认为2
    var rowNum : CGFloat = 2 //行 默认为2
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
    weak var delegate: SementSelectClickDelegate?
    var selectIndexPathBlock : selectIndexPathBlock?
    
    private var selectIndex:Int = 0   //    记录点击了第几行
    fileprivate let CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    
    func initView() -> UIView {
        
        //
        let myflowLayout = UICollectionViewFlowLayout()
        myflowLayout.sectionHeadersPinToVisibleBounds = false // 头部悬浮
        myflowLayout.minimumLineSpacing = 0
        myflowLayout.minimumInteritemSpacing = 0
        myflowLayout.sectionInset = UIEdgeInsets(top: 0, left: 1*WidthW, bottom: 0, right: 0)
        myflowLayout.scrollDirection = .horizontal
        self.CollectionView.collectionViewLayout = myflowLayout
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        CollectionView.register(ZWCheckSementCellJoe.self, forCellWithReuseIdentifier: "ZWCheckSementCellJoe")
        CollectionView.contentOffset = CGPoint(x: 0,y: 0)
        CollectionView.showsHorizontalScrollIndicator = false
        self.addSubview(self.CollectionView)
        CollectionView.backgroundColor = UIColor.clear
        CollectionView.isScrollEnabled = IsScrollEnabled//是否可以滚动
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(1*WidthW)
            make.left.equalTo(self.snp.left).offset(1*WidthW)
            make.right.equalTo(self.snp.right).offset(-1*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-1*WidthW)
        }
        CollectionView.cornerRadius(cornerRadius: cornerRadius, borderColor: UIColor.clear, borderWidth: 1)
        //默认选中第一行
        DispatchQueue.main.async {
            let indexpath = IndexPath.init(row: self.selectIndex , section: 0)
            self.CollectionView.selectItem(at: indexpath, animated: false, scrollPosition: UICollectionView.ScrollPosition.top)
        }
        return self
    }
    func ReloadData(){
        self.CollectionView.reloadData()
    }
  
}
extension ZWCheckSementViewJoe:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.dataAarry?.count ?? 0 > 0{
            return self.dataAarry?.count ?? 0
        }
        return  2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckSementCellJoe", for: indexPath) as! ZWCheckSementCellJoe
        cell.backgroundColor = UIColor.clear
        //
        if self.dataAarry?.count ?? 0 > 0 {
        if YesNetWork == true {
            let model : ZWCheckSementModelJoe =  self.dataAarry![indexPath.row] as! ZWCheckSementModelJoe;
            cell.TitleLabel.text =  model.name
        }else{
            cell.TitleLabel.text =  self.dataAarry![indexPath.row] as? String
        }
        }
    
        if  self.selectIndex == indexPath.row {
            cell.IndicatorView.isHidden = false
            cell.TitleLabel.textColor = UIColor.init(hex: SelectTextColor)
            //cell的背景色
            cell.backgroundColor = selectBackgroundColor
            
        }else{
            cell.TitleLabel.textColor = UIColor.init(hex: TextColor)
            cell.IndicatorView.isHidden = true
            //cell的背景色
            cell.backgroundColor = BackgroundColor
            
        }
        //隐藏最后一个分割线
        if indexPath.row == (self.dataAarry?.count ?? 0) - 1{
            
            cell.verticalView.isHidden = true
        }else {
            if IsHiddenFenGeLine == true {
                cell.verticalView.isHidden = true
            }else{
                cell.verticalView.isHidden = false
            }
        }
        //是否显示指示器
        if IsHiddenIndicator {
            cell.IndicatorView.backgroundColor = UIColor.clear
        }else{
            cell.IndicatorView.backgroundColor = MainColor
        }
      
        //字体大小
        cell.TitleLabel.font = UIFont.systemFont(ofSize: textFont*WidthW)
       
        
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
       
        return CGSize(width:( self.CollectionView.width - 1) / columnNum, height: self.CollectionView.height)
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectIndex=indexPath.row
        self.CollectionView.reloadData()
        if self.dataAarry?.count ?? 0 > 0 {
            if YesNetWork == true {
                let model : ZWCheckSementModelJoe =  self.dataAarry![indexPath.row] as! ZWCheckSementModelJoe;
                
                // 04. 执行代理
                delegate?.SelectIndexPathClick(IndexPath: indexPath.row,model: model)
            }else {
                let model : ZWCheckSementModelJoe  = ZWCheckSementModelJoe()
                // 04. 执行代理
                delegate?.SelectIndexPathClick(IndexPath: indexPath.row,model: model)

                if selectIndexPathBlock != nil {
                    selectIndexPathBlock!(indexPath.row)
                }

            }
          
        }
    }
}
