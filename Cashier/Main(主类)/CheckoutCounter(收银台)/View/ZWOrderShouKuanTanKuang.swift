//
//  ZWOrderShouKuanTanKuang.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/13.
//

import UIKit

class ZWOrderShouKuanTanKuang: UIView ,SementSelectClickDelegate{
    
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
        Btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return Btn
    }()
    
    typealias clickAlertClosure = (_ index: Int) -> Void //声明闭包，点击按钮传值
    //把申明的闭包设置成属性
    var clickClosure: clickAlertClosure?
    //为闭包设置调用函数
    func clickIndexClosure(_ closure:clickAlertClosure?){
        //将函数指针赋值给myClosure闭包
        clickClosure = closure
    }
    
    let bgView = UIView() //白色框动画控件
   
    
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat ) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
  
        createAlertView()
    }
    
    //MARK:创建
    func createAlertView() {
        
        //布局
        self.frame = CGRect(x: x, y: y, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
  
        //spring动画白底(弹出主体)
        bgView.frame = CGRect(x: (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW, y: 0, width: ScreenWidth - (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        bgView.layer.cornerRadius = 0
        bgView.clipsToBounds = true
     
        
        self.addSubview(bgView)
        bgView.isUserInteractionEnabled = true
     
       
        //一级分类
        testSementView.delegate = self//遵守点击分段选择代理
        testSementView.YesNetWork = false //是网络数据
        testSementView.SelectTextColor =  "#FE4B48"
        testSementView.columnNum = 5 //设置为两列
        testSementView.IsHiddenFenGeLine = true //是否显示分割xian
        bgView.addSubview(testSementView.initView())
        testSementView.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left).offset(30*WidthW)
            make.top.equalTo(124*WidthW)
            make.height.equalTo(92*WidthW)
            make.right.equalTo(self.snp.right).offset(-30*WidthW)
        }
        testSementView.dataAarry =  ["扫码收款","现金收款","现金收款","会员卡收款","标记收款"]
        self.testSementView.ReloadData()
        testSementView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        
        bgView.addSubview(topline)
        topline.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left)
            make.right.equalTo(bgView.snp.right)
            make.height.equalTo(3*WidthW)
            make.top.equalTo(testSementView.snp.bottom).offset(-22*WidthW)
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
        CollectionView.register(ZWCheckOutStoreCellJoe.self, forCellWithReuseIdentifier: "ZWCheckOutStoreCellJoe")
        
        self.addSubview(self.CollectionView)
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(testSementView.snp.bottom).offset(0*HeighH)
            make.left.equalTo(testSementView.snp.left)
            make.right.equalTo(testSementView.snp.right)
            make.bottom.equalTo(self.snp.bottom).offset(-220*HeighH)
        }
    }
    
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    
    //MARK:按键的对应的方法
    @objc func clickBtnAction( sender : UIButton) {
        if (clickClosure != nil) {
            clickClosure!(sender.tag)
        }
        dismiss()
    }
    //MARK:消失
    @objc func dismiss() {
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.bgView.alpha = 0
            self.alpha = 0
        }, completion: { (finish) -> Void in
            if finish {
                self.removeFromSuperview()
            }
        })
    }
    /** 指定视图实现方法 */
    func show() {
        let wind = UIApplication.shared.keyWindow
        self.alpha = 0
        
        wind?.addSubview(self)
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.alpha = 1
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   }

extension ZWOrderShouKuanTanKuang:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckOutStoreCellJoe", for: indexPath) as! ZWCheckOutStoreCellJoe
   
        return cell
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
