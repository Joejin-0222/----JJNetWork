//
//  ZWChooseGoodsClassTanKuangView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import UIKit
import SkeletonView

//import Spring
class ZWQuDanTanKuangView: basePopView ,SementSelectClickDelegate{
    
    private var selectIndex:Int = 0   //    记录点击了第几行
    var dataAarry  : NSArray? = []
    fileprivate let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    //顶部 分段选择器
    
    let testSementView : ZWCheckSementViewJoe =  ZWCheckSementViewJoe()
    //二级分类
    let TwoSementView : ZWCheckSementViewJoe = ZWCheckSementViewJoe()
    
    
    //分段选择 圆边 view
    lazy var SenmentBottomView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    
    //商品信息view
    lazy var goodsInfoView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    var dataAarryTableView : NSArray = []
    
    
    /// 根据RGBA生成颜色(格式为：22,22,22,0.5)
    var SM_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
    }
    
    typealias clickAlertClosure = (_ index: Int) -> Void //声明闭包，点击按钮传值
    //把申明的闭包设置成属性
    var clickClosure: clickAlertClosure?
    //为闭包设置调用函数
    func clickIndexClosure(_ closure:clickAlertClosure?){
        //将函数指针赋值给myClosure闭包
        clickClosure = closure
    }
    
    let bgView = UIView() //白色框动画控件
   
    let cancelBtn = UIButton() //取消按钮
    let DeleteBtn = UIButton() //删除按钮
    let sureBtn = UIButton() //确定按钮
    let JieSuanBtn = UIButton() //结算按钮
    
  
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
        bgView.frame = CGRect(x: (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW, y: 0, width: ScreenWidth, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        bgView.layer.cornerRadius = 0
        bgView.clipsToBounds = true
     
        
        self.addSubview(bgView)
        bgView.isUserInteractionEnabled = true
     
        //取消按钮 返回按钮
        cancelBtn.frame = CGRect(x: 63*WidthW, y: 70*WidthW, width: 92*WidthW, height: 92*WidthW)
        //        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        cancelBtn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        bgView.addSubview(cancelBtn)
        //一级分类
        testSementView.delegate = self//遵守点击分段选择代理
        testSementView.YesNetWork = false //是网络数据
        testSementView.columnNum = 2 //设置为两列
        bgView.addSubview(testSementView.initView())
        testSementView.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left).offset(360*WidthW)
            make.top.equalTo(70*WidthW)
            make.height.equalTo(92*WidthW)
            make.right.equalTo(self.snp.right).offset(-360*WidthW)
        }
        testSementView.dataAarry =  ["收银台取单","小程序台取单"]
        self.testSementView.ReloadData()
        testSementView.backgroundColor = UIColor.init(hex: "#F3F3F5")//背景色
        
        
        //二级分类 view
        SenmentBottomView.cornerRadius(cornerRadius: 36*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        bgView.addSubview(SenmentBottomView)
        SenmentBottomView.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp.left).offset(38*WidthW)
            make.right.equalTo(self.snp.right).offset(-38*WidthW)
            make.top.equalTo(cancelBtn.snp.bottom).offset(25*WidthW)
            make.height.equalTo(72*WidthW)
        }
        //
        TwoSementView.cornerRadius = 36*WidthW//圆角大小
        TwoSementView.delegate = self//遵守点击分段选择代理
        TwoSementView.YesNetWork = false //是网络数据
        TwoSementView.columnNum =  8 //设置为 8列
        bgView.addSubview(TwoSementView.initView())
        TwoSementView.snp.makeConstraints { make in
            make.left.equalTo(SenmentBottomView.snp.left).offset(0*WidthW)
            make.top.equalTo(SenmentBottomView.snp.top)
            make.bottom.equalTo(SenmentBottomView.snp.bottom)
            make.right.equalTo(SenmentBottomView.snp.right)
        }
        TwoSementView.dataAarry =  ["16:19:10","16:19:10","16:19:10","16:19:10","16:19:10","16:19:10","16:19:10","16:19:10","16:19:10","16:19:10","16:19:10"]
        self.TwoSementView.ReloadData()
        
        //取单按钮
        //        sureBtn.backgroundColor = MainColor
        sureBtn.setTitle("取单", for: .normal)
        sureBtn.setTitleColor(MainColor, for: UIControl.State())
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
        sureBtn.layer.cornerRadius = 3
        sureBtn.clipsToBounds = true
        sureBtn.tag = 3
        sureBtn.addTarget(self, action: #selector(clickBtnAction(sender:)), for: .touchUpInside)
        sureBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: MainColor, borderWidth: 1)
        bgView.addSubview(sureBtn)
        let CenterX = (( ScreenWidth - (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)/2 - 184*WidthW/2)
        sureBtn.snp.makeConstraints { make in
            make.top.equalTo(bgView.snp.bottom).offset(-94*WidthW)
            make.left.equalTo(CenterX)
            make.width.equalTo(184*WidthW)
            make.height.equalTo(56*WidthW)
        }
        //结算
        JieSuanBtn.backgroundColor = MainColor
        JieSuanBtn.setTitle("结算", for: .normal)
        JieSuanBtn.setTitleColor(UIColor.white, for: UIControl.State())
        JieSuanBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
        JieSuanBtn.layer.cornerRadius = 3
        JieSuanBtn.clipsToBounds = true
        JieSuanBtn.tag = 2
        JieSuanBtn.addTarget(self, action: #selector(clickBtnAction(sender:)), for: .touchUpInside)
        JieSuanBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: MainColor, borderWidth: 1)
        bgView.addSubview(JieSuanBtn)
        JieSuanBtn.snp.makeConstraints { make in
            make.left.equalTo(self.sureBtn.snp.right).offset(94*WidthW)
            make.top.equalTo(sureBtn.snp.top)
            make.width.equalTo(184*WidthW)
            make.height.equalTo(56*WidthW)
        }
        //删除
        DeleteBtn.setTitle("删除", for: .normal)
        DeleteBtn.setTitleColor(MainColor, for: UIControl.State())
        DeleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
        DeleteBtn.layer.cornerRadius = 3
        DeleteBtn.clipsToBounds = true
        DeleteBtn.tag = 1
        DeleteBtn.addTarget(self, action: #selector(clickBtnAction(sender:)), for: .touchUpInside)
        DeleteBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: MainColor, borderWidth: 1)
        bgView.addSubview(DeleteBtn)
        DeleteBtn.snp.makeConstraints { make in
            make.right.equalTo(self.sureBtn.snp.left).offset(-94*WidthW)
            make.top.equalTo(sureBtn.snp.top)
            make.width.equalTo(184*WidthW)
            make.height.equalTo(56*WidthW)
        }
        
        //
        
        goodsInfoView.cornerRadius(cornerRadius: 12*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        bgView.addSubview(goodsInfoView)
        goodsInfoView.snp.makeConstraints { make in
            make.left.equalTo(SenmentBottomView.snp.left)
            make.right.equalTo(SenmentBottomView.snp.right)
            make.top.equalTo(SenmentBottomView.snp.bottom).offset(28*WidthW)
            make.bottom.equalTo(DeleteBtn.snp.top).offset(-28*WidthW)
        }
        //
        let titleview = UIView()
        titleview.backgroundColor = UIColor.init(hex: "#F3F3F5")
        goodsInfoView.addSubview(titleview)
        titleview.snp.makeConstraints { make in
            make.left.equalTo(goodsInfoView.snp.left).offset(0*WidthW)
            make.right.equalTo(goodsInfoView.snp.right).offset(0*WidthW)
            make.top.equalTo(goodsInfoView.snp.top).offset(0*WidthW)
            make.height.equalTo(64*WidthW)

        }
        
        //
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22*WidthW)
        titleLabel.text = "商品信息"
        titleview.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(goodsInfoView.snp.left).offset(28*WidthW)
            make.top.equalTo(titleview.snp.top).offset(0*WidthW)
            make.bottom.equalTo(titleview.snp.bottom).offset(0*WidthW)

        }
        //
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 19*WidthW)
        timeLabel.text = "2021-10-10 13:13;12"
        titleview.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.right.equalTo(titleview.snp.right).offset(-28*WidthW)
            make.top.equalTo(titleview.snp.top).offset(0*WidthW)
            make.bottom.equalTo(titleview.snp.bottom).offset(0*WidthW)
        }
        //
        goodsInfoView.addSubview(TableView)
        TableView.estimatedRowHeight =  130
        TableView.rowHeight = UITableView.automaticDimension
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(titleview.snp.bottom).offset(0*WidthW)
            make.left.equalTo(goodsInfoView.snp.left)
            make.right.equalTo(goodsInfoView.snp.right)
            make.bottom.equalTo(goodsInfoView.snp.bottom).offset(0*WidthW)
        }
        
    }
   
    @objc func clickBtnAction(sender: UIButton){
        
    }
    
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    
 
    func setCollectionview(){
        //
        let myflowLayout = UICollectionViewFlowLayout()
        myflowLayout.sectionHeadersPinToVisibleBounds = false // 头部悬浮
        myflowLayout.minimumLineSpacing = 0
        myflowLayout.minimumInteritemSpacing = 0
        myflowLayout.sectionInset = UIEdgeInsets(top: 0, left: 13*WidthW, bottom: 0, right: 0)
        myflowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = myflowLayout
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.register(ZWCheckSementCellJoe.self, forCellWithReuseIdentifier: "ZWCheckSementCellJoe")
        collectionView.contentOffset = CGPoint(x: 0,y: 0)
                self.addSubview(self.collectionView)
                //        CollectionView.backgroundColor = UIColor.init(hex: "#DCDEE0")
                collectionView.snp.makeConstraints { make in
                    make.left.equalTo(bgView.snp.left).offset(382*WidthW)
                    make.centerY.equalTo(cancelBtn.snp.centerY).offset(50)
                    make.height.equalTo(80*WidthW)
                    make.width.equalTo( 400*WidthW)
                }
        //默认选中第一行
        DispatchQueue.main.async {
            let indexpath = IndexPath.init(row: self.selectIndex , section: 0)
            self.collectionView.selectItem(at: indexpath, animated: false, scrollPosition: UICollectionView.ScrollPosition.top)
        }
    }
}

extension ZWQuDanTanKuangView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("====\(indexPath.row)")
    }
}

extension ZWQuDanTanKuangView : SkeletonTableViewDataSource,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1//self.dataAarryTableView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let arr : NSArray = self.dataAarryTableView[section] as! NSArray
        
        return 4//arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWTanKuangTableViewCell =  ZWTanKuangTableViewCell.createWithTableViewCell(tableView: tableView) as! ZWTanKuangTableViewCell
//        let arr : NSArray = self.dataAarryTableView[indexPath.section] as! NSArray
        
//        cell.content01.text = arr[indexPath.row] as? String
//
//        if indexPath.row == 0{
//            cell.IconImage.image = UIImage.init(named: "set\((arr[indexPath.row] as? String)!)")
//            cell.content01.font = UIFont(name: "PingFangHK-Bold", size: 22*WidthW)
//        }else{
//            cell.IconImage.image = UIImage.init(named: "")
//            cell.content01.font = UIFont.systemFont(ofSize: 22*WidthW)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120*WidthW
    }
    
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }
        return 5
    }
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if indexPath.section == 0 {
            return "CashierSettingView"
        }
        return "CashierSettingView"
    }
   

}




extension ZWQuDanTanKuangView:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.dataAarry?.count ?? 0 > 0{
            return self.dataAarry?.count ?? 0
        }
        return  2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckSementCellJoe", for: indexPath) as! ZWCheckSementCellJoe
        
        //
        if self.dataAarry?.count ?? 0 > 0 {
            
            cell.TitleLabel.text =  self.dataAarry![indexPath.row] as? String
        }
        
        if  self.selectIndex == indexPath.row {
            cell.IndicatorView.isHidden = false
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
        
        
        return CGSize(width:( self.collectionView.width - 30) / 2, height: self.collectionView.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectIndex=indexPath.row
        self.collectionView.reloadData()
    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        self.selectIndex=indexPath.row
    //        self.collectionView.reloadData()
    //        if self.dataAarry?.count ?? 0 > 0 {
    ////            let model : ZWCheckSementModelJoe =  self.dataAarry![indexPath.row] as! ZWCheckSementModelJoe;
    //
    ////            // 04. 执行代理
    ////            delegate?.SelectIndexPathClick(IndexPath: indexPath.row,model: model)
    //        }
    //      }
}
