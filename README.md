# swift---JJNetWork
swift. 封装moya 网络请求 get  post boby 各种请求方式









// 定义请求方法
enum JJService {
    //baby请求
    case PostBabyParameters(pathStr:String,Babyparameters: [String : Any])
    //没有参数
    case GetNoParameters(pathStr:String)
    //有参数
    case GetYesParameters(pathStr:String,parameters: [String : Any])
    
    case PostParameters(pathStr:String,parameters: [String : Any])
    //上传头像图片
    case uploadPortraitImage(pathStr:String,parameters: [String : Any],imageData: Data)
    //上传文件
    case uploadFileURL(pathStr:String,parameters: [String : Any],fileURL: URL)
    
    
}
