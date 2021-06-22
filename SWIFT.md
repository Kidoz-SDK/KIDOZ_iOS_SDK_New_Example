# KIDOZ iOS SDK Sample App

**KIDOZ SDK and the sample App are compatible with iOS 8.0 and above.**

**KIDOZ SDK is written in Objective C.**

***This SDK version was verified not to contain the Advertiser Identifier (IDFA) as required by Apple App Store regulation for apps of Kids category.***

This iOS application project provides an example of the KIDOZ SDK integration.

The example application contains the following creative tools:
* KIDOZ Interstitial view  
* KIDOZ Rewarded view
* KIDOZ Banner view
# Running the sample app
1.  Download / Clone the KidozSDKSampleApp
2.  Launch  `Xcode`, click  `File`  –>  `Open`, navigate to downloaded project, select the Xcode project file and press  `OK`.

# KIDOZ SDK - Getting Started
 
#### Adding the SDK

1.  Navigate to the downloaded KidozSDKSampleApp folder or open KidozSDKSampleApp in the Xcode and find the libKidozSDK.a and the KidozSDK.h files.
2.  Drag and drop the libKidozSDK.a and the KidozSDK.h to your project.
<a href="url"><img src="https://cdn.kidoz.net/sdk/ios/KidozSdkSampleApp1.png" align="center"  ></a>
3. Select your target in the project navigator, select the “Build Settings” tab, search for “Other Linker Flags”, click on the “+” and type -ObjC  `Other Linker Flags -ObjC`  .
<a href="url"><img src="https://cdn.kidoz.net/sdk/ios/KidozSdkSampleApp3.png" align="center"  ></a>
4. In the  `info.plist`  add  `NSAppTransportSecurity`  exception with  `NSAllowsArbitraryLoads`exception  
`<key>NSAppTransportSecurity</key>`  
`<dict>`  
`<key>NSAllowsArbitraryLoads</key>`  
`<true/>`  
`</dict>`
<a href="url"><img src="https://cdn.kidoz.net/sdk/ios/KidozSdkSampleApp2.png" align="center"  ></a>
5. Add the #import ”KidozSDK.h” in to your Objective-C bridging header file.
6. Conform to the  `KDZInitDelegate`  protocol and implement SDK delegate methods:  
``` 
  class ViewController: UIViewController,KDZInitDelegate {
  func onInitSuccess(){}
  func onInitError(_ errorMessage: String!){}
  }
```
7. Init the SDK:
`KidozSDK.instance().initialize(withPublisherID: <enter your publisher ID>, securityToken:<enter your security Token>,with :self)`
8.  To check SDK state :  
    `var initialized = KidozSDK.instance().isSDKInitialized();`



# KIDOZ Interstitial 
`Intersitial`  is a full screen widget which is designed for showing full screen advertisement.  
1. In the selected view controller, conform to the  `KDZInterstitialDelegate`  protocol and implement all delegate methods:  
```
class ViewController: UIViewController,KDZInterstitialDelegate{
func interstitialDidInitialize() {} 
func interstitialDidClose() {} 
func interstitialDidOpen() {}
func interstitialIsReady() {}
func interstitialReturnedWithNoOffers() {}
func interstitialDidPause() {}
func interstitialDidResume() {}
func interstitialLoadFailed() {}
func interstitialDidReciveError(_ errorMessage: String!) {}
func interstitialLeftApplication() {}
}
```

* To check Interstitial state :  
```
var initislized = KidozSDK.instance().isInterstitialInitialized();
var ready = KidozSDK.instance().isInterstitialReady();
```
  2. Init Interstitial: 
```
if(KidozSDK.instance().isSDKInitialized()){
   KidozSDK.instance().initializeInterstitial(with: self)
 }
```  
3. Load Interstitial:  
```
if(KidozSDK.instance().isInterstitialInitialized()){
   KidozSDK.instance().loadInterstitial()
 }
```

4. Show Interstitial:  
```
if(KidozSDK.instance().isInterstitialReady()){
   KidozSDK.instance().showInterstitial()
 }
```

**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads : Before the game ends, between game levels, after completing a game level .   
- Some Interstitial Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-interstitialDidOpen:` and `-interstitialDidClose:` callbacks:
```
func interstitialDidOpen() {
// mute/pause background sounds
// pause your game 
}

func interstitialDidClose() {
// unmute/resume background sounds
// resume your game 
}
```
# KIDOZ Rewarded 
`Rewarded`  is a full screen widget which is designed for showing full screen advertisement.  
1. In the selected view controller , conform to the  `KDZRewardedDelegate`  protocol and implement all delegate methods:  
```
class  ViewController: UIViewController,KDZRewardedDelegate{
func rewardedDidInitialize() {}
func rewardedDidClose() {}
func rewardedDidOpen() {} 
func rewardedIsReady() {}  
func rewardedReturnedWithNoOffers() {} 
func rewardedDidPause() {}  
func rewardedDidResume() {}  
func rewardedLoadFailed() {}
func rewardedDidReciveError(_ errorMessage: String!) {}
func rewardReceived() {} 
func rewardedStarted() {}
func rewardedLeftApplication() {}
}
```
* To check rewarded state :  
```
var initislized = KidozSDK.instance().isRewardedInitialized();
var ready = KidozSDK.instance().isRewardedReady();
```
2. Init rewarded:  
```
if(KidozSDK.instance().isSDKInitialized()){
   KidozSDK.instance().initializeRewarded(with: self) 
 }
```
3. Load rewarded:  
```
if(KidozSDK.instance().isRewardedInitialized()){
   KidozSDK.instance().loadRewarded()
}
```
4. Show rewarded:  
```
if(KidozSDK.instance().isRewardedReady()){
   KidozSDK.instance().showRewarded()
}
```  

**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads : Based on the implementation of rewarded logics in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-rewardedDidOpen:` and `-rewardedDidClose:` callbacks:
```
func rewardedDidOpen() {
//mute/pause background sounds
//pause your game 
}

func rewardedDidClose() {
//unmute/resume background sounds
//resume your game 
}
```
# KIDOZ Banner

1. In the selected view controller , conform to the  `KDZBannerDelegate`  protocol and implement all delegate methods:  

```
class  ViewController: UIViewController,KDZBannerDelegate{
func bannerDidInitialize() {}
func bannerDidClose() {}
func bannerDidOpen() {}
func bannerIsReady(){}
func bannerReturnedWithNoOffers() {}
func bannerLoadFailed() {}
func bannerDidReciveError(_ errorMessage: String!) {}
func bannerLeftApplication() {}
}
```

* To check banner state :  
```
var initislized = KidozSDK.instance().isBannerInitialized();
var ready = KidozSDK.instance().isBannerReady();
```

2. Init banner:  
The banner can be placed on one of six sides of the  screen with BANNER_POSITION - `TOP_CENTER`, `BOTTOM_CENTER` ,`TOP_LEFT` ,`TOP_RIGHT` ,`BOTTOM_LEFT` ,`BOTTOM_RIGHT`.

and initialized with: initializeBanner(with: KDZBannerDelegate ,with: UIViewController)

```
if(KidozSDK.instance().isSDKInitialized()){
   KidozSDK.instance().initializeBanner(with: self,with: self)
   KidozSDK.instance().setBannerPosition(BOTTOM_CENTER)
}
```
Or The Banner can be initialized with custom UIView and positioned more flexibly with constraints with : initializeBanner(with: KDZBannerDelegate ,with: UIView)

``` 
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
``` 
3. Load banner :  
```
if(KidozSDK.instance().isBannerInitialized()){
   KidozSDK.instance().loadBanner()
}
```
4. Show banner:  
```
if(KidozSDK.instance().isBannerReady()){
   KidozSDK.instance().showBanner()
}
```  

5. Hide banner:  
```
   KidozSDK.instance().hideBanner()
```  
# For any question or assistance, please contact us at SDK@kidoz.net.
</br>
License
--------

    Copyright 2015 KIDOZ, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.