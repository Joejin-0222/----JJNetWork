//
//  LoginView.swift
//  Cashier
//
//  Created by mac on 2022/3/9.
//

import UIKit
import SnapKit

var isOpen = false

class LoginView: UIView {
    var loginItems:LoginModel = LoginModel()
    
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
    
    lazy var userTextfield : UITextField = {
        let textfield = UITextField.init()
        textfield.placeholder = "请输入登录账号"
//        textfield.text = "fgwq"//fgzj
        textfield.text = "fgxb"//预发布账号
        textfield.font = UIFont(name: "CN Regular", size: CGFloat(30))
        textfield.delegate = self
        textfield.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
        return textfield
    }()
    //密码view rgba(235, 237, 240, 1)
    lazy var passwordView: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor.clear
          view.layer.masksToBounds = true
          view.layer.cornerRadius = 32
          view.layer.borderWidth = 2
          //view.layer.borderColor = UIColor (red: 254/255, green: 159/255, blue: 157/255, alpha: 1).cgColor
          view.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
          return view
    }()
    
    lazy var passwordIcon: UIImageView = {
          let view = UIImageView()
          view.image = UIImage.init(named: "login_password_icon")
          view.contentMode = .scaleAspectFill
        return view;
    }()
    
    lazy var passwordLineView: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor(red: 200/255, green: 201/255, blue: 204/255, alpha: 1)
          return view
    }()
    
    lazy var passwordTextfield : UITextField = {
        let textfield = UITextField.init()
        textfield.placeholder = "请输入登录密码"
        textfield.text = "admin123"
        textfield.font = UIFont(name: "CN Regular", size: CGFloat(30))
        textfield.delegate = self
        textfield.isSecureTextEntry = true
        textfield.addTarget(self, action: #selector(textsDidChanged), for: .editingChanged)
        return textfield
    }()
    
    //登录按钮
    @objc lazy var isHiddenButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setBackgroundImage(UIImage(named: "login_lose_eyes"), for: .normal)
        button.addTarget(self, action: #selector(isHidenButton), for: .touchUpInside)
        return button
   }()
    
    //登录按钮
    @objc lazy var loginButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor(red: 254/255, green: 195/255, blue: 194/255, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 44*HeighH
        button.isUserInteractionEnabled = false
        button.setTitle("登录", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
   }()
    
    func initView() -> UIView {
        self.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = UIColor (red: 254/255, green: 75/255, blue: 72/255, alpha: 1)
        self.addSubview(bgImageView)
        self.addSubview(whiteView)
        whiteView.addSubview(logoView)
        whiteView.addSubview(welcomeTitleLabel)
        whiteView.addSubview(lineRedView)
        whiteView.addSubview(accountNumberView)
        accountNumberView.isUserInteractionEnabled = true
        let accountGuesture = UITapGestureRecognizer(target: self, action: #selector(self.accountTap))
        accountGuesture.numberOfTapsRequired = 1
        accountNumberView.addGestureRecognizer(accountGuesture)
        accountNumberView.addSubview(userIcon)
        accountNumberView.addSubview(userLineView)
        accountNumberView.addSubview(userTextfield)
        whiteView.addSubview(passwordView)
        
        let passwordGuesture = UITapGestureRecognizer(target: self, action: #selector(self.passwordTap))
        passwordGuesture.numberOfTapsRequired = 1
        passwordView.addGestureRecognizer(passwordGuesture)
        
        passwordView.addSubview(passwordIcon)
        passwordView.addSubview(passwordLineView)
        passwordView.addSubview(passwordTextfield)
        passwordView.addSubview(isHiddenButton)
        whiteView.addSubview(loginButton)
        
        bgImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        whiteView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(800*HeighH)
            make.width.equalTo(800*WidthW)
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
        
        accountNumberView.snp.makeConstraints { make in
            make.top.equalTo(lineRedView.snp.bottom).offset(48*HeighH)
            make.centerX.equalToSuperview()
            make.height.equalTo(96*HeighH)
            make.width.equalTo(672*WidthW)
        }
        
        userIcon.snp.makeConstraints { make in
            make.top.equalTo(30*HeighH)
            make.left.equalTo(64*WidthW)
            make.height.equalTo(36*HeighH)
            make.width.equalTo(36*WidthW)
        }
        
        userLineView.snp.makeConstraints { make in
            make.centerY.equalTo(userIcon.snp.centerY)
            make.left.equalTo(userIcon.snp.right).offset(32*WidthW)
            make.height.equalTo(28*HeighH)
            make.width.equalTo(1*WidthW)
        }
        
        userTextfield.snp.makeConstraints { make in
            make.centerY.equalTo(userIcon.snp.centerY)
            make.left.equalTo(userLineView.snp.right).offset(27*WidthW)
            make.height.equalTo(30*HeighH)
            make.width.equalTo(260*WidthW)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(accountNumberView.snp.bottom).offset(32*HeighH)
            make.centerX.equalToSuperview()
            make.height.equalTo(96*HeighH)
            make.width.equalTo(672*WidthW)
        }
        
        passwordIcon.snp.makeConstraints { make in
            make.top.equalTo(30*HeighH)
            make.left.equalTo(64*WidthW)
            make.height.equalTo(36*HeighH)
            make.width.equalTo(36*WidthW)
        }
        
        passwordLineView.snp.makeConstraints { make in
            make.centerY.equalTo(passwordIcon.snp.centerY)
            make.left.equalTo(passwordIcon.snp.right).offset(32*WidthW)
            make.height.equalTo(28*HeighH)
            make.width.equalTo(1*WidthW)
        }
        
        passwordTextfield.snp.makeConstraints { make in
            make.centerY.equalTo(passwordLineView.snp.centerY)
            make.left.equalTo(passwordLineView.snp.right).offset(27*WidthW)
            make.height.equalTo(30*HeighH)
            make.width.equalTo(260*WidthW)
        }
        
        isHiddenButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextfield.snp.centerY)
            make.right.equalTo(passwordView.snp.right).offset(-64*WidthW)
            make.height.equalTo(36*HeighH)
            make.width.equalTo(36*WidthW)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(56*HeighH)
            make.centerX.equalToSuperview()
            make.height.equalTo(88*HeighH)
            make.width.equalTo(576*WidthW)
        }
        if let userCount = self.userTextfield.text?.count , userCount > 0 {
            if let passwordCount = self.passwordTextfield.text?.count , passwordCount > 0  {
                loginButton.backgroundColor =  UIColor(red: 254/255, green: 75/255, blue: 72/255, alpha: 1)
                loginButton.isUserInteractionEnabled = true
            } else {
                loginButton.backgroundColor = UIColor(red: 254/255, green: 195/255, blue: 194/255, alpha: 1)
                loginButton.isUserInteractionEnabled = false
            }
        }
      return self
    }

}

extension LoginView:UITextFieldDelegate{
    @objc func accountTap(){
        accountNumberView.layer.borderColor = UIColor (red: 254/255, green: 159/255, blue: 157/255, alpha: 1).cgColor
        passwordView.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
    }
    @objc func passwordTap(){
        passwordView.layer.borderColor = UIColor (red: 254/255, green: 159/255, blue: 157/255, alpha: 1).cgColor
        accountNumberView.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
    }
  
    @objc func textDidChanged(){
        guard userTextfield.text != nil else{
            return
        }
        accountNumberView.layer.borderColor = UIColor (red: 254/255, green: 159/255, blue: 157/255, alpha: 1).cgColor
        passwordView.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
    }
    
    @objc func textsDidChanged(){
        guard passwordTextfield.text != nil else{
            return
        }
        passwordView.layer.borderColor = UIColor (red: 254/255, green: 159/255, blue: 157/255, alpha: 1).cgColor
        accountNumberView.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.userTextfield {
            let text = self.userTextfield.text
            let len = (text?.count ?? 0)+(string.count-range.length)
            return len <= 16
        }
        if textField == self.passwordTextfield {
            let text = self.passwordTextfield.text
            let len = (text?.count ?? 0)+(string.count-range.length)
            return len <= 20
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let userCount = self.userTextfield.text?.count , userCount > 0 {
            if let passwordCount = self.passwordTextfield.text?.count , passwordCount > 0  {
                loginButton.backgroundColor =  UIColor(red: 254/255, green: 75/255, blue: 72/255, alpha: 1)
                loginButton.isUserInteractionEnabled = true
            } else {
                loginButton.backgroundColor = UIColor(red: 254/255, green: 195/255, blue: 194/255, alpha: 1)
                loginButton.isUserInteractionEnabled = false
            }
        }
        return true
    }
    
    //按钮点击事件
    @objc func isHidenButton(sender: UIButton) {
        if isOpen == false {
            isOpen = !isOpen
            isHiddenButton.setBackgroundImage(UIImage(named: "login_open_eyes"), for: .normal)
            passwordTextfield.isSecureTextEntry = false
        } else {
            isOpen = !isOpen
            isHiddenButton.setBackgroundImage(UIImage(named: "login_lose_eyes"), for: .normal)
            passwordTextfield.isSecureTextEntry = true
        }
    }
    
    //按钮点击事件
    @objc func tapButton(sender: UIButton) {
        passwordView.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
        accountNumberView.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
        
        if self.userTextfield.text == nil {
            if  let view = getRemoteKeyboardWindow() {
                view.makeToast("请输入登录账号")
            }
            return
        }
        if self.passwordTextfield.text == nil {
            if  let view = getRemoteKeyboardWindow() {
                view.makeToast("请输入登录密码")
            }
            return
        }
        if let userCount = self.userTextfield.text , let passwordCount = self.passwordTextfield.text{
            loadData(page:1,userText:userCount,passwordText:passwordCount)
        }
        
    }
    
    //基本数据请求和模型转换
    func loadData(page:NSInteger,userText:String,passwordText:String){
        let dict = ["username":userText,"password":passwordText]
        ProgressHUD.showLoadingHudView(message: "Loading")
        ZHFNetwork.request(target: .PostParameters(pathStr: getBoxRecommendUrl, parameters:dict), success: { [self] (result) in
            let dic = result as! NSDictionary
            let code : NSInteger = dic["code"] as! NSInteger
            print("code************\(code)")
            if code == 200 {
                guard  let adicts : NSDictionary = dic["data"] as? NSDictionary,
                       let adicAs : NSDictionary = adicts["adminUser"] as? NSDictionary,
                       let model = LoginModel.deserialize(from: adicAs, designatedPath: "") else {
                           print("解析失败")
                           return
                      }
                
                //将实例对象转data
//                let modelData = NSKeyedArchiver.archivedData(withRootObject: model)
                guard let data = try? NSKeyedArchiver.archivedData(withRootObject: adicAs, requiringSecureCoding: false) else { return }
                //存储data对象
                userDefault.set(data, forKey: "UserInfo")
                userDefault.set(model.token, forKey: "token")
                userDefault.set(model.viewId, forKey: "viewId")
                userDefault.set(model.tenantId, forKey: "tenantId")
//                Cache.user
                print("===succeed data =\(adicAs)")
         
                print("====login= \(Cache.user?.tenantId ?? 0) ===model= \(model.tenantId )")
                let selectStoreVC = SelectStoreViewController()
                selectStoreVC.adminUserId = model.id
                selectStoreVC.userModel = model
                nextResponder(currentView: self).navigationController?.pushViewController(selectStoreVC, animated: true)
                ProgressHUD.showSuccesshTips(message: "")
                ProgressHUD.hideHud()
            }
            else{
                //请求成功，没有找到对应数据(常见问题传参错误，传参加密问题，后台定义的code)
//                if let view = self.getRemoteKeyboardWindow() {
                    self.makeToast("\(dic["msg"]!)code=\(code)")
//                }
                ProgressHUD.hideHud()
            }
        }, error1: { (statusCode) in
            //服务器报错等问题 (常见问题404 ，地址错误)
            if let view = self.getRemoteKeyboardWindow() {
                view.makeToast("请求错误！错误码：\(statusCode)")
            }
        }) { (error) in
            ProgressHUD.showErrorMessage(message: "\(error)")
            //没有网络等问题 （网络超时，没有网）
            if let view = self.getRemoteKeyboardWindow() {
                view.makeToast("请求失败！错误信息：\(error.errorDescription!)")
            }
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



//extension LoginView: UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arr.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let alertCellIdentifier  = "alertCellIdentifier"
//        var cell = tableView.dequeueReusableCell(withIdentifier: alertCellIdentifier)
//        if cell == nil {
//            cell = UITableViewCell(style:.default, reuseIdentifier: alertCellIdentifier)
//        }
//           let loginModel: LoginModel = self.arr[indexPath.row] as! LoginModel
//        cell?.textLabel?.text = loginModel.name!
//        cell?.textLabel?.font = UIFont.systemFont(ofSize: 13)
//        return cell!
//    }
//
//
//}
