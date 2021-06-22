**KIDOZ iOS SDK version 8.9.0**

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

 `  Please note - This documentation is intended for Objective C developers, for Swift documentation please use  `  [this link](SWIFT.md).
 
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
5. Add the #import <UIKit/UIKit.h> and #import ”KidozSDK.h” to ViewController or appDelegate.
6. Conform to the  `KDZInitDelegate`  protocol and implement SDK delegate methods:  
    `ViewController.h`  
    `@interface ViewController : UIViewController<KDZInitDelegate>`  
    `ViewController.m`  
    `-(void)onInitSuccess {}`  
    `-(void)onInitError:(NSString *)error {}`
7. Init the SDK:
`[[KidozSDK instance]initializeWithPublisherID:<enter your publisher ID> securityToken:<enter your security Token> withDelegate:self];`
8.  To check SDK state :  
    `BOOL initislized = [[KidozSDK instance]isSDKInitialized];`



# KIDOZ Interstitial 
`Intersitial`  is a full screen widget which is designed for showing full screen advertisement.  
1. In the selected view controller, conform to the  `KDZInterstitialDelegate`  protocol and implement all delegate methods:  
```
ViewController.h  
@interface ViewController : UIViewController<KDZInterstitialDelegate> 
ViewController.m 
-(void)interstitialDidInitialize {};  
-(void)interstitialDidClose {};  
-(void)interstitialDidOpen {};  
-(void)interstitialIsReady {};  
-(void)interstitialReturnedWithNoOffers {};  
-(void)interstitialDidPause {};  
-(void)interstitialDidResume {};  
-(void)interstitialLoadFailed {};  
-(void)interstitialDidReciveError:(NSString*)errorMessage {};
-(void)interstitialLeftApplication{};
```

* To check Interstitial state :  
```
BOOL initislized = [[KidozSDK instance]isInterstitialInitialized];
BOOL ready = [[KidozSDK instance]isInterstitialReady];
```
  2. Init Interstitial: 
```
if([[KidozSDK instance]isSDKInitialized])
   [[KidozSDK instance]initializeInterstitialWithDelegate:self];
```  
3. Load Interstitial:  
```
if([[KidozSDK instance]isInterstitialInitialized])
   [[KidozSDK instance]loadInterstitial];
```

4. Show Interstitial:  
```
if([[KidozSDK instance]isInterstitialReady])
   [[KidozSDK instance]showInterstitial];
```

**Kidoz iOS Interstitial best practices**
- The preferred timing to show Interstitial Ads : Before the game ends, between game levels, after completing a game level .   
- Some Interstitial Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game while the Interstitial is displayed. This can be achieved by using `-interstitialDidOpen:` and `-interstitialDidClose:` callbacks:
```
-(void)interstitialDidOpen {
// mute/pause background sounds
// pause your game 
}

-(void)interstitialDidClose {
// unmute/resume background sounds
// resume your game 
}
```
# KIDOZ Rewarded 
`Rewarded`  is a full screen widget which is designed for showing full screen advertisement.  
1. In the selected view controller , conform to the  `KDZRewardedDelegate`  protocol and implement all delegate methods:  
```
ViewController.h  
@interface ViewController : UIViewController<KDZRewardedDelegate> 
ViewController.m
-(void)rewardedDidInitialize {};
-(void)rewardedDidClose {};  
-(void)rewardedDidOpen {}; 
-(void)rewardedIsReady {};  
-(void)rewardedReturnedWithNoOffers {};  
-(void)rewardedDidPause {};  
-(void)rewardedDidResume {};  
-(void)rewardedLoadFailed {};
-(void)rewardedDidReciveError:(NSString*)errorMessage {};  
-(void)rewardReceived {}; 
-(void)rewardedStarted {};
-(void)rewardedLeftApplication{};
```
* To check rewarded state :  
```
BOOL initislized = [[KidozSDK instance]isRewardedInitialized];
BOOL ready = [[KidozSDK instance]isRewardedReady];
```
2. Init rewarded:  
```
if([[KidozSDK instance]isSDKInitialized])
   [[KidozSDK instance]initializeRewardedWithDelegate:self];
```
3. Load rewarded:  
```
if([[KidozSDK instance]isRewardedInitialized])
   [[KidozSDK instance]loadRewarded];
```
4. Show rewarded:  
```
if([[KidozSDK instance]isRewardedReady])
   [[KidozSDK instance]showRewarded];
```  

**Kidoz iOS Rewarded best practices**
- The preferred timing to show Rewarded Ads : Based on the implementation of rewarded logics in your game .   
- Some Rewarded Ads may contain video with sound. In order to maximise user experience, it is important to mute or pause game background sounds and pause the game flow while the Rewarded is displayed. This can be achieved by using `-rewardedDidOpen:` and `-rewardedDidClose:` callbacks:
```
-(void)rewardedDidOpen {
//mute/pause background sounds
//pause your game 
}

-(void)rewardedDidClose {
//unmute/resume background sounds
//resume your game 
}
```
# KIDOZ Banner

1. In the selected view controller , conform to the  `KDZBannerDelegate`  protocol and implement all delegate methods:  

```
ViewController.h  
@interface ViewController : UIViewController<KDZBannerDelegate> 
ViewController.m
-(void)bannerDidInitialize{};
-(void)bannerDidClose{};
-(void)bannerDidOpen{};
-(void)bannerIsReady{};
-(void)bannerReturnedWithNoOffers;
-(void)bannerLoadFailed{};
-(void)bannerDidReciveError:(NSString*)errorMessage{};
-(void)bannerLeftApplication{};
```

* To check banner state :  
```
BOOL initislized = [[KidozSDK instance]isBannerInitialized];
BOOL ready = [[KidozSDK instance]isBannerReady];
```

2. Init banner:  
The banner can be placed on one of six sides of the  screen with BANNER_POSITION - `TOP_CENTER`, `BOTTOM_CENTER` ,`TOP_LEFT` ,`TOP_RIGHT` ,`BOTTOM_LEFT` ,`BOTTOM_RIGHT`.

and initialized with: initializeBannerWithDelegate:(id<KDZBannerDelegate>)delegate withViewController:(UIViewController *)viewController
```
if([[KidozSDK instance]isSDKInitialized]){
   [[KidozSDK instance]initializeBannerWithDelegate:self withViewController:self];
   [[KidozSDK instance]setBannerPosition:BOTTOM_CENTER]
}
```
Or The Banner can be initialized with custom UIView and positioned more flexibly with constraints with this method:  (void)initializeBannerWithDelegate:(id<KDZBannerDelegate>)delegate withView:(UIView*)view:

``` 
CGFloat BANNER_WIDTH = 320;
CGFloat BANNER_HEIGHT = 50;

mBanner = [[UIView alloc] initWithFrame:CGRectMake(0,0,BANNER_WIDTH,BANNER_HEIGHT)];
[self.view addSubview:mBanner];
mBanner.translatesAutoresizingMaskIntoConstraints = NO;
[self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:mBanner
              attribute:NSLayoutAttributeBottom
              relatedBy:NSLayoutRelationEqual
              toItem:self.bottomLayoutGuide
              attribute:NSLayoutAttributeTop
              multiplier:1
              constant:0],        
[NSLayoutConstraint constraintWithItem:mBanner
              attribute:NSLayoutAttributeCenterX
              relatedBy:NSLayoutRelationEqual
              toItem:self.view
              attribute:NSLayoutAttributeCenterX
              multiplier:1
              constant:0],
[NSLayoutConstraint  constraintWithItem:mBanner
              attribute:NSLayoutAttributeHeight
              relatedBy:NSLayoutRelationEqual
              toItem:nil
              attribute:NSLayoutAttributeNotAnAttribute
              multiplier:0
              constant:BANNER_HEIGHT],
[NSLayoutConstraint  constraintWithItem:mBanner
              attribute:NSLayoutAttributeWidth
              relatedBy:NSLayoutRelationEqual
              toItem:nil
              attribute:NSLayoutAttributeNotAnAttribute
              multiplier:0
              constant:BANNER_WIDTH]]];

[self.view bringSubviewToFront:mBanner];

[[KidozSDK instance]initializeBannerWithDelegate:self withView:mBanner];

}
``` 
3. Load banner :  
```
if([[KidozSDK instance]isBannerInitialized])
   [[KidozSDK instance]loadBanner];
```
4. Show banner:  
```
if([[KidozSDK instance]isBannerReady])
   [[KidozSDK instance]showBanner];
```  

5. Hide banner:  
```
   [[KidozSDK instance]hideBanner];
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