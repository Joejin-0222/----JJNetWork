//
//  ZWChooseGoodsClassTanKuangView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/2.
//

import UIKit

class ZWLeftTableClickTanKuangView: UIView ,SementSelectClickDelegate{
    
    private var selectIndex:Int = 0   //    记录点击了第几行
    var dataAarry  : NSArray? = []
    fileprivate let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    //顶部 分段选择器
    
    let SementView : ZWCheckSementViewJoe = ZWCheckSementViewJoe()
    
    
    //分段选择 圆边 view
    lazy var SenmentBottomView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    
  
    //tableview
    lazy var TableView:UITableView = {
        let tableview = UITableView(frame:.zero)
        tableview.backgroundColor = UIColor.init(hex: "#FAFAFA")
        tableview.estimatedRowHeight =  130
        tableview.rowHeight = UITableView.automaticDimension
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    var dataAarryTableView : NSArray = []
    //rightline
    lazy var rightline : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "E6E9EB")
        
        return view
    }()
    //搜索view
    lazy var SearchView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    //搜索输入框
    lazy var Textfield : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "请输入订单标号、门店名称"
        textfield.font = UIFont.systemFont(ofSize: 20*WidthW)
        return textfield
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
 
    
    let cancelBtn = UIButton() //取消按钮
    let DeleteBtn = UIButton() //删除按钮
    let sureBtn = UIButton() //确定按钮
    let JieSuanBtn = UIButton() //结算按钮
    let Bgtap = UITapGestureRecognizer() //点击手势
    
    
    
    init(title: String?, message: String?, cancelButtonTitle: String?, sureButtonTitle: String?,x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat ) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
      
        createAlertView()
      
    }
    
    //MARK:创建
    func createAlertView() {
        ProgressHUD.hideHud()
        //布局
        self.frame = CGRect(x: x, y: y, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
    
        //spring动画白底(弹出主体)
        bgView.frame = CGRect(x: (LeftItemWidth)*WidthW, y: 0, width: ScreenWidth - (LeftItemWidth)*WidthW, height: height)//设置大小及其位置
        bgView.backgroundColor = UIColor.init(hex: "#FAFAFA")//背景色
        self.addSubview(bgView)
        bgView.isUserInteractionEnabled = true
        
        //
        //右边分割线
        bgView.addSubview(rightline)
        rightline.snp.makeConstraints { make in
            make.bottom.equalTo(self.bgView.snp.bottom)
            make.top.equalTo(self.bgView.snp.top)
            make.left.equalTo((  OrderTabelViewWidth) *  WidthW)
            make.width.equalTo(1.5*WidthW)
        }
    
        
        //取消按钮 返回按钮
        //        let btnWith = (width - 30) / 2
        cancelBtn.frame = CGRect(x: 63*WidthW, y: 70*WidthW, width: 92*WidthW, height: 92*WidthW)
        //        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        cancelBtn.addTarget(self, action: #selector(clickBtnAction(sender:)), for: .touchUpInside)
        bgView.addSubview(cancelBtn)
       
        
        //二级分类 view
        SenmentBottomView.cornerRadius(cornerRadius: 36*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        bgView.addSubview(SenmentBottomView)
        SenmentBottomView.snp.makeConstraints { make in
            make.left.equalTo(rightline.snp.right).offset(24*WidthW)
            make.top.equalTo(cancelBtn.snp.bottom).offset(25*WidthW)
            make.height.equalTo(72*WidthW)
            make.width.equalTo(532*WidthW)
        }
        //
        SementView.delegate = self//遵守点击分段选择代理
        SementView.YesNetWork = false //是网络数据
        SementView.columnNum =  3 //设置为 3列
        SenmentBottomView.addSubview(SementView.initView())
        SementView.snp.makeConstraints { make in
            make.left.equalTo(SenmentBottomView.snp.left).offset(0*WidthW)
            make.top.equalTo(SenmentBottomView.snp.top)
            make.bottom.equalTo(SenmentBottomView.snp.bottom)
            make.right.equalTo(SenmentBottomView.snp.right)
        }
        SementView.dataAarry =  ["待出库","待审核","已保存"]
        self.SementView.ReloadData()


        //
        bgView.addSubview(self.TableView)
        TableView.backgroundColor =  UIColor.clear
        TableView.isScrollEnabled = true
        TableView.separatorStyle = .none
        TableView.snp.makeConstraints { make in
            make.top.equalTo(SenmentBottomView.snp.bottom).offset(20*WidthW)
            make.left.equalTo(rightline.snp.left).offset(72*WidthW)
            make.right.equalTo(bgView.snp.right).offset(-72*WidthW)
            make.bottom.equalTo(bgView.snp.bottom).offset(-10*WidthW)
        }
        
        TableView.register(cellType: ZWCallOutTCell.self)
        TableView.register(UINib.init(nibName: "ZWTanKuangCell", bundle: nil), forCellReuseIdentifier: "ZWTanKuangCell")
        
        
        //
        bgView.addSubview(SearchView)
        SearchView.cornerRadius(cornerRadius: 30*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        SearchView.snp.makeConstraints { make in
            make.left.equalTo(SenmentBottomView.snp.right).offset(73*WidthW)
            make.centerY.equalTo(SenmentBottomView.snp.centerY).offset(0*WidthW)
            make.height.equalTo(60*WidthW)
            make.width.equalTo(488*WidthW)
        }
        //
        SearchView.addSubview(Textfield)
        Textfield.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left).offset(25*WidthW)
            make.right.equalTo(SearchView.snp.right).offset(-25*WidthW)
            make.top.equalTo(SearchView.snp.top)
            make.bottom.equalTo(SearchView.snp.bottom)
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

extension ZWLeftTableClickTanKuangView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("====\(indexPath.row)")
    }
}

extension ZWLeftTableClickTanKuangView :UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1//self.dataAarryTableView.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let arr : NSArray = self.dataAarryTableView[section] as! NSArray
        
        return 4//arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let  cell:ZWTanKuangTableViewCell =  ZWTanKuangTableViewCell.createWithTableViewCell(tableView: tableView) as! ZWTanKuangTableViewCell
       
//        let cell:ZWTanKuangCell = tableView.dequeueReusableCell(withIdentifier: "ZWTanKuangCell", for: indexPath) as! ZWTanKuangCell
//        cell.selectionStyle = .none
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
//        return cell
        let cell:ZWCallOutTCell = tableView.dequeueReusableCell(for: indexPath, cellType: ZWCallOutTCell.self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 284*WidthW
    }
    
    

}

