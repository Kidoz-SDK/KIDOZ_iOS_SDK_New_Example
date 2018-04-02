//
//  KidozSDK.h
//  KidozSDK
//
//  Created by Lev Firer on 14/11/2017.
//  Copyright © 2017 kidoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol KDZInterstitialDelegate <NSObject>
-(void)interstitialDidInitialize;
-(void)interstitialDidClose;
-(void)interstitialDidOpen;
-(void)interstitialIsReady;
-(void)interstitialReturnedWithNoOffers;
-(void)interstitialDidPause;
-(void)interstitialDidResume;
-(void)interstitialLoadFailed;
-(void)interstitialDidReciveError:(NSString*)errorMessage;
@end

@protocol KDZRewardedDelegate <NSObject>
-(void)rewardedDidInitialize;
-(void)rewardedDidClose;
-(void)rewardedDidOpen;
-(void)rewardedIsReady;
-(void)rewardedReturnedWithNoOffers;
-(void)rewardedDidPause;
-(void)rewardedDidResume;
-(void)rewardedLoadFailed;
-(void)rewardedDidReciveError:(NSString*)errorMessage;
-(void)rewardReceived;
-(void)rewardedStarted;
@end

@protocol KDZInitDelegate <NSObject>

@optional
-(void)onInitSuccess;
-(void)onInitError:(NSString *)error;

@end

@interface KidozSDK : NSObject

+ (id)instance;

- (void)initializeWithPublisherID:(NSString *)publisherID securityToken:(NSString *)securityToken withDelegate:(id<KDZInitDelegate>)delegate;
- (void)initializeWithPublisherID:(NSString *)publisherID securityToken:(NSString *)securityToken;

- (void)initializeInterstitialWithDelegate:(id<KDZInterstitialDelegate>)delegate;

- (void)loadInterstitial;
- (void)showInterstitial;


- (void)initializeRewardedWithDelegate:(id<KDZRewardedDelegate>)delegate;

- (void)loadRewarded;
- (void)showRewarded;

- (BOOL)isInterstitialInitialized;
- (BOOL)isInterstitialReady;


- (BOOL)isRewardedInitialized;
- (BOOL)isRewardedReady;

- (BOOL)isSDKInitialized;



@end



