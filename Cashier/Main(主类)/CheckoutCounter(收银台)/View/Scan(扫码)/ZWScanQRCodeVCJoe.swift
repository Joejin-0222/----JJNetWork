//
//  ZWScanQRCodeVCJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/15.
//

import UIKit
import AVFoundation

private let scanAnimationDuration = 3.0//扫描时长
private let needSound = true //扫描结束是否需要播放声音
private let scanWidth : CGFloat = 300 //扫描框宽度
private let scanHeight : CGFloat = 300 //扫描框高度
private let isRecoScanSize = true //是否仅识别框内
private let scanBoxImagePath = "扫描框" //扫描框图片
private let scanLineImagePath = "扫描线" //扫描线图片
private let soundFilePath = "noticeMusic.caf" //声音文件

class ZWScanQRCodeVCJoe: UIViewController{
    
    let cancelBtn = UIButton() //取消返回按钮
    
    var scanPane: UIImageView!///扫描框
    var scanPreviewLayer : AVCaptureVideoPreviewLayer! //预览图层
    var output : AVCaptureMetadataOutput!
    var scanSession :  AVCaptureSession?
    
    lazy var scanLine : UIImageView = {
        let scanLine = UIImageView()
        scanLine.frame = CGRect(x: 0, y: 0, width: scanWidth, height: 3)
        scanLine.image = UIImage(named: scanLineImagePath)
        return scanLine
        
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //初始化界面
        self.initView()
        
        //初始化ScanSession
        setupScanSession()
        
        // 监听屏幕旋转
        self.receiverNotification()
    }
    
    @objc func receiverNotification() {
        setLayerOrientationByDeviceOritation()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        startScan()
    }
    
    //初始化界面
    func initView()  {
        
        //取消按钮 返回按钮
        cancelBtn.frame = CGRect(x: 63*WidthW, y: 70*WidthW, width: 92*WidthW, height: 92*WidthW)
        //        cancelBtn.backgroundColor = UIColor.gray
        cancelBtn.setTitleColor(UIColor.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelBtn.layer.cornerRadius = 3
        cancelBtn.clipsToBounds = true
        cancelBtn.tag = 1
        cancelBtn.setImage(UIImage.init(named: "返回"), for: .normal)
        cancelBtn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
        self.view.addSubview(cancelBtn)
        
        //
        
        scanPane = UIImageView()
        scanPane.frame = CGRect(x: 300, y: 100, width: 400, height: 400)
        scanPane.image = UIImage(named: scanBoxImagePath)
        self.view.addSubview(scanPane)
        
        //增加约束
        addConstraint()
        
        scanPane.addSubview(scanLine)
    }
    
    //返回页面
    @objc func closeBtnClick(){
        self.view.viewContainingController()?.navigationController?.popViewController(animated: false)
    }
    
    //扫描完成回调
    func qrCodeCallBack(_ codeString : String?) {
        self.confirm(title: "扫描结果", message: codeString, controller: self,handler: { (_) in
            //继续扫描
            self.startScan()
        })
    }
    
    func addConstraint() {
        scanPane.translatesAutoresizingMaskIntoConstraints = false
        //创建约束
        let widthConstraint = NSLayoutConstraint(item: scanPane as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: scanWidth)
        let heightConstraint = NSLayoutConstraint(item: scanPane  as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: scanHeight)
        let centerX = NSLayoutConstraint(item: scanPane as Any, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: scanPane  as Any, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        //添加多个约束
        view.addConstraints([widthConstraint,heightConstraint,centerX,centerY])
    }
    
    
    //初始化scanSession
    func setupScanSession(){
        
        do{
            //设置捕捉设备
            let device = AVCaptureDevice.default(for: AVMediaType.video)!
            //设置设备输入输出
            let input = try AVCaptureDeviceInput(device: device)
            
            let output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            self.output = output
            
            //设置会话
            let  scanSession = AVCaptureSession()
            scanSession.canSetSessionPreset(.high)
            
            if scanSession.canAddInput(input){
                scanSession.addInput(input)
            }
            
            if scanSession.canAddOutput(output){
                scanSession.addOutput(output)
            }
            
            //设置扫描类型(二维码和条形码)
            output.metadataObjectTypes = [
                .qr,
                .code39,
                .code128,
                .code39Mod43,
                .ean13,
                .ean8,
                .code93
            ]
            //预览图层
            let scanPreviewLayer = AVCaptureVideoPreviewLayer(session:scanSession)
            scanPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            scanPreviewLayer.frame = view.layer.bounds
            self.scanPreviewLayer = scanPreviewLayer
            
            setLayerOrientationByDeviceOritation()
            
            //保存会话
            self.scanSession = scanSession
            
        }catch{
            //摄像头不可用
            self.confirm(title: "温馨提示", message: "摄像头不可用", controller: self)
            return
        }
        
    }
    
    func setLayerOrientationByDeviceOritation() {
        if(scanPreviewLayer == nil){
            return
        }
        scanPreviewLayer.frame = view.layer.bounds
        view.layer.insertSublayer(scanPreviewLayer, at: 0)
        let screenOrientation = UIDevice.current.orientation
        if(screenOrientation == .portrait){
            scanPreviewLayer.connection?.videoOrientation = .portrait
        }else if(screenOrientation == .landscapeLeft){
            scanPreviewLayer.connection?.videoOrientation = .landscapeRight
        }else if(screenOrientation == .landscapeRight){
            scanPreviewLayer.connection?.videoOrientation = .landscapeLeft
        }else if(screenOrientation == .portraitUpsideDown){
            scanPreviewLayer.connection?.videoOrientation = .portraitUpsideDown
        }else{
            scanPreviewLayer.connection?.videoOrientation = .landscapeRight
        }
        
        //设置扫描区域
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVCaptureInputPortFormatDescriptionDidChange, object: nil, queue: nil, using: { (noti) in
            if(isRecoScanSize){
                self.output.rectOfInterest = self.scanPreviewLayer.metadataOutputRectConverted(fromLayerRect: self.scanPane.frame)
            }else{
                self.output.rectOfInterest = CGRect(x: 0, y: 0, width: 1, height: 1)
            }
        })
    }
    
    //设备旋转后重新布局
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayerOrientationByDeviceOritation()
    }
    
    //开始扫描
    fileprivate func startScan(){
        
        scanLine.layer.add(scanAnimation(), forKey: "scan")
        guard let scanSession = scanSession else { return }
        if !scanSession.isRunning
        {
            scanSession.startRunning()
        }
    }
    
    //扫描动画
    private func scanAnimation() -> CABasicAnimation{
        
        let startPoint = CGPoint(x: scanLine .center.x  , y: 1)
        let endPoint = CGPoint(x: scanLine.center.x, y: scanHeight - 2)
        
        let translation = CABasicAnimation(keyPath: "position")
        translation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        translation.fromValue = NSValue(cgPoint: startPoint)
        translation.toValue = NSValue(cgPoint: endPoint)
        translation.duration = scanAnimationDuration
        translation.repeatCount = MAXFLOAT
        translation.autoreverses = true
        
        return translation
    }
    
    //MARK: -
    //MARK: Dealloc
    deinit{
        ///移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
}


//MARK: -
//MARK: AVCaptureMetadataOutputObjects Delegate
extension ZWScanQRCodeVCJoe : AVCaptureMetadataOutputObjectsDelegate
{
    
    
    //捕捉扫描结果
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        //停止扫描
        self.scanLine.layer.removeAllAnimations()
        self.scanSession!.stopRunning()
        
        //播放声音
        if(needSound){
            self.playAlertSound()
        }
        
        //扫描完成
        if metadataObjects.count > 0 {
            if let resultObj = metadataObjects.first as? AVMetadataMachineReadableCodeObject{
                self.qrCodeCallBack(resultObj.stringValue)
            }
        }
    }
    
    //弹出确认框
    func confirm(title:String?,message:String?,controller:UIViewController,handler: ( (UIAlertAction) -> Swift.Void)? = nil){
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let entureAction = UIAlertAction(title: "确定", style: .destructive, handler: handler)
        alertVC.addAction(entureAction)
        controller.present(alertVC, animated: true, completion: nil)
        
    }
    
    //播放声音
    func playAlertSound(){
        guard let soundPath = Bundle.main.path(forResource: soundFilePath, ofType: nil)  else { return }
        guard let soundUrl = NSURL(string: soundPath) else { return }
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundUrl, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
}


