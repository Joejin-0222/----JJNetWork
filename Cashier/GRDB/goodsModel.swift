//
//  goodsModel.swift
//  testproject
//
//  Created by mac on 2022/4/20.
//

import GRDB


class goodsModel: RootModel, Codable {
    
    var specBarcode : String? = ""
    
    var skuViewId : String? = ""
    
    var spuViewId : String? = ""
    
    var specs : String? = ""
    
    var imageUrl : String? = ""
    
    var categoryId : Int? = 0
    
    var spuDirectoryParams : String? = ""
    
    var currentStock : Int? = 0
    
    var skuBaseViewId : String? = ""
    
    var originalPrice : Int? = 0
    
    var customCode : String? = ""
    
    var goodsName : String? = ""
    
    var name : String? = ""
    
    var salePrice : Int? = 0
    
    var isItGspGoods : Int? = 0
    
    //    required init() {
    //    }
    
    /// 设置行名
    private enum Columns: String, CodingKey, ColumnExpression {
        
        case specBarcode
        
        case skuViewId
        
        case spuViewId
        
        case specs
        
        case imageUrl
        
        case categoryId
        
        case spuDirectoryParams
        
        case currentStock
        
        case skuBaseViewId
        
        case originalPrice
        
        case customCode
        
        case goodsName
        
        case name
        
        case salePrice
        
        case isItGspGoods
        
    }
}
extension goodsModel:MutablePersistableRecord, FetchableRecord {
    /// 获取数据库对象
    private static let dbQueue: DatabaseQueue = DBManager.dbQueue
    
    //MARK: 创建
    /// 创建数据库
    private static func createTable() -> Void {
        try! self.dbQueue.inDatabase { (db) -> Void in
            // 判断是否存在数据库
            if try db.tableExists(TableName.goodsModel) {
                debugPrint("表已经存在")
                return
            }
            // 创建数据库表
            try db.create(table: TableName.goodsModel, temporary: false, ifNotExists: true, body: { (t) in
                
                t.column(Columns.specBarcode.rawValue, Database.ColumnType.text)
                
                t.column(Columns.skuViewId.rawValue, Database.ColumnType.text)
                
                t.column(Columns.spuViewId.rawValue, Database.ColumnType.text)
                
                t.column(Columns.specs.rawValue, Database.ColumnType.text)
                
                t.column(Columns.imageUrl.rawValue, Database.ColumnType.text)
                
                t.column(Columns.categoryId.rawValue, Database.ColumnType.text)
                
                t.column(Columns.spuDirectoryParams.rawValue, Database.ColumnType.text)
                
                t.column(Columns.currentStock.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.skuBaseViewId.rawValue, Database.ColumnType.text)
                
                t.column(Columns.originalPrice.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.customCode.rawValue, Database.ColumnType.text)
                
                t.column(Columns.goodsName.rawValue, Database.ColumnType.text)
                
                t.column(Columns.name.rawValue, Database.ColumnType.text)
                
                t.column(Columns.salePrice.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.isItGspGoods.rawValue, Database.ColumnType.integer)
                
            })
        }
    }
    
    //MARK: 插入
    /// 插入单个数据
    static func insert(goods: goodsModel) -> Void {
        // 判断是否存在
        guard goodsModel.query(name: goods.skuViewId!) == nil else {
            debugPrint("插入学生 内容重复")
            // 更新
            self.update(goods: goods)
            return
        }
        
        // 创建表
        self.createTable()
        // 事务
        try! self.dbQueue.inTransaction { (db) -> Database.TransactionCompletion in
            do {
                var studentTemp = goods
                // 插入到数据库
                try studentTemp.insert(db)
                return Database.TransactionCompletion.commit
            } catch {
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    /// 插入商品数据所有
    static func insertAllArrData(ArrData:[goodsModel?]) -> Void {
        for mod : goodsModel? in ArrData {
            goodsModel.insert(goods: mod!)
        }
        
    }
    
    
    //MARK: 查询
    static func query(name: String) -> goodsModel? {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> goodsModel? in
            return try goodsModel.filter(Column(Columns.name.rawValue) == name).fetchOne(db)
        })
    }
    
    
    /// MARK: 查询 根据分类id  查询
    static func queryAll(categoryId: String) -> [goodsModel] {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> [goodsModel] in
            
            return try goodsModel.filter(Column(Columns.categoryId.rawValue) == categoryId).fetchAll(db)
            
        })
    }
    
    /// 查询所有
    static func queryAll() -> [goodsModel] {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> [goodsModel] in
            return try goodsModel.fetchAll(db)
        })
    }
    
    //MARK: 更新
    /// 更新
    static func update(goods: goodsModel) -> Void {
        /// 创建数据库表
        self.createTable()
        // 事务 更新场景
        try! self.dbQueue.inTransaction { (db) -> Database.TransactionCompletion in
            do {
                // 赋值
                try goods.update(db)
                return Database.TransactionCompletion.commit
            } catch {
                return Database.TransactionCompletion.rollback
            }
        }
    }
    
    //MARK: 删除
    /// 根据名字删除学生
    static func delete(name: String) -> Void {
        // 查询
        guard let goods = self.query(name: name) else {
            return
        }
        // 删除
        self.delete(goods: goods)
    }
    
    /// 删除单个学生
    static func delete(goods: goodsModel) -> Void {
        // 是否有数据库表
        self.createTable()
        // 事务
        try! self.dbQueue.inTransaction { (db) -> Database.TransactionCompletion in
            do {
                // 删除数据
                try goods.delete(db)
                return Database.TransactionCompletion.commit
            } catch {
                return Database.TransactionCompletion.rollback
            }
        }
    }
}
