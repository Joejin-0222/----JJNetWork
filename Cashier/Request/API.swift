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
//let BASE_SERVER_URL = "https://test.api.igoodsale.com/"
//正式环境
//let BASE_SERVER_URL = "https://api.igoodsale.com/"
//预发布环境
 let BASE_SERVER_URL = "https://api.prerelease.igoodsale.com/"
//李维强
//let BASE_SERVER_URL = "http://47.95.212.72:9200/"



let getBoxRecommendUrl = "uc/admin/login"//登录uc/admin/PClogin

let getUrlSetShop = "cashier/shop/getShop"//获取门店列表
//收银台
let getFindCashier = "cashier/goods/findCashier" //查询收银商品分类
let getFindCashierGoods = "cashier/goods/findCashierGoods" //查询收银商品
let getOrderConfirm = "/cashier/orders/getOrderConfirm" //订单列表 ，购物车

//let changeUserMessageUrl = "users/userInfoSave"//用户资料保存

//**********************  员工交班start ************************

let getCurrentDaily = "cashier/succession/currentDaily"//员工交班第一个接口

//**********************  员工交班end ************************
