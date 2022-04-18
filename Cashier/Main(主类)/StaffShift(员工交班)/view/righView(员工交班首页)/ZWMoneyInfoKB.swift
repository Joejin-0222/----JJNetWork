//
//  ZWMoneyInfoKB.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

class ZWMoneyInfoKB: basePopView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dataArray:NSMutableArray = [["img":"支付宝支付备份 2(1)","type":"现金（元）","money":"￥2000","numnber":"4笔"],["img":"编组 8备份","type":"微信支付（元）","money":"￥2000","numnber":"4笔"],["img":"支付宝支付备份 2(5)","type":"支付宝（元）","money":"￥2000","numnber":"4笔"],["img":"编组 8备份 3","type":"标记支付（元）","money":"￥2000","numnber":"4笔"],["img":"支付宝支付备份 2(2)","type":"刷卡（元）","money":"￥2000","numnber":"4笔"],["img":"支付宝支付备份 2(6)","type":"储值余额（元）","money":"￥2000","numnber":"4笔"],["img":"编组 8备份 3(2)","type":"礼品卡（元）","money":"￥2000","numnber":"4笔"],["img":"支付宝支付备份 2(3)","type":"有赞E卡（元）","money":"￥2000","numnber":"4笔"],["img":"支付宝支付备份 2(4)","type":"组合支付（元）","money":"￥2000","numnber":"4笔"],["img":"支付宝支付备份 2","type":"会员卡（元）","money":"￥2000","numnber":"4笔"]]
    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        lt.minimumInteritemSpacing = 0
        lt.minimumLineSpacing = 0
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout: lt)
        cw.backgroundColor = UIColor.init(hex: "#F5F5F5")
        cw.delegate = self
        cw.dataSource = self
        cw.alwaysBounceVertical = true
        cw.contentInset = UIEdgeInsets(top: 0, left: 20*WidthW, bottom: 0, right: 20*WidthW)
        cw.register(cellType: ZWMoneyInfoCCellKB.self)

        return cw
    }()
    
    override func configUI() {
        self.backView.addSubview(self.collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    

}
extension ZWMoneyInfoKB: UCollectionViewSectionBackgroundLayoutDelegateLayout, UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return vipList.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        return UIColor.clear
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ZWMoneyInfoCCellKB.self)
        let dataDict:NSDictionary = dataArray[indexPath.row] as! NSDictionary;
        cell.imgView.image = UIImage(named: dataDict["img"] as! String)
        cell.typeL.text = dataDict["type"] as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(1000.0*WidthW - 60.0*WidthW) / 3.0)
        return CGSize(width: width, height: 200*WidthW)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

