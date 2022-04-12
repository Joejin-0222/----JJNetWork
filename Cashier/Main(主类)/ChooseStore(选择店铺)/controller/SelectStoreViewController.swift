//
//  SelectStoreViewController.swift
//  Cashier
//
//  Created by mac on 2022/3/14.
//

import UIKit
import IQKeyboardManagerSwift

class SelectStoreViewController: UIViewController {
    var adminUserId:Int64 = 0
    var selectStoreView: SelectStoreView = SelectStoreView()
    
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
        setUI(viewId: adminUserId)
    }
    
}
  extension SelectStoreViewController {
      func setUI(viewId:Int64){
            self.view.addSubview(selectStoreView.initView(viewId: viewId))
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


