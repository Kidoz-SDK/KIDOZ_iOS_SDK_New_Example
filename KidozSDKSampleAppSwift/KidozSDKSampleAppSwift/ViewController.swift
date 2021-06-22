//
//  ViewController.swift
//  Kidoz_iOS_SDK_Sample_App_Swift
//
//  Created by Lev Firer on 20/05/2020.
//  Copyright © 2020 Kidoz. All rights reserved.
//
import UIKit
class ViewController: UIViewController,KDZInitDelegate,KDZInterstitialDelegate,KDZRewardedDelegate,KDZBannerDelegate {
    
    var mBanner: UIView!
    @IBOutlet weak var logText: UITextView!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          self.setBorder()
          self.initKidozSDK()
          // Do any additional setup after loading the view.
      }
    

    func setBorder(){
        self.logText.layer.borderColor = UIColor.orange.cgColor
        self.logText.layer.borderWidth = 2.3
        self.logText.layer.cornerRadius = 15
    }
    
    func logOut(message:String ,textView:UITextView ,timestamp:String){
        textView.text = textView.text + timestamp + " - " + message + "\n"
        let location = textView.text.count - 1
        let bottom = NSMakeRange(location, 1)
        textView.scrollRangeToVisible(bottom)
    }
    
    func getTimestamp () ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmmssSSS"
        let time = formatter.string(from: Date())
        return time
    }
    
    
    // MARK: - SDK

   
    func initKidozSDK(){
        logOut(message: "Initilalizing SDK...",textView: logText,timestamp: getTimestamp())
        KidozSDK.instance().initialize(withPublisherID: "8", securityToken: "QVBIh5K3tr1AxO4A1d4ZWx1YAe5567os",with :self)
        logOut(message: "SDK Vesion " + KidozSDK.instance().getVersion(),textView: logText,timestamp: getTimestamp())
    }

    func onInitSuccess(){
        if(KidozSDK.instance().isSDKInitialized()){
            logOut(message: "SDK Initialized",textView: logText,timestamp: getTimestamp())
            NSLog("Init sdk success");
            
            logOut(message: "Interstitial initializing...",textView: logText,timestamp: getTimestamp())
            KidozSDK.instance().initializeInterstitial(with: self)

            logOut(message: "Rewarded initializing...",textView: logText,timestamp: getTimestamp())
            KidozSDK.instance().initializeRewarded(with: self)
            
            logOut(message: "Banner initializing...",textView: logText,timestamp: getTimestamp())
            KidozSDK.instance().initializeBanner(with: self,with: self)
            KidozSDK.instance().setBannerPosition(BOTTOM_CENTER)
        }
    };
    
    
    func onInitError(_ errorMessage: String!){
          NSLog("onInitError " + errorMessage);
          logOut(message: "onInitError " + errorMessage,textView: logText,timestamp: getTimestamp())
    }
    
    
    // MARK: - Interstitial
    
    @IBAction func loadInterstitial(_ sender: Any) {
        logOut(message: "loadInterstitial",textView: logText,timestamp: getTimestamp())
        if(KidozSDK.instance().isSDKInitialized()){
            if(KidozSDK.instance().isInterstitialInitialized()){
                    KidozSDK.instance().loadInterstitial()
                }else{
                    logOut(message: "Interstitial not initialized",textView: logText,timestamp: getTimestamp())
                    NSLog("Interstitial not initialized");
                }
            }else{
            NSLog("sdk not initialized");
            logOut(message: "sdk not initialized",textView: logText,timestamp: getTimestamp())
        }
    }
    
    @IBAction func showInterstitial(_ sender: Any) {
        logOut(message: "showInterstitial",textView: logText,timestamp: getTimestamp())
        if(KidozSDK.instance().isInterstitialReady()){
            KidozSDK.instance().showInterstitial()
        }else{
            NSLog("Interstitial not ready");
            logOut(message: "Interstitial not ready",textView: logText,timestamp: getTimestamp())
        }
    }
    
    func interstitialDidInitialize() {
        NSLog("interstitialDidInitialize");
        logOut(message: "interstitialDidInitialize",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialDidClose() {
        NSLog("interstitialDidClose");
        logOut(message: "interstitialDidClose",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialDidOpen() {
        NSLog("interstitialDidOpen");
        logOut(message: "interstitialDidOpen",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialIsReady() {
        NSLog("interstitialIsReady");
        logOut(message: "interstitialIsReady",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialReturnedWithNoOffers() {
        NSLog("interstitialReturnedWithNoOffers");
        logOut(message: "interstitialReturnedWithNoOffers",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialDidPause() {
        NSLog("interstitialDidPause");
        logOut(message: "interstitialDidPause",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialDidResume() {
        NSLog("interstitialDidResume");
        logOut(message: "interstitialDidResume",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialLoadFailed() {
        NSLog("interstitialLoadFailed");
        logOut(message: "interstitialLoadFailed",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialDidReciveError(_ errorMessage: String!) {
        NSLog("interstitialDidReciveError" + errorMessage);
        logOut(message: "interstitialDidReciveError",textView: logText,timestamp: getTimestamp())
    }
    
    func interstitialLeftApplication() {
        NSLog("interstitialLeftApplication");
        logOut(message: "interstitialLeftApplication",textView: logText,timestamp: getTimestamp())
    }
    
    // MARK: - Rewarded

    @IBAction func loadRewarded(_ sender: Any) {
        logOut(message: "loadRewarded",textView: logText,timestamp: getTimestamp())
        if(KidozSDK.instance().isSDKInitialized()){
            if(KidozSDK.instance().isRewardedInitialized()){
                KidozSDK.instance().loadRewarded()
                }else{
                    logOut(message: "Rewarded not initialized",textView: logText,timestamp: getTimestamp())
                    NSLog("Rewarded not initialized");
                    }
        }else{
            NSLog("sdk not initialized");
            logOut(message: "sdk not initialized",textView: logText,timestamp: getTimestamp())
        }
    }
    
    @IBAction func showRewarded(_ sender: Any) {
        logOut(message: "showRewarded",textView: logText,timestamp: getTimestamp())
        if(KidozSDK.instance().isRewardedReady()){
            KidozSDK.instance().showRewarded()
        }else{
            NSLog("Rewarded not ready");
            logOut(message: "Rewarded not ready",textView: logText,timestamp: getTimestamp())
        }
    }
    
    func rewardedDidInitialize() {
        NSLog("rewardedDidInitialize");
        logOut(message: "rewardedDidInitialize",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedDidClose() {
        NSLog("rewardedDidClose");
        logOut(message: "rewardedDidClose",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedDidOpen() {
        NSLog("rewardedDidOpen");
        logOut(message: "rewardedDidOpen",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedIsReady() {
        NSLog("rewardedIsReady");
        logOut(message: "rewardedIsReady",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedReturnedWithNoOffers() {
        NSLog("rewardedReturnedWithNoOffers");
        logOut(message: "rewardedReturnedWithNoOffers",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedDidPause() {
        NSLog("rewardedDidPause");
        logOut(message: "rewardedDidPause",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedDidResume() {
        NSLog("rewardedDidResume");
        logOut(message: "rewardedDidResume",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedLoadFailed() {
        NSLog("rewardedLoadFailed");
        logOut(message: "rewardedLoadFailed",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedDidReciveError(_ errorMessage: String!) {
        NSLog("rewardedDidReciveError" + errorMessage);
        logOut(message: "rewardedDidReciveError",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardReceived() {
        NSLog("rewardReceived");
        logOut(message: "rewardReceived",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedStarted() {
        NSLog("rewardedStarted");
        logOut(message: "rewardedStarted",textView: logText,timestamp: getTimestamp())
    }
    
    func rewardedLeftApplication() {
        NSLog("rewardedLeftApplication");
        logOut(message: "rewardedLeftApplication",textView: logText,timestamp: getTimestamp())
    }
    
    
    // MARK: - Banner
    
    @IBAction func loadBanner(_ sender: Any) {
        logOut(message: "loadBanner",textView: logText,timestamp: getTimestamp())
        if(KidozSDK.instance().isSDKInitialized()){
            if(KidozSDK.instance().isBannerInitialized()){
                KidozSDK.instance().loadBanner()
                  }else{
                    logOut(message: "Banner not initialized",textView: logText,timestamp: getTimestamp())
                    NSLog("Banner not initialized");
                }
        }else{
            NSLog("sdk not initialized");
            logOut(message: "sdk not initialized",textView: logText,timestamp: getTimestamp())
        }
    }
    
    @IBAction func showBanner(_ sender: Any) {
        logOut(message: "showBanner",textView: logText,timestamp: getTimestamp())
        if(KidozSDK.instance().isBannerReady()){
            KidozSDK.instance().showBanner()
        }else{
            NSLog("Banner not ready");
            logOut(message: "Banner not ready",textView: logText,timestamp: getTimestamp())
        }
    }
    

    @IBAction func hideBanner(_ sender: Any) {
        KidozSDK.instance().hideBanner()
        logOut(message: "hideBanner",textView: logText,timestamp: getTimestamp())
    }
    
    
    func bannerDidInitialize() {
        NSLog("bannerDidInitialize");
        logOut(message: "bannerDidInitialize",textView: logText,timestamp: getTimestamp())
    }
    
    func bannerDidClose() {
        NSLog("bannerDidClose");
        logOut(message: "bannerDidClose",textView: logText,timestamp: getTimestamp())
    }
    
    func bannerDidOpen() {
        NSLog("bannerDidOpen");
        logOut(message: "bannerDidOpen",textView: logText,timestamp: getTimestamp())
    }
    
    func bannerIsReady() {
        NSLog("bannerIsReady");
        logOut(message: "bannerIsReady",textView: logText,timestamp: getTimestamp())
    }
    
    func bannerReturnedWithNoOffers() {
        NSLog("bannerReturnedWithNoOffers");
        logOut(message: "bannerReturnedWithNoOffers",textView: logText,timestamp: getTimestamp())
    }
    
    func bannerLoadFailed() {
        NSLog("bannerLoadFailed");
        logOut(message: "bannerLoadFailed",textView: logText,timestamp: getTimestamp())
    }
    
    func bannerDidReciveError(_ errorMessage: String!) {
        NSLog("bannerLoadFailed" + errorMessage);
        logOut(message: "bannerLoadFailed" + errorMessage,textView: logText,timestamp: getTimestamp())
    }
    
    func bannerLeftApplication() {
        NSLog("bannerLeftApplication");
        logOut(message: "bannerLeftApplication",textView: logText,timestamp: getTimestamp())
    }
    
    func initBannerWithView(){
        let BANNER_WIDTH: CGFloat = 320
        let BANNER_HEIGHT: CGFloat = 50

        mBanner = UIView(frame: CGRect(x: 0, y: 0, width: BANNER_WIDTH, height: BANNER_HEIGHT))
        view.addSubview(mBanner)
        mBanner.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([NSLayoutConstraint(
                    item: mBanner,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: bottomLayoutGuide,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0),
                NSLayoutConstraint(
                    item: mBanner,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0),
                NSLayoutConstraint(
                    item: mBanner,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: BANNER_HEIGHT),
                NSLayoutConstraint(
                    item: mBanner,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 0,
                    constant: BANNER_WIDTH)])
        
                view.bringSubviewToFront(mBanner)
                KidozSDK.instance().initializeBanner(with: self, with: mBanner)
        
    }
    
  
}

