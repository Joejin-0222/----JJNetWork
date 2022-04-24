//
//  ZWStaffShiftVCJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWStaffShiftVCJoe: ZWRootViewControllerJoe {

    var leftTableView : ZWStaffShiftLeftView =  ZWStaffShiftLeftView()
    var rightView :   ZWStaffShiftRightView = ZWStaffShiftRightView()
    var dailyModel: ZWDailyModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sehzhiUI()
        self.loadData()
//        self.loadDailyRecordList()
        
    }
    
    func loadData(){
        if let path = Bundle.main.path(forResource: "daily", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)! as String

                let dict: NSDictionary =  self.getDictionaryFromJSONString(jsonString: JSONString)
                let dataDict = dict["data"]
                let jsonString = self.getJSONStringFromDictionary(dictionary: dataDict as! NSDictionary)
                let model : ZWDailyModel = ZWDailyModel.deserialize(from:jsonString as String, designatedPath: "")!
                print(model)
                self.dailyModel = model
                
                self.leftTableView.model = model
                self.rightView.model = model
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")

            }}
        else {
            print("Invalid filename/path.")

        }

        
        
        let  dict:NSDictionary = ["shopId":Cache.userSto?.sid ?? "156207556"]

        ZHFNetwork.request(target: .GetYesParameters(pathStr: getCurrentDaily, parameters: dict as! [String : Any])) { result in

        } error1: { statusCode in

        } failure: { error in

        }
    }
    
    
    
    func loadDailyRecordList(){
        let  dict:NSDictionary = ["shopId":Cache.userSto?.sid ?? "156207556","startTime":"2022-01-01","endTime":"2022-04-24"]
        
        ZHFNetwork.request(target: .GetYesParameters(pathStr: getDailyRecordList, parameters: dict as! [String : Any])) { result in
            
        } error1: { statusCode in
            
        } failure: { error in
            
        }
    }
    
    
    func sehzhiUI(){
        //
        self.view.addSubview(leftTableView.initView())
        leftTableView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(38*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        if self.dailyModel != nil{
            self.leftTableView
        }
        //
        self.view.addSubview(rightView.initView())
        rightView.snp.makeConstraints { make in
            make.left.equalTo(self.rightline.snp.right).offset(0*WidthW)
            make.top.equalTo(self.LogoImage.snp.top).offset(58*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
        }
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{

        let jsonData:Data = jsonString.data(using: .utf8)!

        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)

         if dict != nil {

            return dict as! NSDictionary

        }

        return NSDictionary()

    }

    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
  

}
