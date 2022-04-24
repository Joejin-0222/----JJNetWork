//
//  ZWOrderViewJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/30.
//

import UIKit
protocol OrderWayTypeSelectDelegate : NSObjectProtocol{
    func SelectOrderWayTypeClick(IndexPath:Int)
}
enum OrderWayType : Int {
    case 挂单 = 0
    case 取单
    case 整单优惠
    case 预订
}

class ZWOrderViewJoe: UIView {
    
    var IsUpData : Bool = false // 是否更新请求网路数据
    
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
    weak  var delegate  : OrderWayTypeSelectDelegate?
    
    var OrderListDataAarry  = [goodsModel]()//: NSMutableArray? = []//订单列表数组
    
    var OrderGoodsmodel = goodsModel() //列表商品
    
    var dataAarry  : NSArray = []//分类标题数据
    private var selectIndex:Int=0   //    记录点击了第几行
    // logo 视图
    lazy var LogoImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "商家logo")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    // vip 视图
    lazy var VipImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "vip")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    //topline
    lazy var topLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "E6E9EB")
        
        return view
    }()
    
    //topview
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    var weighView : ZWOrderWeighView = ZWOrderWeighView()
    
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame:.zero ,style: .plain)
        tableview.backgroundColor = UIColor.clear
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    //底部view
    lazy var BottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    //整单取消
    lazy var allOrderCancelBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#FE4B48")
        Btn.setTitle("抹零收款", for: .normal)
        Btn.titleLabel?.font = UIFont(name: "PingFangSC-Medium", size: 26*WidthW)
        return Btn
    }()
    //所有价格信息view
    lazy var AllOrderView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#2D3342")
        return view
    }()
    //￥
    lazy var Label01 : UILabel = {
        let label = UILabel()
        label.text = "￥"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22*WidthW)
        label.textColor = UIColor.init(hex: "#ffffff")
        return label
    }()
    //12.99
    lazy var Label02 : UILabel = {
        let label = UILabel()
        label.text = "372.99"
        label.textAlignment = .left
        label.font = UIFont(name: "PingFangSC-Medium", size: 32*WidthW) //UIFont.systemFont(ofSize: 28*WidthW)
        label.textColor = UIColor.init(hex: "#ffffff")
        return label
    }()
    //共计 ===
    lazy var Label03 : UILabel = {
        let label = UILabel()
        label.text = "共107件,优惠:-1000.00"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16*WidthW)
        label.textColor = UIColor.init(hex: "#ffffff")
        return label
    }()
    
    //确定收款
    lazy var payBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#FFD726")
        Btn.setTitle("收款", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
        Btn.titleLabel?.font = UIFont(name: "PingFangSC-Semibold", size: 34*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#5C2B00"), for: .normal)
        return Btn
    }()
    //右边操作底部view 加减数量 等
    lazy var operationView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#F3F3F5")
        return view
    }()
    
    //左边线
    lazy var operationline01 : UIView = {
        let view = UIView()
        view.backgroundColor =  LineColor
        return view
    }()
    
    //右边线
    lazy var operationline02 : UIView = {
        let view = UIView()
        view.backgroundColor =  LineColor
        return view
    }()
    
    //预订
    lazy var YuDingBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("预订", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        let type : Int = OrderWayType.预订.rawValue
        Btn.tag = type
        Btn.addTarget(self, action: #selector(orderBtnClick(sender:)), for: .touchUpInside)
        return Btn
    }()
    //整单优惠
    lazy var AllOrderYouHuiBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("整单优惠", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        let type : Int = OrderWayType.整单优惠.rawValue
        Btn.tag = type
        Btn.addTarget(self, action: #selector(orderBtnClick(sender:)), for: .touchUpInside)
        return Btn
    }()
    //取单
    lazy var QuDanBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("取单", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        let type : Int = OrderWayType.取单.rawValue
        Btn.tag = type
        Btn.addTarget(self, action: #selector(orderBtnClick(sender:)), for: .touchUpInside)
        return Btn
    }()
    //挂单
    lazy var GuaDanBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("挂单", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        let type : Int = OrderWayType.挂单.rawValue
        Btn.tag = type
        Btn.addTarget(self, action: #selector(orderBtnClick(sender:)), for: .touchUpInside)
        
        return Btn
    }()
    //改价
    lazy var UpDataPriceBtn : UIButton = {
        let Btn = UIButton()
        Btn.setImage(UIImage.init(named: "改价"), for: .normal)
        return Btn
    }()
    
    //加减view
    lazy var addAndReduceView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    lazy var addAndReduceLine01 : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#DCDEE0")
        return view
    }()
    lazy var addAndReduceLine02 : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#DCDEE0")
        return view
    }()
    
    //计算 加减数量
    var numIndex : Int = 0
    
    //加
    lazy var addBtn : UIButton = {
        let Btn = UIButton()
        //        Btn.setTitle("+", for: .normal)
        Btn.setImage(UIImage.init(named: "订单加"), for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 38*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        return Btn
    }()
    //show 数量
    lazy var shownumLabel : UILabel = {
        let label = UILabel()
        label.text = "\(numIndex)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    //减
    lazy var ReduceBtn : UIButton = {
        let Btn = UIButton()
        //        Btn.setTitle("-", for: .normal)
        Btn.setImage(UIImage.init(named: "订单减"), for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 38*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        return Btn
    }()
    
    func initView() -> UIView {
        self.backgroundColor = UIColor.init(hex: "#ffffff")
        //
        self.addSubview(LogoImage)
        LogoImage.snp.makeConstraints { make in
            make.left.equalTo(16*WidthW)
            make.top.equalTo(28*WidthW)
            make.width.equalTo(192*WidthW)
            make.height.equalTo(48*WidthW)
        }
        //顶部分割线
        self.addSubview(topLineView)
        topLineView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(LogoImage.snp.bottom).offset(28*WidthW)
            make.height.equalTo(1.5*WidthW)
            make.width.equalTo(OrderTabelViewWidth*WidthW)
        }
        //称重底部view
        //        self.addSubview(topView)
        //        topView.snp.makeConstraints { make in
        //            make.top.equalTo(topLineView.snp.bottom).offset(0*WidthW)
        //            make.left.equalTo(self.snp.left)
        //            make.right.equalTo(self.snp.right)
        //            make.height.equalTo(127*WidthW)
        //        }
        //        topView.addSubview(weighView.initView())
        //        weighView.snp.makeConstraints { make in
        //            make.top.equalTo(topView.snp.top).offset(0*WidthW)
        //            make.left.equalTo(topView.snp.left)
        //            make.right.equalTo(topView.snp.right)
        //            make.bottom.equalTo(topView.snp.bottom)
        //        }
        
        
        //
        self.addSubview(TableView)
        TableView.backgroundColor =  UIColor.white
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(topLineView.snp.bottom).offset(0*WidthW)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-200*WidthW)
        }
        
        //
        self.addSubview(VipImage)
        VipImage.snp.makeConstraints { make in
            make.right.equalTo(TableView.snp.right).offset(-19*WidthW)
            make.centerY.equalTo(LogoImage.snp.centerY)
            make.width.equalTo(46*WidthW)
            make.height.equalTo(46*WidthW)
        }
        //
        BottomView.cornerRadius(cornerRadius: 40*WidthW)
        self.addSubview(BottomView)
        BottomView.backgroundColor = UIColor.red
        BottomView.snp.makeConstraints { make in
            make.height.equalTo(84*WidthW)
            make.left.equalTo(self.snp.left).offset(6*WidthW)
            make.width.equalTo(368*WidthW)
            make.bottom.equalTo(self.snp.bottom).offset(-24*WidthW)
        }
        
        //
        BottomView.addSubview(AllOrderView)
        AllOrderView.snp.makeConstraints { make in
            make.height.equalTo(BottomView.snp.height)
            make.left.equalTo(BottomView.snp.left).offset(0*WidthW)
            make.width.equalTo(232*WidthW)
        }
        
        AllOrderView.addSubview(Label01)
        Label01.snp.makeConstraints { make in
            //            make.top.equalTo(5*WidthW)
            make.left.equalTo(AllOrderView.snp.left).offset(25*WidthW)
            make.width.equalTo(18*WidthW)
            make.height.equalTo(40*WidthW)
        }
        AllOrderView.addSubview(Label02)
        Label02.snp.makeConstraints { make in
            make.top.equalTo(5*WidthW)
            make.left.equalTo(Label01.snp.right).offset(2*WidthW)
            make.right.equalTo(AllOrderView.snp.right).offset(-24*WidthW)
            make.bottom.equalTo(Label01.snp.bottom)
        }
        
        
        AllOrderView.addSubview(Label03)
        Label03.snp.makeConstraints { make in
            make.top.equalTo(Label02.snp.bottom)
            make.left.equalTo(AllOrderView.snp.left).offset(24*WidthW)
            make.right.equalTo(AllOrderView.snp.right).offset(-24*WidthW)
        }
        
        //提交支付 收款
        BottomView.addSubview(payBtn)
        payBtn.snp.makeConstraints { make in
            make.height.equalTo(BottomView.snp.height)
            make.left.equalTo(AllOrderView.snp.right)
            make.width.equalTo(136*WidthW)
        }
        payBtn.addTarget(self, action: #selector(payBtnClick), for: .touchUpInside)
        
        //
        self.addSubview(allOrderCancelBtn)
        allOrderCancelBtn.snp.makeConstraints { make in
            make.top.equalTo(payBtn.snp.top)
            make.height.equalTo(payBtn.snp.height)
            make.left.equalTo(payBtn.snp.right).offset(8*WidthW)
            make.right.equalTo(TableView.snp.right).offset(-8*WidthW)
        }
        allOrderCancelBtn.cornerRadius(cornerRadius: 16*WidthW)
        
        
        
        //右边操作加减 等view
        self.addSubview(operationView)
        operationView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(TableView.snp.right)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(self.snp.height)
        }
        //左边线
        //        operationline01.backgroundColor = UIColor.red
        operationView.addSubview(operationline01)
        operationline01.snp.makeConstraints { make in
            make.top.equalTo(operationView.snp.top)
            make.left.equalTo(operationView.snp.left).offset(0.5*WidthW)
            make.width.equalTo(2*WidthW)
            make.bottom.equalTo(operationView.snp.bottom)
        }
        //右边线
        operationView.addSubview(operationline02)
        operationline02.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.right.equalTo(operationView.snp.right).offset(0*WidthW)
            make.width.equalTo(1.5*WidthW)
            make.height.equalTo(operationView.snp.height)
        }
        
        
        //预订
        YuDingBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(YuDingBtn)
        YuDingBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-96*WidthW)
            make.left.equalTo(10*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        //整单优惠
        AllOrderYouHuiBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(AllOrderYouHuiBtn)
        AllOrderYouHuiBtn.snp.makeConstraints { make in
            make.bottom.equalTo(YuDingBtn.snp.top).offset(-20*WidthW)
            make.left.equalTo(10*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        //取单
        QuDanBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(QuDanBtn)
        QuDanBtn.snp.makeConstraints { make in
            make.bottom.equalTo(AllOrderYouHuiBtn.snp.top).offset(-20*WidthW)
            make.left.equalTo(10*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        //挂单
        GuaDanBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(GuaDanBtn)
        GuaDanBtn.snp.makeConstraints { make in
            make.bottom.equalTo(QuDanBtn.snp.top).offset(-20*WidthW)
            make.left.equalTo(10*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        
        //加减底层view
        let  reduceHeight : CGFloat = 232
        let  reduceWidth : CGFloat = 116
        addAndReduceView.cornerRadius(cornerRadius: 58*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(addAndReduceView)
        addAndReduceView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(102*WidthW)
            make.centerX.equalTo(operationView.snp.centerX)
            make.width.equalTo(reduceWidth*WidthW)
            make.height.equalTo(reduceHeight*WidthW)
        }
        //改价
        operationView.addSubview(UpDataPriceBtn)
        UpDataPriceBtn.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceView.snp.bottom).offset(20*WidthW)
            make.centerX.equalTo(operationView.snp.centerX)
            make.width.height.equalTo(68*WidthW)
        }
        addAndReduceView.addSubview(addAndReduceLine01)
        addAndReduceLine01.snp.makeConstraints { make in
            make.bottom.equalTo(addAndReduceView.snp.top).offset(reduceHeight/3*WidthW)
            make.width.equalTo(reduceWidth*WidthW)
            make.height.equalTo(1*WidthW)
        }
        addAndReduceView.addSubview(addAndReduceLine02)
        addAndReduceLine02.snp.makeConstraints { make in
            make.bottom.equalTo(addAndReduceView.snp.top).offset(reduceHeight*2/3*WidthW)
            make.width.equalTo(reduceWidth*WidthW)
            make.height.equalTo(1*WidthW)
        }
        //加
        addAndReduceView.addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceView.snp.top).offset(4*WidthW)
            make.width.equalTo(reduceWidth*WidthW)
            make.height.equalTo(reduceHeight/3*WidthW)
        }
        addBtn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        
        //显示数量
        addAndReduceView.addSubview(shownumLabel)
        shownumLabel.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceLine01.snp.top)
            make.width.equalTo(reduceWidth*WidthW)
            make.height.equalTo(reduceHeight/3*WidthW)
        }
        //减
        addAndReduceView.addSubview(ReduceBtn)
        ReduceBtn.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceLine02.snp.top)
            make.width.equalTo(reduceWidth*WidthW)
            make.height.equalTo(reduceHeight/3*WidthW)
        }
        ReduceBtn.addTarget(self, action: #selector(ReduceBtnClick), for: .touchUpInside)
        
        self.loadOrderListData(ShopId: 0)
        
        return self
    }
    //收款点击方法
    @objc func payBtnClick(){
        print("=====点击了收款按钮")
        let popview: ZWOrderShouKuanTanKuangJoe = ZWOrderShouKuanTanKuangJoe().initView() as! ZWOrderShouKuanTanKuangJoe
        popview.show()
    }
    
    
    @objc func addBtnClick(){
        let num : String = self.shownumLabel.text ?? ""
        numIndex = Int(num) ?? 1
        numIndex += 1
        self.shownumLabel.text = "\(numIndex)"
        print("=======\(numIndex)")
        self.ReduceBtn.isEnabled = true
        
        self.addAndReduceUptableView(numIndex: numIndex)
        
    }
    
    @objc func ReduceBtnClick(){
        numIndex -= 1
        if numIndex == 1{
            numIndex = 1
            self.ReduceBtn.isEnabled = false
        }else{
            self.ReduceBtn.isEnabled = true
        }
        self.shownumLabel.text = "\(numIndex)"
        
        print("=======\(numIndex)")
        self.addAndReduceUptableView(numIndex: numIndex)
    }
    //MARK: //点击加减 刷新
    func addAndReduceUptableView(numIndex:Int){
        
        let tempArray : NSMutableArray = []
        for obj  in self.OrderListDataAarry {
            if  obj.skuViewId == self.OrderGoodsmodel.skuViewId{
                
                obj.goodsNum = numIndex
                tempArray.add(obj)
            }else{
                tempArray.add(obj)
            }
        }
        self.OrderListDataAarry = tempArray as! [goodsModel]
        self.OrerListReloadData()
    }
    
    
    // 预订 取单等点击操作
    @objc func orderBtnClick(sender : UIButton){
        
        self.delegate?.SelectOrderWayTypeClick(IndexPath: sender.tag)
        
        print("======sender=\(sender.tag)")
        let adType = OrderWayType.init(rawValue: sender.tag)
        switch adType {
        case .挂单:
            
            break
        case .取单:
            
            let alertView : ZWQuDanTanKuangView = ZWQuDanTanKuangView().initView() as! ZWQuDanTanKuangView
            alertView.dataAarry =   ["收银台取单","小程序取单"]
            alertView.show()
            
            break
        case .整单优惠:
            let popOrderHouHuiView  : ZWOrderYouHuiPopViewJoe =  ZWOrderYouHuiPopViewJoe().initView() as! ZWOrderYouHuiPopViewJoe
            popOrderHouHuiView.show()
            break
        case .预订:
            
            break
        default:
            break
        }
        
    }
    // MARK: -刷新 列表
    func OrerListReloadData(){
        //默认选中第一行
        DispatchQueue.main.async {
            
            let indexpath = IndexPath.init(row: self.selectIndex , section: 0)
            if self.OrderListDataAarry.count  > 0{
                self.TableView.selectRow(at: indexpath, animated: false, scrollPosition: UITableView.ScrollPosition.top)
            }
        }
        //计算总价格
        var oldPrice : CGFloat = 0.00
        for model in self.OrderListDataAarry {
            let NewPrice = CGFloat(((model.goodsNum ?? 0 ) * (model.salePrice ?? 0)))
            oldPrice = oldPrice + NewPrice
            Label02.text  = "\(oldPrice)"
        }
        
        self.TableView.reloadData()
    }
    
    //load 订单列表 数据
    func loadOrderListData(ShopId:Int64){
      

        let dict = ["channelId":"11","deliveryType":2,"discountLimit":"","discountType":"-1","districtCode":"","goodsType":"1","majorUserId":"aa","provinceCode":"","requestTag":"","shopId":"156208472","tenantId":"","goodsVoList":[["discountPrice":"45.00","goodsId":"4235838119284737","nature":"","num":"1","orderId":"","price":"45.00","remake":"","totalPrice":"0"],["discountPrice":"23.00","goodsId":"4235838119284736","nature":"","num":"1","orderId":"","price":"23.00","remake":"","totalPrice":"0"]]] as [String : Any]
        
        
        ZHFNetwork.request(target: .PostBabyParameters(pathStr: getOrderConfirm, Babyparameters: dict)) { [self] result in
            
            let dic = result as! NSDictionary
            
            debugPrint("======dic = \(result)")
            
            //            let tempAarry : NSArray = dic["data"] as! NSArray
            //            let tempArray1 = [ZWCheckSementModelJoe].deserialize(from: tempAarry)! as NSArray
            //            self.SementView.dataAarry = tempArray1
            //            self.SementView.ReloadData()
            //            self.CategoriesDataAarry = tempArray1//更多分类数据
            //            //默认选择第一个分类
            //            let model : ZWCheckSementModelJoe = tempArray1[0] as! ZWCheckSementModelJoe
            //
            //            loadGoodsData(categoryId: model.id)//
            
            
            
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    
}

extension ZWOrderViewJoe : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.OrderListDataAarry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWOrderCellJoe =  ZWOrderCellJoe.createWithTableViewCell(tableView: tableView) as! ZWOrderCellJoe
        cell.selectionStyle = .none
        if self.OrderListDataAarry.count > 0{
            let model : goodsModel =   self.OrderListDataAarry[indexPath.row] ;
            cell.closeIcon.addTarget(self, action: #selector(closeIconClick), for: .touchUpInside)
            cell.content01.text = model.name
            cell.content02.text = "￥\(model.salePrice ?? 0 )"
            cell.content03.text = "x\(model.goodsNum ?? 1)"
            cell.content05.text = "￥\((model.goodsNum ?? 0 ) * (model.salePrice ?? 0) )"
            if IsUpData == false {//不是网络
                cell.content04.isHidden = true
            }else{
                cell.content04.isHidden = false
            }
            
        }
        
        return cell
    }
    @objc func closeIconClick(){
        print("======点击了删除")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndex = indexPath.row
        
        let model : goodsModel =   self.OrderListDataAarry[indexPath.row] ;
        self.OrderGoodsmodel = model
        shownumLabel.text = "\(model.goodsNum ?? 1)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150*WidthW
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footview = UIView()
        footview.backgroundColor = UIColor.white
        
        let subView =  UIView()
        subView.frame = CGRect(x: 24*WidthW, y: 18*HeighH, width: 172*WidthW, height: 52*HeighH)
        footview.addSubview(subView)
        subView.cornerRadius(cornerRadius: 8*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 2*WidthW)
        let Btn = UIButton()
        subView.addSubview(Btn)
        Btn.setImage(UIImage.init(named: "整单取消"), for: .normal)
        Btn.setTitle("整单取消", for: .normal)
        Btn.setTitleColor(UIColor.init(hex: "646566"), for: .normal)
        Btn.frame = subView.bounds
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        Btn.addTarget(self, action: #selector(BtnClick), for: .touchUpInside)
        return footview
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 75 * HeighH
        }
        return 0 * HeighH
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerview = UIView()
        return headerview
    }
    
    //整单取消点击
    @objc func BtnClick(){
        print("=====整单取消点击")
        Label02.text = "0:00" //总价格
        self.selectIndex = 0 //列表选了那个
        shownumLabel.text = "0"//加减 数字显示
        
        self.OrderListDataAarry.removeAll()
        self.TableView.reloadData()
        /// 发送一个通知 来清除 订单列表数据
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "RemoveOrderListDataAarry"), object: nil)
    }
    
}
