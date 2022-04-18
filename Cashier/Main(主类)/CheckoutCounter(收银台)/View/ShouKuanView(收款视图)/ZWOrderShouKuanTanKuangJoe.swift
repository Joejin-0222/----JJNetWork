//
//  ZWOrderShouKuanTanKuang.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/13.
//

import UIKit

class ZWOrderShouKuanTanKuangJoe: basePopView ,SementSelectClickDelegate{
    
    private var selectIndex:Int = 0   //    记录点击了第几个
    //中间 显示 内容
    fileprivate let CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    var dataAarry  : NSArray? = []

    //顶部 分段选择器
    
    let testSementView : ZWCheckSementViewJoe =  ZWCheckSementViewJoe()
    //
    lazy var topline : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#EBEDF0")
        return view
    }()
    //
    //取消收款
    lazy var QuDanBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("取单收款", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
        Btn.setTitleColor(MainColor, for: .normal)
        Btn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        return Btn
    }()
    
    let bgView = UIView() //白色框动画控件
   
    override func configUI() {
        self.createAlertView()
    }
    
    //MARK:创建
    func createAlertView() {
        
        self.backView.snp.remakeConstraints { make in
            make.left.equalTo((LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)
            make.width.equalTo(ScreenWidth - (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)
            make.height.equalTo(ScreenHeight)
        }
        //spring动画白底(弹出主体)
        bgView.frame = CGRect(x: (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW, y: 0, width: ScreenWidth - (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        bgView.layer.cornerRadius = 0
        bgView.clipsToBounds = true
     
        self.addSubview(bgView)
        bgView.isUserInteractionEnabled = true
     

        //一级分类
        testSementView.IsScrollEnabled = false //不让滚动
        testSementView.delegate = self//遵守点击分段选择代理
        testSementView.YesNetWork = false //是网络数据
        testSementView.SelectTextColor =  "#FE4B48"
        testSementView.columnNum = 4 //设置为两列
        testSementView.IsHiddenFenGeLine = true //是否显示分割xian
        bgView.addSubview(testSementView.initView())
        testSementView.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left).offset(30*WidthW)
            make.top.equalTo(124*WidthW)
            make.height.equalTo(68*WidthW)
            make.right.equalTo(self.snp.right).offset(-30*WidthW)
        }
        testSementView.dataAarry =  ["扫码收款","现金收款","会员卡收款","标记收款"]
        self.testSementView.ReloadData()
        testSementView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        
        bgView.addSubview(topline)
        topline.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left)
            make.right.equalTo(bgView.snp.right)
            make.height.equalTo(3*WidthW)
            make.top.equalTo(testSementView.snp.bottom).offset(0*WidthW)
        }
        //
        //取单
        QuDanBtn.cornerRadius(cornerRadius: 32*WidthW, borderColor:MainColor, borderWidth: 1)
        self.addSubview(QuDanBtn)
        QuDanBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-104*WidthW)
            make.centerX.equalTo(testSementView.snp.centerX)
            make.width.equalTo(216*WidthW)
            make.height.equalTo(64*WidthW)
        }
        //
        self.initCollectionView()
    }
    func initCollectionView(){
        //
        let myflowLayout = UICollectionViewFlowLayout()
        myflowLayout.sectionHeadersPinToVisibleBounds = false // 头部悬浮
        myflowLayout.minimumLineSpacing = 1
        myflowLayout.minimumInteritemSpacing = 0
        myflowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        myflowLayout.scrollDirection = .horizontal
        self.CollectionView.collectionViewLayout = myflowLayout
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        CollectionView.isScrollEnabled = false
        CollectionView.backgroundColor = UIColor.clear
        CollectionView.showsHorizontalScrollIndicator = false
        CollectionView.register(ZWSaoMaShouKuanCollectionCellJoe.self, forCellWithReuseIdentifier: "ZWSaoMaShouKuanCollectionCellJoe")
        CollectionView.register(ZWVipCollectionViewJoe.self, forCellWithReuseIdentifier: "ZWVipCollectionViewJoe")
        CollectionView.register(ZWCashCollectionViewJoe.self, forCellWithReuseIdentifier: "ZWCashCollectionViewJoe")
        CollectionView.register(ZWSignCollectionViewJoe.self, forCellWithReuseIdentifier: "ZWSignCollectionViewJoe")
        
        self.addSubview(self.CollectionView)
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(testSementView.snp.bottom).offset(0*HeighH)
            make.left.equalTo(bgView.snp.left).offset(0*WidthW)
            make.right.equalTo(bgView.snp.right).offset(0*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-220*HeighH)
        }
        
    }
    
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        self.scrollcollview(index: IndexPath)
    }
    
    func scrollcollview(index: Int){
        let indexpath = IndexPath.init(row: index , section: 0)
        self.CollectionView.scrollToItem(at: indexpath, at: UICollectionView.ScrollPosition.left, animated: false)

    }
    
    
   }

extension ZWOrderShouKuanTanKuangJoe:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWSaoMaShouKuanCollectionCellJoe", for: indexPath) as! ZWSaoMaShouKuanCollectionCellJoe
            return cell
        }else if indexPath.row == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCashCollectionViewJoe", for: indexPath) as! ZWCashCollectionViewJoe
            return cell
        }else if indexPath.row == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWVipCollectionViewJoe", for: indexPath) as! ZWVipCollectionViewJoe
            return cell
        }else if indexPath.row == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWSignCollectionViewJoe", for: indexPath) as! ZWSignCollectionViewJoe
            return cell
        }
        
   
        return UICollectionViewCell()
    }
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5;
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5;
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: bgView.width , height: ScreenHeight - 220*WidthW)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("=============点击了 第 \(indexPath.row) 商品")
    }
    
}
