//
//  ZWCheckOutStoreViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/3/31.
//

import UIKit

class ZWCheckOutStoreViewJoe: UIView, SementSelectClickDelegate ,ZWMoreCategoriesPopViewDelegate{
    
    
    
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
        //
        self.loadFenLeiData(ShopId: (Cache.userSto?.sid ?? 0))
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
        
        //           loadingView.show()
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
    func MoreCategoriesSelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        self.loadGoodsData(categoryId: model.id)
        popMoreCategoriesView.closeBtnClick()
        self.SementViewSelectIndex = IndexPath
        
        SementView.selectIndex = self.SementViewSelectIndex //
        SementView.ReloadData()
    }
    
    
    //分类
    func loadFenLeiData(ShopId:Int64){
        let dict = ["shopId":ShopId]
        
        //    ProgressHUD.showLoadingHudView(message: "请求中")
        ZHFNetwork.request(target: .yesParameters(pathStr: getFindCashier, parameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            let tempAarry : NSArray = dic["data"] as! NSArray
            let tempArray = [ZWCheckSementModelJoe].deserialize(from: tempAarry)! as NSArray
            self.SementView.dataAarry = tempArray
            self.SementView.ReloadData()
            self.CategoriesDataAarry = tempArray//更多分类数据
            //默认选择第一个分类
            let model : ZWCheckSementModelJoe = tempArray[0] as! ZWCheckSementModelJoe
            
            loadGoodsData(categoryId: model.id)//
            
            
            self.SementView.dataAarry =  tempArray
            self.SementView.ReloadData()
            self.CategoriesDataAarry = tempArray//更多分类数据
            
            ProgressHUD.showSuccesshTips(message: "请求成功!")
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    //商品数据
    func loadGoodsData(categoryId:Int64){
        
        
        let dict = ["shopId":Cache.userSto?.sid ?? "156207556","tenantId":Cache.user?.tenantId ?? 6917,"selectText":"","categoryId":categoryId,"searchGoodsType":"1","pageNum":"1","pageSize":"20"] as [String : Any]
        
        //   ProgressHUD.showLoadingHudView(message: "请求中")
        ZHFNetwork.request(target: .yesParameters(pathStr: getFindCashierGoods, parameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            let dataDic : NSDictionary = dic["data"] as! NSDictionary
            let tempAarry  :NSArray = dataDic["pageData"] as! NSArray
            

       
            
//            goodsModel.insertAllArrData(ArrData: <#T##[goodsModel]#>)
            
            
            
            // 查询数据
            debugPrint("查询所有数据:", goodsModel.queryAll())
            
            ProgressHUD.showSuccesshTips(message: "请求成功!")
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    // 06. 实现代理方法
    func SelectIndexPathClick(IndexPath: Int,model:ZWCheckSementModelJoe) {
        print("======分段选择点击了第几\(IndexPath)")
        self.SementViewSelectIndex = IndexPath
        loadGoodsData(categoryId: model.id)//
    }
    
    // 1数组转json
    func getJSONStringFromArray(array:NSArray) -> String {
        if (!JSONSerialization.isValidJSONObject(array)){
            print("无法解析出JSONString")
            return ""
            
        }
        
        let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        
        return JSONString! as String
        
    }
    
    
    /**
     字典转换为JSONString
     
     - parameter dictionary: 字典参数
     
     - returns: JSONString
     */
    static  func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
}
extension ZWCheckOutStoreViewJoe:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.dataAarry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckOutStoreCellJoe", for: indexPath) as! ZWCheckOutStoreCellJoe
        //
        let model : PagedataModel =   self.dataAarry[indexPath.row] as! PagedataModel;
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
    }
    
    
    
    
}
