//
//  ViewController.h
//  Kidoz_iOS_SDK_Sample_App
//
//  Created by Lev Firer on 12/02/2018.
//  Copyright © 2018 Kidoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KidozSDK.h"

@interface ViewController : UIViewController<KDZInitDelegate,KDZInterstitialDelegate,KDZRewardedDelegate,KDZBannerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *logText;

@end

