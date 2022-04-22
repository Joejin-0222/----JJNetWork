//
//  SelectStoreView.swift
//  Cashier
//
//  Created by mac on 2022/3/14.
//

import UIKit

class SelectStoreView: UIView {
    
    var userModel = LoginModel()//登录
    var SelectModel = SelectStoreModelZJ()
    var dataAarry  : NSArray = []
    lazy var bgImageView:UIImageView = {
        let headerImageView:UIImageView = UIImageView()
        headerImageView.image = UIImage.init(named: "login_bg_image")
        headerImageView.contentMode = .scaleAspectFill
        return headerImageView
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "login_logo")
        view.contentMode = .scaleAspectFill
        return view;
    }()
    
    lazy var welcomeTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "欢迎使用美零"
        label.font = UIFont(name: "CN Medium", size: CGFloat(36))
        label.textAlignment = .center
        label.textColor = UIColor (red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        return label
    }()
    
    lazy var lineRedView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "login_line_red")
        return view;
    }()
    //账户view
    lazy var accountNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 32
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
        return view
    }()
    
    lazy var userIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "login_user_icon")
        view.contentMode = .scaleAspectFill
        return view;
    }()
    
    lazy var userLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 200/255, green: 201/255, blue: 204/255, alpha: 1)
        return view
    }()
    
    lazy var flowLayout:UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        return layout
    }()
    
    lazy var collectionView:UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        view.isPagingEnabled = true
        view.backgroundColor = .white
        view.register(SelectStoreCollectionViewCell.self, forCellWithReuseIdentifier: "SelectStoreCollectionViewCell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    func initView(viewId:Int64) -> UIView {
        loadData(adminUserId: viewId)
        self.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = UIColor (red: 254/255, green: 75/255, blue: 72/255, alpha: 1)
        self.addSubview(bgImageView)
        self.addSubview(whiteView)
        whiteView.addSubview(logoView)
        whiteView.addSubview(welcomeTitleLabel)
        whiteView.addSubview(lineRedView)
        whiteView.addSubview(collectionView)
        flowLayout.itemSize = CGSize(width: 472*WidthW, height: 88*HeighH)
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left:0, bottom: 0, right:0)
        
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(800*HeighH)
            make.width.equalTo(1160*WidthW)
        }
        
        logoView.snp.makeConstraints { make in
            make.top.equalTo(61*HeighH)
            make.centerX.equalToSuperview()
            make.height.equalTo(124*HeighH)
            make.width.equalTo(266*WidthW)
        }
        
        welcomeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(55*HeighH)
            make.centerX.equalToSuperview()
            make.height.equalTo(36*HeighH)
            make.width.equalTo(260*WidthW)
        }
        
        lineRedView.snp.makeConstraints { make in
            make.top.equalTo(welcomeTitleLabel.snp.bottom).offset(12*HeighH)
            make.centerX.equalToSuperview()
            make.height.equalTo(4*HeighH)
            make.width.equalTo(40*WidthW)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(lineRedView.snp.bottom).offset(34*HeighH)
            make.left.equalTo(80*WidthW)
            make.right.equalTo(-80*WidthW)
            make.bottom.equalTo(whiteView.snp.bottom).offset(-44*HeighH)
        }
        
        return self
    }
}

extension SelectStoreView {
    
    //基本数据请求和模型转换
    func loadData(adminUserId:Int64){
        print(adminUserId)
        let dict = ["adminUserId":adminUserId]
        ZHFNetwork.request(target: .GetYesParameters(pathStr: getUrlSetShop, parameters: dict)) { [self] result in
            let dic = result as! NSDictionary
            let tempAarry : NSArray = dic["data"] as! NSArray
            self.dataAarry = [SelectStoreModelZJ].deserialize(from: tempAarry)! as NSArray
            //                 {
            //                   models.forEach({ (model) in
            //                       self.SelectModel = model!
            //                       self.dataAarry.adding(self.SelectModel)
            //
            //                        })
            //                    }
            self.collectionView.reloadData()
            
        } error1: { statusCode in
            print("====statusCode \(statusCode)")
        } failure: { error in
            
            print("====reeor \(error)")
        }
    }
    
    func getRemoteKeyboardWindow()->UIView?{
        let windows = UIApplication.shared.windows
        for win in windows{
            let name = NSStringFromClass(win.classForCoder)
            if name == "UIRemoteKeyboardWindow"{
                return win
            }
        }
        return nil
    }
}

extension SelectStoreView:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.dataAarry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectStoreCollectionViewCell", for: indexPath) as! SelectStoreCollectionViewCell
        
        let model : SelectStoreModelZJ =  self.dataAarry[indexPath.row] as! SelectStoreModelZJ;
        cell.storeLabel.text =  model.sname
        
        return cell
    }
}
extension SelectStoreView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model : SelectStoreModelZJ =  self.dataAarry[indexPath.row] as! SelectStoreModelZJ;
        
        let mainRootVC = MainRootController()
        mainRootVC.StoreId = model.sid
        Cache.userSto = model
        Cache.user =  self.userModel
        print("===cache=\(Cache.userSto?.sid ?? 0) ==== model = \(model.sid)");
        nextResponder(currentView: self).navigationController?.pushViewController(mainRootVC, animated: true)
    }
}


