//
//  LoginViewController.swift
//  Cashier
//
//  Created by mac on 2022/3/9.
//

import UIKit
import IQKeyboardManagerSwift

class LoginViewController: UIViewController {
    var loginView: LoginView = LoginView()
    
    
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
        self.view.backgroundColor = UIColor (red: 254/255, green: 75/255, blue: 72/255, alpha: 1)
        //
        setUI()        
    }
}
extension LoginViewController {
    func setUI(){
        self.view.addSubview(loginView.initView())
    }
}

extension LoginViewController {
 
}
