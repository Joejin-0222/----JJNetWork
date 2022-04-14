//
//  CashierSettingViewController.swift
//  Cashier
//
//  Created by mac on 2022/3/15.
//



import UIKit
import IQKeyboardManagerSwift

//跳转那个页面
public enum SetSelectType:String{
    case 门店管理 = "门店管理"
    case 商品设置 = "商品设置"
    case 小票机管理 = "小票机管理"
}

class CashierSettingViewController: ZWRootViewControllerJoe ,CashierSetItemSelectDelegate{
    
    
    
    private lazy var titles: [String] = {
        return ["1", "2", "3"]
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        var vcs = [UIViewController]()
        vcs.append(ZWStoreManagementVC())
        vcs.append(ZWCommoditySettingsVC())
        vcs.append(ZWSmallTicketMachineVC())
        return vcs
    }()
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.bottomLineHeight = 2.0
        layout.titleFont = UIFont.systemFont(ofSize: 13)
        layout.bottomLineCornerRadius = 1.0
        layout.lrMargin = 20;
        layout.sliderHeight = 0 //设置 item head 高度为0
        layout.isScrollEnabled = false //设置不让滚动  联合 viewcontroller 也不滚动了
        
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 , 自定义样式请参考LTPageView */
        return layout
    }()
    
    private func managerReact() -> CGRect {
        //        let statusBarH = UIApplication.shared.statusBarFrame.size.height
        //        let Y: CGFloat = 0
        //        let H: CGFloat = glt_iphoneX ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        return CGRect(x: 526*WidthW, y: 136*WidthW, width: view.bounds.width - 525*WidthW -  150*WidthW , height: ScreenHeight)
    }
    
    private lazy var simpleManager: LTSimpleManager = {
        let simpleManager = LTSimpleManager(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout/*, itemViewClass: LTCustomTitleItemView.self*/)
        /* 设置代理 监听滚动 */
        simpleManager.delegate = self
        return simpleManager
    }()
    //====
    
    
    var cashierSettingView: CashierSettingView = CashierSettingView()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    func setUI(){
        cashierSettingView.delegate = self
        self.view.addSubview(cashierSettingView.initView())
        cashierSettingView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(28*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.width.equalTo(525*WidthW)
        }
        //右边 scroview主视图
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(simpleManager)
        simpleManagerConfig()
    }
    
    func SelectItemClick(index: Int,Name : String) {
        print("=======点击了\(index)==name = \(Name)")
        var TempIndex: Int = 0
        let TypeName = SetSelectType.init(rawValue:Name)
        switch TypeName {
        case .门店管理:
            TempIndex = 0
            break
        case .商品设置:
            TempIndex = 1
            break
        case .小票机管理:
            TempIndex = 2
            break
        default:
            break
        }
        simpleManager.scrollToIndex(index: TempIndex)
    }
}




extension CashierSettingViewController {
    
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
extension CashierSettingViewController: LTSimpleScrollViewDelegate {
    
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

extension CashierSettingViewController {
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
