//
//  ZWMemberManagemenViewRightView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/11.
//

import UIKit

class ZWMemberManagemenRightView: UIView {
    
    var numDataArray : NSArray = ["1","2","3","4","5","6","7","8","9",".","0",""]
    
    var showStr : String = ""
    //返回
    lazy var backBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.white, for: .normal)
        //        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setImage(UIImage.init(named: "返回"), for: .normal)
        btn.addTarget(self, action: #selector(backBtnClick(sender:)), for: .touchUpInside)
        return btn
    }()
    
    //搜索view
    lazy var SearchView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.init(hex: "#ffffff")
        return view
    }()
    //搜索输入框
    lazy var Textfield : UILabel = {
        let textfield = UILabel()
//        textfield.isEditing = false
        textfield.text = "输入会员码搜索"
        textfield.font = UIFont.systemFont(ofSize: 28*WidthW)
        textfield.textColor = UIColor.init(hex: "#C8C9CC")
        return textfield
    }()
    
    lazy var searchImage : UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage.init(named: "扫一扫")
        ImageView.backgroundColor = StandingPColor
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
        btn.setTitle("x", for: .normal)
        btn.setTitleColor(UIColor.init(hex: "#646566"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40*WidthW)
        return btn
    }()
    
    //搜索按钮
    lazy var searchBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = MainColor
        btn.setImage(UIImage.init(named: "会员搜索"), for: .normal)
        btn.setTitleColor(UIColor.init(hex: "#646566"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40*WidthW)
        btn.imageView?.contentMode = .scaleAspectFill
             
        return btn
    }()
    
   
    func initView()->UIView{
        
        self.backgroundColor = UIColor.init(hex: "#FAFAFA")
        
        //返回按钮
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(63*WidthW)
            make.top.equalTo(70*WidthW)
            make.width.height.equalTo(92*WidthW)
        }
        
        //
        self.addSubview(SearchView)
        SearchView.cornerRadius(cornerRadius: 48*WidthW, borderColor: UIColor.init(hex: "#DCDEE0"), borderWidth: 1)
        SearchView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(264*WidthW)
            make.height.equalTo(96*WidthW)
            make.width.equalTo(654*WidthW)
            make.centerX.equalTo(self.snp.centerX)
        }
        //
        SearchView.addSubview(searchImage)
        searchImage.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left).offset(64*WidthW)
            make.centerY.equalTo(SearchView.snp.centerY).offset(0*WidthW)
            make.width.height.equalTo(56*WidthW)
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
        NumOneZhiNineView.backgroundColor = UIColor.white
        self.addSubview(NumOneZhiNineView)
        NumOneZhiNineView.snp.makeConstraints { make in
            make.left.equalTo(SearchView.snp.left)
            make.right.equalTo(SearchView.snp.right)
            make.top.equalTo(SearchView.snp.bottom).offset(108*WidthW)
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
        //搜索按钮
        searchBtn.addTarget(self, action: #selector(searchBtnClick), for: .touchUpInside)
        NumOneZhiNineView.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(self.DeleteBtn.snp.bottom)
            make.right.equalTo(self.NumOneZhiNineView.snp.right)
            make.width.equalTo(BtnWidth)
            make.height.equalTo(BtnHeight*3)
        }
        
        return self
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
        Textfield.text = "输入会员码搜索"
    }
    //搜索点击方法
    @objc func searchBtnClick(){
        print("=====去搜索 \(showStr)")
        
    }
    
}
