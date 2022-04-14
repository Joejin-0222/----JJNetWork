//
//  ZWSignCollectionViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWSignCollectionViewJoe: UICollectionViewCell {
    var numDataArray : NSArray = ["建设银行支付","农业银行支付","招商银行支付","建设银行支付","农业银行支付","招商银行支付"]
    
    //item 标题
    lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "应收金额:￥108:00"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    // view
    lazy var ContentBtnView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor.clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        //
        self.addSubview(ContentBtnView)
        ContentBtnView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(72*WidthW)
            make.right.equalTo(self.snp.right).offset(-72*WidthW)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-40*WidthW)
            make.height.equalTo(264*WidthW)
        }
        //
        let BtnWidth : CGFloat = 324*WidthW
        let BtnHeight : CGFloat = 120*WidthW
        let space : CGFloat = 18*WidthW
        for index in 0..<6{
            
            let NumBtn = UIButton()
            NumBtn.cornerRadius(cornerRadius: 2, borderColor: LineColor, borderWidth: 1)
            NumBtn.setTitleColor(UIColor.init(hex: "#323233"), for: .normal)
            NumBtn.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
            NumBtn.frame = CGRect(x: CGFloat(index%3)*(BtnWidth + space), y: CGFloat(index/3)*(BtnHeight + space), width:BtnWidth, height: BtnHeight)
            NumBtn.setImage(UIImage.init(named: "订单查询时间"), for: .normal)
            NumBtn.setTitle((self.numDataArray[index] as! String), for: .normal)
            NumBtn.addTarget(self, action: #selector(NumBtnClick(sender:)), for: .touchUpInside)
            
            ContentBtnView.addSubview(NumBtn)
        }
        
        //
        self.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(ContentBtnView.snp.top).offset(-56*HeighH)
            make.height.equalTo(30*HeighH)
        }
        
        TitleLabel.attributedText=attributedtext(text:"应收金额:￥108:00", mainColor:UIColor.init(hex: "#969799"), mainFont:22*WidthW, mainText:"应收金额:", subColor:UIColor.init(hex: "#323233"), subfont:28*WidthW, subText:"￥108:00")
        
    }
    //点击了
    @objc func NumBtnClick(sender:UIButton){
        print("=====\(  sender.titleLabel?.text ?? "")")
 
    }
    
}
