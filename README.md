
# KIDOZ iOS SDK Sample App

**KIDOZ iOS SDK version 1.0.9**

**KIDOZ SDK and the sample App are compatible with iOS 10.3 and above.**

**KIDOZ SDK is written in Objective C.**



This iOS application project provides an example of the KIDOZ SDK integration.

The example application contains the following creative tools:
* KIDOZ Interstitial view  
* KIDOZ Rewarded view

# Running the sample app
1.  Download / Clone the KidozSDKSampleApp
2.  Launch  `Xcode`, click  `File`  –>  `Open`, navigate to downloaded project, select the Xcode project file and press  `OK`.

# KIDOZ SDK - Getting Started
#### Adding the SDK

1.  Navigate to the downloaded KidozSDKSampleApp folder or open KidozSDKSampleApp in the Xcode and find the libKidozSDK.a and the KidozSDK.h files.
2.  Drag and drop the libKidozSDK.a and the KidozSDK.h to your project.
<a href="url"><img src="https://cdn3.kidoz.net/docs/ios/KidozSdkSampleApp1.png" align="center"  ></a>
3. Select your target in the project navigator , select the “Build Settings” tab , search for “Other Linker Flags” , click on the “+” and type -ObjC  `Other Linker Flags -ObjC`  .
<a href="url"><img src="https://cdn3.kidoz.net/docs/ios/KidozSdkSampleApp3.png" align="center"  ></a>
4. In the  `info.plist`  add  `NSAppTransportSecurity`  exception with  `NSAllowsArbitraryLoads`exception  
`<key>NSAppTransportSecurity</key>`  
`<dict>`  
`<key>NSAllowsArbitraryLoads</key>`  
`<true/>`  
`</dict>`
<a href="url"><img src="https://cdn3.kidoz.net/docs/ios/KidozSdkSampleApp2.png" align="center"  ></a>
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
`Intersitial`  is a full screen widget which is design for showing full screen advertisement .  
1. In the selected view controller , conform to the  `KDZInterstitialDelegate`  protocol and implement all delegate methods:  
`ViewController.h`  
`@interface ViewController : UIViewController<KDZInterstitialDelegate>`  
`ViewController.m`  
`-(void)interstitialDidInitialize {};`  
`-(void)interstitialDidClose {};`  
`-(void)interstitialDidOpen {};`  
`-(void)interstitialIsReady {};`  
`-(void)interstitialReturnedWithNoOffers {};`  
`-(void)interstitialDidPause {};`  
`-(void)interstitialDidResume {};`  
`-(void)interstitialLoadFailed {};`  
`-(void)interstitialDidReciveError:(NSString*)errorMessage {};`.  
2. Init interstitial:  
`[[KidozSDK instance]initializeInterstitialWithDelegate:self];`  
3. Load interstitial:  
`[[KidozSDK instance]loadInterstitial];`  
4. Show interstitial:  
`[[KidozSDK instance]showInterstitial];`  
5. To check interstitial state :  
`BOOL initislized = [[KidozSDK instance]isInterstitialInitialized];`  
`BOOL ready = [[KidozSDK instance]isInterstitialReady];`

** Note: you must pause your application workflow and/or audio track before opening the rewarded in `interstitialDidOpen` callback and resume it in `interstitialDidClose` and `interstitialDidReciveError` callbacks.

# KIDOZ Rewarded 
`Rewarded`  is a full screen widget which is design for showing full screen advertisement .  
1. In the selected view controller , conform to the  `KDZRewardedDelegate`  protocol and implement all delegate methods:  
`ViewController.h`  
`@interface ViewController : UIViewController<KDZRewardedDelegate>`  
`ViewController.m`  
`-(void)rewardedDidInitialize {};`  
`-(void)rewardedDidClose {};`  
`-(void)rewardedDidOpen {};`  
`-(void)rewardedIsReady {};`  
`-(void)rewardedReturnedWithNoOffers {};`  
`-(void)rewardedDidPause {};`  
`-(void)rewardedDidResume {};`  
`-(void)rewardedLoadFailed {};`  
`-(void)rewardedDidReciveError:(NSString*)errorMessage {};`  
`-(void)rewardReceived {};`  
`-(void)rewardedStarted {};`  
2. Init rewarded:  
`[[KidozSDK instance]initializeRewardedWithDelegate:self];`  
3. Load interstitial:  
`[[KidozSDK instance]loadRewarded];`  
4. Show interstitial:  
`[[KidozSDK instance]showRewarded];`  
5. To check interstitial state :  
`BOOL initislized = [[KidozSDK instance]isRewardedInitialized];`  
`BOOL ready = [[KidozSDK instance]isRewardedReady];`

** Note: you must pause your application workflow and/or audio track before opening the rewarded in `rewardedDidOpen` callback and resume it in `rewardedDidClose` and `rewardedDidReciveError` callbacks.
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


