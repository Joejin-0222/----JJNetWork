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
    case 预定
}

class ZWOrderViewJoe: UIView {
    // 03. 声明代理属性 (注:使用weak修饰, 该协议需要继承NSObjectProtocol基协议, 且注意代理名称是否重复)
    weak  var delegate  : OrderWayTypeSelectDelegate?
    
    var dataAarry  : NSArray = []
    private var selectIndex:Int=1   //    记录点击了第几行
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
        let tableview = UITableView(frame:.zero)
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
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 24*WidthW)
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
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        label.textColor = UIColor.init(hex: "#ffffff")
        return label
    }()
    //12.99
    lazy var Label02 : UILabel = {
        let label = UILabel()
        label.text = "12.99"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        label.textColor = UIColor.init(hex: "#ffffff")
        return label
    }()
    //共计 ===
    lazy var Label03 : UILabel = {
        let label = UILabel()
        label.text = "共计107件，已优惠:￥10.00"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13*WidthW)
        label.textColor = UIColor.init(hex: "#ffffff")
        return label
    }()
    
    //确定收款
    lazy var payBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#FFD726")
        Btn.setTitle("收款", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
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
    
    //预定
    lazy var YuDingBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#ffffff")
        Btn.setTitle("预定", for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 22*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        let type : Int = OrderWayType.预定.rawValue
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
        Btn.setTitle("+", for: .normal)
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
        Btn.setTitle("-", for: .normal)
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
            make.height.equalTo(80*WidthW)
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
            make.top.equalTo(5*WidthW)
            make.left.equalTo(AllOrderView.snp.left).offset(25*WidthW)
            make.width.equalTo(18*WidthW)
            make.height.equalTo(40*WidthW)
        }
        AllOrderView.addSubview(Label02)
        Label02.snp.makeConstraints { make in
            make.top.equalTo(5*WidthW)
            make.left.equalTo(Label01.snp.right)
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
            make.left.equalTo(operationView.snp.left).offset(3*WidthW)
            make.width.equalTo(3*WidthW)
            make.bottom.equalTo(operationView.snp.bottom)
        }
        //右边线
        operationView.addSubview(operationline02)
        operationline02.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.right.equalTo(operationView.snp.right).offset(-3*WidthW)
            make.width.equalTo(3*WidthW)
            make.height.equalTo(operationView.snp.height)
        }
        
        
        //预定
        YuDingBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(YuDingBtn)
        YuDingBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-96*WidthW)
            make.left.equalTo(8*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        //整单优惠
        AllOrderYouHuiBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(AllOrderYouHuiBtn)
        AllOrderYouHuiBtn.snp.makeConstraints { make in
            make.bottom.equalTo(YuDingBtn.snp.top).offset(-20*WidthW)
            make.left.equalTo(8*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        //取单
        QuDanBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(QuDanBtn)
        QuDanBtn.snp.makeConstraints { make in
            make.bottom.equalTo(AllOrderYouHuiBtn.snp.top).offset(-20*WidthW)
            make.left.equalTo(8*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        //挂单
        GuaDanBtn.cornerRadius(cornerRadius: 27*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(GuaDanBtn)
        GuaDanBtn.snp.makeConstraints { make in
            make.bottom.equalTo(QuDanBtn.snp.top).offset(-20*WidthW)
            make.left.equalTo(8*WidthW)
            make.width.equalTo(132*WidthW)
            make.height.equalTo(54*WidthW)
        }
        
        //加减底层view
        addAndReduceView.cornerRadius(cornerRadius: 54*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        operationView.addSubview(addAndReduceView)
        addAndReduceView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(102*WidthW)
            make.centerX.equalTo(operationView.snp.centerX)
            make.width.equalTo(108*WidthW)
            make.height.equalTo(220*WidthW)
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
            make.bottom.equalTo(addAndReduceView.snp.top).offset(220/3*WidthW)
            make.width.equalTo(108*WidthW)
            make.height.equalTo(1*WidthW)
        }
        addAndReduceView.addSubview(addAndReduceLine02)
        addAndReduceLine02.snp.makeConstraints { make in
            make.bottom.equalTo(addAndReduceView.snp.top).offset(220*2/3*WidthW)
            make.width.equalTo(108*WidthW)
            make.height.equalTo(1*WidthW)
        }
        //加
        addAndReduceView.addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceView.snp.top)
            make.width.equalTo(108*WidthW)
            make.height.equalTo(220/3*WidthW)
        }
        addBtn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        
        //显示数量
        addAndReduceView.addSubview(shownumLabel)
        shownumLabel.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceLine01.snp.top)
            make.width.equalTo(108*WidthW)
            make.height.equalTo(220/3*WidthW)
        }
        //减
        addAndReduceView.addSubview(ReduceBtn)
        ReduceBtn.snp.makeConstraints { make in
            make.top.equalTo(addAndReduceLine02.snp.top)
            make.width.equalTo(108*WidthW)
            make.height.equalTo(220/3*WidthW)
        }
        ReduceBtn.addTarget(self, action: #selector(ReduceBtnClick), for: .touchUpInside)
        
        //默认选中第一行
        DispatchQueue.main.async {
            let indexpath = IndexPath.init(row: self.selectIndex , section: 0)
            self.TableView.selectRow(at: indexpath, animated: false, scrollPosition: UITableView.ScrollPosition.top
            )
        }
        return self
    }
    //收款点击方法
    @objc func payBtnClick(){
        print("=====点击了收款按钮")
        //
        let alertView = ZWOrderShouKuanTanKuang(x:0, y: 0, width:( ScreenWidth), height: ScreenHeight)
//        alertView.dataAarry =   ["收银台取单","小程序取单"]
        
        alertView.show()
    }
    
    
    @objc func addBtnClick(){
        numIndex += 1
        self.shownumLabel.text = "\(numIndex)"
        print("=======\(numIndex)")
        self.ReduceBtn.isEnabled = true
    }
    
    @objc func ReduceBtnClick(){
        numIndex -= 1
        if numIndex == 0{
            numIndex = 0
            self.ReduceBtn.isEnabled = false
        }else{
            self.ReduceBtn.isEnabled = true
        }
        self.shownumLabel.text = "\(numIndex)"
        
        print("=======\(numIndex)")
    }
    // 预定 取单等点击操作
    @objc func orderBtnClick(sender : UIButton){
        print("======sender=\(sender.tag)")
        self.delegate?.SelectOrderWayTypeClick(IndexPath: sender.tag)
        //
        let alertView = ZWQuDanTanKuangView(title: "", message: "", cancelButtonTitle: "", sureButtonTitle: "",x:0, y: 0, width:( ScreenWidth), height: ScreenHeight)
        alertView.dataAarry =   ["收银台取单","小程序取单"]
        
        alertView.show()
        
        //获取点击事件
        alertView.clickIndexClosure { (index) in
            print("点击了第" + "\(index)" + "个按钮")
        }
    }
    
}
extension ZWOrderViewJoe: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.selectIndex=indexPath.row
//        self.TableView.reloadData()
    }
}
extension ZWOrderViewJoe : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:ZWOrderCellJoe =  ZWOrderCellJoe.createWithTableViewCell(tableView: tableView) as! ZWOrderCellJoe
        cell.selectionStyle = .none
      
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150*WidthW
    }
    
}
