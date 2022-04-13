//
//  LeftSelectViewController.swift
//  Cashier
//
//  Created by mac on 2022/3/15.
//

import UIKit

class MainRootController: UIViewController {
    
    var StoreId:Int64 = 0
    
    var LeftView : ZWLeftItemViewJoe = ZWLeftItemViewJoe()//左边 view
 
    private lazy var titles: [String] = {
        return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        var vcs = [UIViewController]()
        vcs.append(ZWCashierViewControllerJoe())
        vcs.append(ZWOrderQueryViewControllerJoe())
        vcs.append(ZWMemberManagemenVCJoe())
        vcs.append(ZWStaffShiftVCJoe())
        vcs.append(ZWCommodityStocksVCJoe())
        vcs.append(ZWDataReconciliationVCJoe())
        vcs.append(ZWSwitchStoreVCJoe())
        vcs.append(UIViewController())//空
        vcs.append(CashierSettingViewController())
        vcs.append(ZWEnterBackgroundVCJoe())
        return vcs
    }()
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.bottomLineHeight = 2.0
        layout.titleFont = UIFont.systemFont(ofSize: 13*WidthW)
        layout.bottomLineCornerRadius = 1.0
        layout.lrMargin = 20;
        layout.sliderHeight = 0 //设置 item head 高度为0
        layout.isScrollEnabled = false //设置不让滚动  联合 viewcontroller 也不滚动了
        
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 , 自定义样式请参考LTPageView */
        return layout
    }()
    
    private func managerReact() -> CGRect {
        //        let statusBarH = UIApplication.shared.statusBarFrame.size.height
        let Y: CGFloat = 0
        //        let H: CGFloat = glt_iphoneX ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        return CGRect(x: LeftItemWidth*WidthW, y: Y, width: view.bounds.width - LeftItemWidth*WidthW, height: ScreenHeight)
    }
    
    private lazy var simpleManager: LTSimpleManager = {
        let simpleManager = LTSimpleManager(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout/*, itemViewClass: LTCustomTitleItemView.self*/)
        /* 设置代理 监听滚动 */
        simpleManager.delegate = self
        return simpleManager
    }()
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SetUI()
        
    }
    
    func SetUI(){
        //左边 item 视图
        // 05.2 在第一次实例化 LeftView 的时候, 设置代理
        LeftView.delegate = self
        
        self.view.addSubview(LeftView.initView())
        LeftView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(ScreenHeight)
            make.width.equalTo(LeftItemWidth*WidthW)
        }
      
        
        
        print("=======LeftItemWidth*WidthW = \(128*WidthW)")
        //
        //右边 scroview主视图
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(simpleManager)
        simpleManagerConfig()
//        simpleManager.scrollToIndex(index:3)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("LTSimpleManagerDemo < --> deinit")
    }
}


extension MainRootController {
    
    //MARK: 具体使用请参考以下
    private func simpleManagerConfig() {
        
        //MARK: headerView设置
        //        simpleManager.configHeaderView {[weak self] in
        //            guard let strongSelf = self else { return nil }
        ////            let headerView = strongSelf.testLabel()
        //            return headerView
        //        }
        
        //MARK: pageView点击事件
        simpleManager.didSelectIndexHandle { (index) in
            print("点击了 \(index) 😆")
        }
        
        
    }
    
    @objc private func tapLabel(_ gesture: UITapGestureRecognizer)  {
        print("tapLabel☄")
    }
}

extension MainRootController: LTSimpleScrollViewDelegate {
    
    //MARK: 滚动代理方法
    func glt_scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print("offset -> ", scrollView.contentOffset.y)
    }
    
    //MARK: 控制器刷新事件代理方法
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int) {
        //注意这里循环引用问题。
        //        scrollView.mj_header = MJRefreshNormalHeader {[weak scrollView] in
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
        //                print("对应控制器的刷新自己玩吧，这里就不做处理了🙂-----\(index)")
        //                scrollView?.mj_header.endRefreshing()
        //            })
        //        }
    }
}

extension MainRootController {
    private func testLabel() -> UILabel {
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
        headerView.backgroundColor = UIColor.red
        headerView.text = "点击响应事件"
        headerView.textColor = UIColor.white
        headerView.textAlignment = .center
        headerView.isUserInteractionEnabled = true
        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:))))
        return headerView
    }
}

// 05.1 遵守代理协议
/** extension
 -- extension 类似于 OC 中的 Category
 -- 格式: extension 类名 {}
 -- Swift中 代码可读性差, 通过 extension 完成代码分块, 增强可读性, 单一模块单独处理, 增大了当前类的作用域
 -- extension 中 可以添加计算型属性 不能添加存储型属性; 可以定义便利构造函数 不能定义指定构造函数
 */
extension MainRootController: LeftItemDelegate{
    
    
    // 06. 实现代理方法
    func ItemSelectIndexPathClick(IndexPath: Int, ItemName: String) {
     
        print("中监听到了按钮点击=====\(IndexPath)==name=\(ItemName) == \(self.viewControllers[IndexPath])")
        simpleManager.scrollToIndex(index: IndexPath)
    }
    
}
