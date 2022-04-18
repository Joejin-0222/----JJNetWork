//
//  ZWCashCollectionViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWCashCollectionViewJoe: UICollectionViewCell {
    var numDataArray : NSArray = ["1","2","3","4","5","6","7","8","9",".","0",""]
    
    var showStr : String = ""
    //item 标题
    lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "应收金额:￥108:00"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    
    //搜索view
    lazy var SearchView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.clear
        return view
    }()
    //搜索输入框
    lazy var Textfield : UILabel = {
        let textfield = UILabel()
        textfield.text = "请输入金额"
        textfield.font = UIFont.systemFont(ofSize: 28*WidthW)
        textfield.textColor = UIColor.init(hex: "#C8C9CC")
        return textfield
    }()
    
    lazy var searchImage : UIButton = {
        let ImageView = UIButton()
        ImageView.setImage(UIImage.init(named: ""), for: .normal)
        ImageView.setTitle("实收金额:", for: .normal)
        ImageView.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
        ImageView.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
        return ImageView
        
    }()
    
    //0-9 view
    lazy var NumOneZhiNineView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    
    //删除按钮
    lazy var DeleteBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage.init(named: "收款清除"), for: .normal)
        btn.setTitleColor(UIColor.init(hex: "#646566"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 0*WidthW)
        return btn
    }()
    
    //搜索按钮
    lazy var searchBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = MainColor
        btn.setTitle("确定", for: .normal)
        btn.setImage(UIImage.init(named: ""), for: .normal)
        btn.setTitleColor(UIColor.init(hex: "#ffffff"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30*WidthW)
        btn.imageView?.contentMode = .scaleAspectFill
             
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        self.backgroundColor = UIColor.clear
      
        //
        self.addSubview(SearchView)
        SearchView.cornerRadius(cornerRadius: 44*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        SearchView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(264*WidthW)
            make.height.equalTo(88*WidthW)
            make.width.equalTo(654*WidthW)
            make.centerX.equalTo(self.snp.centerX)
        }
        //
        self.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left)
            make.right.equalTo(SearchView.snp.right)
            make.top.equalTo(SearchView.snp.top).offset(-56*HeighH)
            make.height.equalTo(30*HeighH)
        }
        TitleLabel.attributedText = attributedtext(text:"应收金额:￥108:00", mainColor:UIColor.init(hex: "#969799"), mainFont:22*WidthW, mainText:"应收金额:", subColor:UIColor.init(hex: "#323233"), subfont:28*WidthW, subText:"￥108:00")
        
        
        //
        SearchView.addSubview(searchImage)
        searchImage.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left).offset(64*WidthW)
            make.centerY.equalTo(SearchView.snp.centerY).offset(0*WidthW)
//            make.width.height.equalTo(56*WidthW)
        }
        //
        SearchView.addSubview(Textfield)
        Textfield.snp.makeConstraints { make in
            make.left.equalTo(searchImage.snp.right).offset(25*WidthW)
            make.right.equalTo(SearchView.snp.right).offset(-25*WidthW)
            make.top.equalTo(SearchView.snp.top)
            make.bottom.equalTo(SearchView.snp.bottom)
        }
        //
        NumOneZhiNineView.cornerRadius(cornerRadius: 2, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 1)
        NumOneZhiNineView.backgroundColor = UIColor.clear
        self.addSubview(NumOneZhiNineView)
        NumOneZhiNineView.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left)
            make.right.equalTo(SearchView.snp.right)
            make.top.equalTo(SearchView.snp.bottom).offset(65*WidthW)
            make.height.equalTo(352*WidthW)
        }
        //
        let BtnWidth : CGFloat = 164*WidthW
        let BtnHeight : CGFloat = 88*WidthW
        for index in 0..<self.numDataArray.count{
            
            let NumBtn = UIButton()
            NumBtn.cornerRadius(cornerRadius: 2, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 0.5)
            NumBtn.setTitleColor(UIColor.init(hex: "#646566"), for: .normal)
            NumBtn.titleLabel?.font = UIFont.systemFont(ofSize: 40*WidthW)
            NumBtn.frame = CGRect(x: CGFloat(index%3)*BtnWidth , y: CGFloat(index/3)*BtnHeight, width:BtnWidth, height: BtnHeight)
            
            NumBtn.setTitle((self.numDataArray[index] as! String), for: .normal)
            NumBtn.addTarget(self, action: #selector(NumBtnClick(sender:)), for: .touchUpInside)
            
            NumOneZhiNineView.addSubview(NumBtn)
        }
        //消除按钮
        DeleteBtn.cornerRadius(cornerRadius: 2, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 0.5)
        NumOneZhiNineView.addSubview(DeleteBtn)
        DeleteBtn.addTarget(self, action: #selector(DeleteBtnClick), for: .touchUpInside)
        DeleteBtn.snp.makeConstraints { make in
            make.top.equalTo(self.NumOneZhiNineView.snp.top)
            make.right.equalTo(self.NumOneZhiNineView.snp.right)
            make.width.equalTo(BtnWidth)
            make.height.equalTo(BtnHeight)
        }
//        DeleteBtn.
        
        //搜索按钮
        searchBtn.addTarget(self, action: #selector(searchBtnClick), for: .touchUpInside)
        NumOneZhiNineView.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(self.DeleteBtn.snp.bottom)
            make.right.equalTo(self.NumOneZhiNineView.snp.right)
            make.width.equalTo(BtnWidth)
            make.height.equalTo(BtnHeight*3)
        }
        
    }
    
    
    @objc  func backBtnClick(sender:UIButton){
  
    }
    //点击了数字
    @objc func NumBtnClick(sender:UIButton){
        print("=====\(  sender.titleLabel?.text ?? "")")
 
        showStr.append(sender.titleLabel?.text ?? "")
        self.Textfield.text = showStr
    }
    //删除方法
    @objc func DeleteBtnClick(){
        showStr = ""
        self.Textfield.text = ""
        Textfield.text = "请输入金额"
    }
    //搜索点击方法
    @objc func searchBtnClick(){
        print("=====去搜索 \(showStr)")
        
    }
}
