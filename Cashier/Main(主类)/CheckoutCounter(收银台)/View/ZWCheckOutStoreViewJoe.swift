//
//  ZWCheckOutStoreViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/3/31.
//

import UIKit
import Accelerate

protocol GoodsSelectDelegate : NSObjectProtocol{
    func GoodsSelectIndexPathClick(IndexPath:Int,GoodsArray:[goodsModel])
}


class ZWCheckOutStoreViewJoe: UIView, SementSelectClickDelegate ,ZWMoreCategoriesPopViewDelegate{
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
    weak var GoodsDelegate: GoodsSelectDelegate?
    
    var OrderDataAarry   = [goodsModel]()//订单列表 数据
    
    var pageNum:Int = 0   //    请求商品页数
    
    var IsUpData : Bool = false // 是否更新请求网路数据
    
    var CategoriesDataAarry  : NSArray = []//分段选择数据
    var dataAarry  : NSArray = []
    //更多分类弹框
    var popMoreCategoriesView = ZWMoreCategoriesPopView()
    //loading
    let loadingView = ZWLoadingTanKuangView(x:0, y: 0, width:( ScreenWidth), height: ScreenHeight)
    
    //顶部搜索和个人信息view
    var TopSeachAndUserView : ZWCheckOutTopView = ZWCheckOutTopView()
    
    //分段选择view
    lazy var SenmentBottomView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    //分段选择器
    var SementView : ZWCheckSementViewJoe = ZWCheckSementViewJoe()//右半边商品view
    
    private var SementViewSelectIndex:Int = 0   //    记录点击了第几行
    //中间商品列表
    fileprivate let CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    //底部view
    var BottomView : ZWCheckStoreBottomView = ZWCheckStoreBottomView()//底部view
    
    
    func initView() -> UIView {
        
     
        //更新网络数据
        if IsUpData == true {
            //删除 商品 表
            goodsModel.deleteAll()
            //删除 分类 表
            ZWSementGRDB.deleteAll()
            
            self.loadFenLeiData(ShopId: (Cache.userSto?.sid ?? 0))//分类
            
            loadGoodsData(categoryId: 0, pageNum: pageNum )//商品 所有商品 网络请求
            
            ProgressHUD.showLoadingHudView(message: "Loading")
            
        }else{
            //加载本地数据
            self.saveGRDBData(array: [])
        }
        
        
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
        
        self.backgroundColor = UIColor.white
        
        //顶部搜索和个人信息view
        self.addSubview(TopSeachAndUserView.initView())
        TopSeachAndUserView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(24*WidthW)
            make.right.equalTo(self.snp.right).offset(-24*WidthW)
            make.top.equalTo(self.snp.top).offset(8*WidthW)
            make.height.equalTo(96*WidthW)
        }
        
        //
        SenmentBottomView.cornerRadius(cornerRadius: 34*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        self.addSubview(SenmentBottomView)
        SenmentBottomView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(24*WidthW)
            make.right.equalTo(self.snp.right).offset(-24*WidthW)
            make.top.equalTo(self.snp.top).offset(112*WidthW)
            make.height.equalTo(68*WidthW)
        }
        
        SementView.IsScrollEnabled = true //可滚动
        SementView.IsHiddenIndicator = false //是否显示指示器
        SementView.delegate = self//遵守点击分段选择代理
        SementView.YesNetWork = true //是网络数据
        SementView.columnNum = 6 //设置为两列
        SenmentBottomView.addSubview(SementView.initView())
        SementView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(0)
            make.height.equalTo(self.snp.height)
            make.right.equalTo(self.snp.right).offset(-80*WidthW)
        }
        //分段选择 右侧更多按钮
        let moreBtn = UIButton()
        moreBtn.setImage(UIImage.init(named: "收银台-分段选择more"), for: .normal)
        SenmentBottomView.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { make in
            make.centerY.equalTo(SenmentBottomView.snp.centerY)
            make.right.equalTo(SenmentBottomView.snp.right).offset(-20*WidthW)
            make.width.height.equalTo(36*WidthW)
        }
        moreBtn.addTarget(self, action: #selector(moreBtnClick), for: .touchUpInside)
        
        
        //添加底部view
        self.addSubview(BottomView.initView())
        BottomView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(104*WidthW)
            make.right.equalTo(self.snp.right)
        }
        //
        CollectionView.snp.makeConstraints { make in
            make.top.equalTo(SenmentBottomView.snp.bottom).offset(24*HeighH)
            make.left.equalTo(SenmentBottomView.snp.left)
            make.right.equalTo(SenmentBottomView.snp.right)
            make.bottom.equalTo(BottomView.snp.top).offset(0*HeighH)
        }
        
        
        return self
    }
    
    //点击了更多分类
    @objc func moreBtnClick(){
        //更多分类弹框
        
        popMoreCategoriesView = ZWMoreCategoriesPopView().initView() as! ZWMoreCategoriesPopView
        popMoreCategoriesView.show()
        popMoreCategoriesView.dataAarry = self.CategoriesDataAarry
        popMoreCategoriesView.Delegate = self //遵守协议
        popMoreCategoriesView.selectIndex =  self.SementViewSelectIndex //默认进去选择第几个
    }
    //popMoreCategoriesView.Delegate = self 协议 点击方法
    func MoreCategoriesSelectIndexPathClick(IndexPath: Int, model: ZWSementGRDB) {
        self.dataAarry = goodsModel.queryAll(categoryId:"\(model.id)") as NSArray //本地数据 查询显示
        self.CollectionView.reloadData()
        
        self.SementViewSelectIndex = IndexPath
        popMoreCategoriesView.closeBtnClick()
        
        SementView.selectIndex = self.SementViewSelectIndex //
        SementView.ReloadData()
        
    }
    
    
    //load  分类 数据
    func loadFenLeiData(ShopId:Int64){
        let dict = ["shopId":ShopId]
        
        ZHFNetwork.request(target: .yesParameters(pathStr: getFindCashier, parameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            let tempAarry : NSArray = dic["data"] as! NSArray
            //            let tempArray1 = [ZWCheckSementModelJoe].deserialize(from: tempAarry)! as NSArray
            //            self.SementView.dataAarry = tempArray1
            //            self.SementView.ReloadData()
            //            self.CategoriesDataAarry = tempArray1//更多分类数据
            //            //默认选择第一个分类
            //            let model : ZWCheckSementModelJoe = tempArray1[0] as! ZWCheckSementModelJoe
            //
            //            loadGoodsData(categoryId: model.id)//
            
            let tempArrayGRDB  = [ZWSementGRDB].deserialize(from: tempAarry)
            
            self.saveGRDBData(array: tempArrayGRDB!)
            //            ProgressHUD.showSuccesshTips(message: "Load complete!")
            
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    
    //收银台 分类 数据 保存本地数据库
    func saveGRDBData(array:[ZWSementGRDB?]){
        ZWSementGRDB.insertAllArrData(ArrData: array)
        // 查询数据
        debugPrint("======查询分类所有数据:", ZWSementGRDB.queryAll())
        let  tempArray = ZWSementGRDB.queryAll() as NSArray
        //传值
        self.SementView.dataAarry =  tempArray
        self.SementView.ReloadData()
        self.CategoriesDataAarry = tempArray//更多分类弹框数据
        
        //默认 选中第一个 去查询本地数据库更新 CollectionView 显示
        if tempArray.count > 0 {
            let model : ZWSementGRDB = tempArray[0] as! ZWSementGRDB
            self.dataAarry = goodsModel.queryAll(categoryId:"\(model.id)") as NSArray //本地数据 查询显示
            self.CollectionView.reloadData()
        }
    }
    // 06. 实现代理方法
    func SelectIndexPathClick(IndexPath: Int,model:ZWSementGRDB) {
        print("======分段选择点击了第几\(IndexPath)")
        self.SementViewSelectIndex = IndexPath
        // 查询数据
        debugPrint("======查询商品 所有数据:", goodsModel.queryAll())
        
        self.dataAarry = goodsModel.queryAll(categoryId:"\(model.id)") as NSArray //本地数据 查询显示
        
        self.CollectionView.reloadData()
    }
    
    //商品数据
    func loadGoodsData(categoryId:Int64,pageNum:Int){
        var dict : [String : Any]
        if categoryId == 0 {
            dict = ["shopId":Cache.userSto?.sid ?? "156207556","tenantId":Cache.user?.tenantId ?? 6917,"selectText":"","categoryId":"","searchGoodsType":"1","pageNum":self.pageNum,"pageSize":"50"] as [String : Any]
        }else{
            dict = ["shopId":Cache.userSto?.sid ?? "156207556","tenantId":Cache.user?.tenantId ?? 6917,"selectText":"","categoryId":categoryId,"searchGoodsType":"1","pageNum":"1","pageSize":"20"] as [String : Any]
        }
        
        ZHFNetwork.request(target: .yesParameters(pathStr: getFindCashierGoods, parameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            let dataDic : NSDictionary = dic["data"] as! NSDictionary
            let tempAarry  : NSArray = dataDic["pageData"] as! NSArray
            
            if tempAarry.count > 0{
                
                let tempArrayGrdb  = [goodsModel].deserialize(from: tempAarry)
                //保存数据至数据库
                SaveGoodsGRDBData(array: tempArrayGrdb!)
                self.pageNum = self.pageNum + 1
                loadGoodsData(categoryId: 0, pageNum: self.pageNum)
            }else{
                ProgressHUD.showSuccesshTips(message: "Load complete!")
                ProgressHUD.hideHud()
            }
            
            
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    
    //收银台 商品 数据 保存本地数据库
    func SaveGoodsGRDBData(array:[goodsModel?]){
        goodsModel.insertAllArrData(ArrData: array)
        // 查询数据
        debugPrint("======查询商品 所有数据:", goodsModel.queryAll())
        
        //传值
        dataAarry = goodsModel.queryAll() as NSArray
        
        self.CollectionView.reloadData()
        
    }
    
}
extension ZWCheckOutStoreViewJoe:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //
        return  self.dataAarry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckOutStoreCellJoe", for: indexPath) as! ZWCheckOutStoreCellJoe
        //
        let model : goodsModel =   self.dataAarry[indexPath.row] as! goodsModel;
        cell.setModel(model: model)
        
        //        let arr : NSArray = ["蛋糕1","蛋糕2","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕1","蛋糕2","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕1","蛋糕2","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕1"]
        //        cell.storeIcon.image = UIImage.init(named: arr[indexPath.row] as! String)
        
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
        return CGSize(width:( self.SenmentBottomView.width - 26*WidthW) / 5, height: self.SenmentBottomView.width / 5 + 76*WidthW)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("=============点击了 第 \(indexPath.row) 商品")
        let model : goodsModel =   self.dataAarry[indexPath.row] as! goodsModel;
        
        let tempArray : NSMutableArray = []
        var Num = 0
        for obj  in self.OrderDataAarry {
            if  obj.skuViewId == model.skuViewId{
                Num += 1
                obj.goodsNum = obj.goodsNum ?? 1
                obj.goodsNum! += 1
                tempArray.add(obj)
            }else{
                tempArray.add(obj)
            }
        }
        
        if Num == 0{
            tempArray.add(model)
        }
        
        self.OrderDataAarry = tempArray as! [goodsModel]
        
        self.GoodsDelegate?.GoodsSelectIndexPathClick(IndexPath: indexPath.item, GoodsArray: self.OrderDataAarry)
        
        /// 注册 通知
        NotificationCenter.default.addObserver(self, selector: #selector(RemoveOrderListDataAarry), name: NSNotification.Name(rawValue: "RemoveOrderListDataAarry"), object: nil)
        
        
    }
    //收到通知移除 订单列表数据
    @objc func RemoveOrderListDataAarry(noti: NSNotification){
        debugPrint("=====RemoveOrderListDataAarry 通知")
        self.OrderDataAarry.removeAll()
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
    }
 
    
}
