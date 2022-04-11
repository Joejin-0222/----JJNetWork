//
//  Common.swift
//  MoyaDemo
//
//  Created by 张海峰 on 2018/12/3.
//  Copyright © 2018年 张海峰. All rights reserved.
//platform
import Foundation
import UIKit

//测试环境
//let BASE_SERVER_URL = "http://47.93.54.18:19200/"
let BASE_SERVER_URL = "https://test.api.igoodsale.com/"
//正式环境
//let BASE_SERVER_URL = "https://api.igoodsale.com/"
//预发布环境
// let BASE_SERVER_URL = "https://api.prerelease.igoodsale.com/"



let getBoxRecommendUrl = "uc/admin/PClogin"//登录uc/admin/PClogin

let getUrlSetShop = "cashier/shop/getShop"//获取门店列表
//收银台
let getFindCashier = "cashier/goods/findCashier" //查询收银商品分类
let getFindCashierGoods = "cashier/goods/findCashierGoods" //查询收银商品

//let changeUserMessageUrl = "users/userInfoSave"//用户资料保存
