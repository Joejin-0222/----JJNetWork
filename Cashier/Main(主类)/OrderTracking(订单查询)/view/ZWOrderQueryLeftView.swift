//
//  ZWOrderQueryLeftView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/13.
//

import UIKit

class ZWOrderQueryLeftView: UIView, FSCalendarDataSource, FSCalendarDelegate {
    //
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#535C7A")
        return view
    }()
    //
    lazy var SubtopView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#5F688A")
        return view
    }()
    //实际营业额
    lazy var YingYeEBtn : UIButton = {
        let Btn = UIButton()
        Btn.backgroundColor = UIColor.init(hex: "#5F688A")
        Btn.setImage(UIImage.init(named: "订单查询时间"), for: .normal)
        Btn.setTitle("实际营业额", for: .normal)
        Btn.setTitleColor(UIColor.white, for: .normal)
        Btn.titleLabel?.font = UIFont.systemFont(ofSize: 18*WidthW)
        return Btn
    }()
    //金额
    lazy var PriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "ffffff")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.text = "¥1584.75"
        return label
    }()
    //订单合计
    lazy var OrderAllLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "ffffff")
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        label.text = "订单合计:18"
        return label
    }()
    //退款合计
    lazy var TuiKuanLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "ffffff")
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        label.text = "退款合计:7"
        return label
    }()
    //预订单底部yellowview
    lazy var yellowview : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FFDC52")
        return view
    }()
    lazy var  YuDingDanImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "订单查询预订单")
        return image
    }()
    //预订单
    lazy var YuDingDanLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        label.text = "预订单"
        label.textAlignment = .center
        return label
    }()
    //选择订单时间段
    lazy var SementTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.text = "选择订单时间段"
        label.textAlignment = .left
        return label
    }()
    //分段选择view
    lazy var SementBottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()
    //二级分类
    let TwoSementView : ZWCheckSementViewJoe = ZWCheckSementViewJoe()
    
    
    
    func initView()->UIView{
        //
        topView.cornerRadius(cornerRadius: 8*WidthW)
        self.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(36*WidthW)
            make.top.equalTo(self.snp.top).offset(39*WidthW)
            make.right.equalTo(self.snp.right).offset(-36*WidthW)
            make.height.equalTo(128*WidthW)
        }
        //
        SubtopView.cornerRadius(cornerRadius: 8*WidthW)
        topView.addSubview(SubtopView)
        SubtopView.snp.makeConstraints { make in
            make.left.equalTo(topView.snp.left).offset(8*WidthW)
            make.top.equalTo(topView.snp.top).offset(8*WidthW)
            make.width.equalTo(162*WidthW)
            make.bottom.equalTo(topView.snp.bottom).offset(-8*WidthW)
        }
        //
        SubtopView.addSubview(YingYeEBtn)
        YingYeEBtn.snp.makeConstraints { make in
            make.left.equalTo(SubtopView.snp.left).offset(12*WidthW)
            make.top.equalTo(SubtopView.snp.top).offset(24*WidthW)
        }
        SubtopView.addSubview(PriceLabel)
        PriceLabel.snp.makeConstraints { make in
            make.left.equalTo(SubtopView.snp.left).offset(24*WidthW)
            make.top.equalTo(YingYeEBtn.snp.bottom).offset(10*WidthW)
            make.right.equalTo(YingYeEBtn.snp.right).offset(0*WidthW)
        }
        //
        topView.addSubview(OrderAllLabel)
        OrderAllLabel.snp.makeConstraints { make in
            make.left.equalTo(SubtopView.snp.right).offset(36*WidthW)
            make.top.equalTo(topView.snp.top).offset(32*WidthW)
        }
        //
        topView.addSubview(TuiKuanLabel)
        TuiKuanLabel.snp.makeConstraints { make in
            make.left.equalTo(SubtopView.snp.right).offset(36*WidthW)
            make.top.equalTo(OrderAllLabel.snp.bottom).offset(12*WidthW)
        }
        //
        topView.addSubview(yellowview)
        yellowview.snp.makeConstraints { make in
            make.width.equalTo(108*WidthW)
            make.bottom.equalTo(topView.snp.bottom).offset(0*WidthW)
            make.top.equalTo(topView.snp.top).offset(0*WidthW)
            make.right.equalTo(topView.snp.right).offset(0*WidthW)
        }
        //
        yellowview.addSubview(YuDingDanImage)
        YuDingDanImage.snp.makeConstraints { make in
            make.top.equalTo(yellowview.snp.top).offset(24*WidthW)
            make.width.height.equalTo(44*WidthW)
            make.centerX.equalTo(yellowview.snp.centerX)
        }
        //
        yellowview.addSubview(YuDingDanLabel)
        YuDingDanLabel.snp.makeConstraints { make in
            make.top.equalTo(YuDingDanImage.snp.bottom).offset(10*WidthW)
            make.left.equalTo(yellowview.snp.left)
            make.right.equalTo(yellowview.snp.right)
        }
        //
        self.addSubview(SementTitleLabel)
        SementTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(56*WidthW)
            make.left.equalTo(topView.snp.left)
            make.right.equalTo(topView.snp.right)
        }
        //SementBottomView
        SementBottomView.cornerRadius(cornerRadius: 34*WidthW, borderColor:  UIColor.init(hex: "#FE7774"), borderWidth: 1)
        self.addSubview(SementBottomView)
        SementBottomView.snp.makeConstraints { make in
            make.top.equalTo(SementTitleLabel.snp.bottom).offset(24*WidthW)
            make.left.equalTo(topView.snp.left)
            make.right.equalTo(topView.snp.right)
            make.height.equalTo(68*WidthW)
        }
        //
        //        TwoSementView.delegate = self//遵守点击分段选择代理
        TwoSementView.cornerRadius = 34*WidthW//圆角大小
        TwoSementView.selectBackgroundColor = UIColor.init(hex: "#FE7774")
        TwoSementView.textFont = 23 //字体大小
        TwoSementView.TextColor = "#FE4B48"
        TwoSementView.SelectTextColor = "#ffffff"
        TwoSementView.IsHiddenIndicator = true //是否显示指示器
        TwoSementView.YesNetWork = false //是网络数据
        TwoSementView.columnNum =  4 //设置为 8列
        self.addSubview(TwoSementView.initView())
        TwoSementView.snp.makeConstraints { make in
            make.left.equalTo(SementBottomView.snp.left).offset(0*WidthW)
            make.top.equalTo(SementBottomView.snp.top)
            make.bottom.equalTo(SementBottomView.snp.bottom)
            make.right.equalTo(SementBottomView.snp.right)
        }
        TwoSementView.dataAarry =  ["今天","近七天","近30天","其他时间"]
        self.TwoSementView.ReloadData()
        /// 翻页-日历
        let calendar = FSCalendar(frame: CGRect(x: 0, y: SementBottomView.bottom  + 300, width: (OrderTabelViewWidth)*WidthW, height: (OrderTabelViewWidth)*WidthW))
        calendar.dataSource = self
        calendar.delegate = self
        self.addSubview(calendar)
        calendar.appearance.caseOptions = .weekdayUsesSingleUpperCase
        let  locale : NSLocale = NSLocale.init(localeIdentifier: "zh_CN")
        calendar.locale = locale as Locale;
        // 设置周(日、一、二、三、四)字体颜色
        calendar.appearance.weekdayTextColor = UIColor.init(hex: "#000000");
        
        // 设置今天文字颜色
        calendar.appearance.titleTodayColor = UIColor.red;
        
        //设置头部字体颜色
        calendar.appearance.headerTitleColor =  UIColor.init(hex: "#000000");
        
        // 设置头部日期格式
        calendar.appearance.headerDateFormat = "yyyy年MM月dd日";
        //这个属性控制"上个月"和"下个月"标签在静止时刻的透明度
        calendar.appearance.headerMinimumDissolvedAlpha = 0;
        

        return self
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("=====\(date) \(monthPosition)")
    }//didDeselectDate
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("=====\(date) \(monthPosition)")
    }
}
