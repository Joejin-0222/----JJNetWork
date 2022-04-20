//
//  goodsModel.swift
//  testproject
//
//  Created by mac on 2022/4/20.
//

import GRDB


class ZWSementGRDB: RootModel, Codable {
    
    
    var  channelCategoryId :Int64 = 0 //
    var  channelId :Int64 = 0 //
    var  cityId :Int64 = 0 //
    var  createTime :Int64 = 0 //
    var  goodsType:Int64 = 0 //
    var  id :Int64 = 0 //
    var  img :String = ""
    var  menuCategoryId :Int64 = 0 //
    var  menuViewId :String = ""
    var  name :String = ""
    var  poiId :String = ""
    var  shopId :Int64 = 0 //
    var  status :Int64 = 0 //
    var  tenantId :Int64 = 0 //
    var  updateTime :Int64 = 0 //
    var  weight :Int64 = 0 //
    
    

    
    /// 设置行名
    private enum Columns: String, CodingKey, ColumnExpression {
        
        case  channelCategoryId
        case  channelId
        case  cityId
        case  createTime
        case  goodsType
        case  id
        case  img
        case  menuCategoryId
        case  menuViewId
        case  name
        case  poiId
        case  shopId
        case  status
        case  tenantId
        case  updateTime
        case  weight
        
    }
}
extension ZWSementGRDB:MutablePersistableRecord, FetchableRecord {
    /// 获取数据库对象
    private static let dbQueue: DatabaseQueue = DBManager.dbQueue
    
    //MARK: 创建
    /// 创建数据库
    private static func createTable() -> Void {
        try! self.dbQueue.inDatabase { (db) -> Void in
            // 判断是否存在数据库
            if try db.tableExists(TableName.ZWSementGRDB) {
                debugPrint("表已经存在")
                return
            }
            // 创建数据库表
            try db.create(table: TableName.ZWSementGRDB, temporary: false, ifNotExists: true, body: { (t) in
                
                t.column(Columns.channelCategoryId.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.channelId.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.cityId.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.createTime.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.goodsType.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.id.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.img.rawValue, Database.ColumnType.text)
                
                t.column(Columns.menuCategoryId.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.menuViewId.rawValue, Database.ColumnType.text)
                
                t.column(Columns.name.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.poiId.rawValue, Database.ColumnType.text)
                
                t.column(Columns.shopId.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.status.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.tenantId.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.updateTime.rawValue, Database.ColumnType.integer)
                
                t.column(Columns.weight.rawValue, Database.ColumnType.integer)
                
            })
        }
    }
    
    //MARK: 插入
    /// 插入单个数据
    static func insert(goods: ZWSementGRDB) -> Void {
        // 判断是否存在
        guard ZWSementGRDB.query(name: "\(goods.id)") == nil else {
            debugPrint("插入分类 内容重复")
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
    static func insertAllArrData(ArrData:[ZWSementGRDB?]) -> Void {
        for mod : ZWSementGRDB? in ArrData {
            ZWSementGRDB.insert(goods: mod!)
        }
        
    }
    
    
    //MARK: 查询
    static func query(name: String) -> ZWSementGRDB? {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> ZWSementGRDB? in
            return try ZWSementGRDB.filter(Column(Columns.name.rawValue) == name).fetchOne(db)
        })
    }
    
    
    /// 查询所有
    static func queryAll() -> [ZWSementGRDB] {
        // 创建数据库
        self.createTable()
        // 返回查询结果
        return try! self.dbQueue.unsafeRead({ (db) -> [ZWSementGRDB] in
            return try ZWSementGRDB.fetchAll(db)
        })
    }
    
    //MARK: 更新
    /// 更新
    static func update(goods: ZWSementGRDB) -> Void {
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
    static func delete(goods: ZWSementGRDB) -> Void {
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
