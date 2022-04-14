//
//  ZWCheckOutStoreViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/3/31.
//

import UIKit

class ZWCheckOutStoreViewJoe: UIView, SementSelectClickDelegate {
   
    
    var dataAarry  : NSArray = []
    
    
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
            make.top.equalTo(self.snp.top).offset(0*WidthW)
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
        SementView.IsHiddenIndicator = false //是否显示指示器
        SementView.delegate = self//遵守点击分段选择代理
        SementView.YesNetWork = true //是网络数据
        SementView.columnNum = 6 //设置为两列
        SenmentBottomView.addSubview(SementView.initView())
        SementView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(0)
            make.height.equalTo(self.snp.height)
            make.right.equalTo(self.snp.right)
        }
        
       
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
    //分类
    func loadFenLeiData(ShopId:Int64){
        let dict = ["shopId":ShopId]
        //
//        ProgressHUD.showLoadingHudView(message: "请求中")
        ZHFNetwork.request(target: .yesParameters(pathStr: getFindCashier, parameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            let tempAarry : NSArray = dic["data"] as! NSArray
            let tempArray = [ZWCheckSementModelJoe].deserialize(from: tempAarry)! as NSArray
            self.SementView.dataAarry = tempArray
            self.SementView.ReloadData()
          
            
            ProgressHUD.showSuccesshTips(message: "请求成功!")
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    //基本数据请求和模型转换
    func loadData(ShopId:Int64){
        let dict = ["shopId":ShopId,"tenantId":Cache.user?.tenantId ?? 0,"selectText":"","categoryId":"","searchGoodsType":"1","pageNum":"1","pageSize":"20"] as [String : Any]
        //
//        ProgressHUD.showLoadingHudView(message: "请求中")
        ZHFNetwork.request(target: .yesParameters(pathStr: getFindCashierGoods, parameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            let dataDic : NSDictionary = dic["data"] as! NSDictionary
            let tempAarry  :NSArray = dataDic["pageData"] as! NSArray
            self.dataAarry = [ZWCheckSementModelJoe].deserialize(from: tempAarry)! as NSArray
            self.CollectionView.reloadData()
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
        loadData(ShopId:model.id )//
    }
    
    
}
extension ZWCheckOutStoreViewJoe:UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZWCheckOutStoreCellJoe", for: indexPath) as! ZWCheckOutStoreCellJoe
        //
        //        let model : SelectStoreModelZJ =  self.dataAarry[indexPath.row] as! SelectStoreModelZJ;
        //        cell.storeLabel.text =  model.sname
        let arr : NSArray = ["蛋糕1","蛋糕2","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕1","蛋糕2","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕1","蛋糕2","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕2","蛋糕1","蛋糕3","蛋糕1"]
        cell.storeIcon.image = UIImage.init(named: arr[indexPath.row] as! String)
        
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
