//
//  ViewController.m
//  Kidoz_iOS_SDK_Sample_App
//
//  Created by Lev Firer on 12/02/2018.
//  Copyright © 2018 Kidoz. All rights reserved.
//

#import "ViewController.h"

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (strong, nonatomic) AVAudioPlayer *player;
@end


@implementation ViewController
@synthesize logText;
@synthesize player;

-(void)setBorder{
    
    [[self.logText layer] setBorderColor:[[UIColor orangeColor] CGColor]];
    [[self.logText layer] setBorderWidth:2.3];
    [[self.logText layer] setCornerRadius:15];
    
}

-(void)logOut:(NSString*)message withUITextView:(UITextView*)textView withTimestamp:(NSString*)timestamp{
    
    textView.text = [textView.text stringByAppendingString:timestamp];
    textView.text = [textView.text stringByAppendingString:@" - "];
    
    textView.text = [textView.text stringByAppendingString:message];
    textView.text = [textView.text stringByAppendingString:@"\n"];
    
    NSRange bottom = NSMakeRange(logText.text.length -1, 1);
    [textView scrollRangeToVisible:bottom];
    
}

/*     Kidoz SDK     */

-(void)onInitSuccess{
    [self logOut:@"SDK Initialized" withUITextView:logText withTimestamp:[self getTimestamp]];

    [self logOut:@"Interstitial initializing..." withUITextView:logText withTimestamp:[self getTimestamp]];
    [[KidozSDK instance] initializeInterstitialWithDelegate:self];
    
    [self logOut:@"Rewarded initializing..." withUITextView:logText withTimestamp:[self getTimestamp]];
    [[KidozSDK instance] initializeRewardedWithDelegate:self];
    
}

-(void)onInitError:(NSString *)error{
    [self logOut:@"SDK Init Error" withUITextView:logText withTimestamp:[self getTimestamp]];
}


/*     Interstitial     */


- (IBAction)loadInterstitial:(id)sender {
   
    if([[KidozSDK instance]isInterstitialInitialized]){
         [self logOut:@"Load Interstitial" withUITextView:logText withTimestamp:[self getTimestamp]];
        [[KidozSDK instance]loadInterstitial];
    }

    
}

- (IBAction)showInterstitial:(id)sender {
    [self logOut:@"Show Interstitial" withUITextView:logText withTimestamp:[self getTimestamp]];
    [[KidozSDK instance]showInterstitial];
}



-(void)interstitialDidInitialize{
    [self logOut:@"Interstitial Initialized" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)interstitialDidClose{
    if(player!= nil)
        [player setVolume:1.0];
    
    [self logOut:@"Interstitial Closed" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)interstitialDidOpen{
    if(player!= nil)
        [player setVolume:0.0];
    
    [self logOut:@"Interstitial Opened" withUITextView:logText withTimestamp:[self getTimestamp]];
}


-(void)interstitialIsReady{
    [self logOut:@"Interstitial Ready" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)interstitialDidPause{
    [self logOut:@"Interstitial Did Pause" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)interstitialDidResume{
    [self logOut:@"Interstitial Did Resume" withUITextView:logText withTimestamp:[self getTimestamp]];
}



-(void)interstitialReturnedWithNoOffers{
    [self logOut:@"Interstitial Returned With No Offers" withUITextView:logText withTimestamp:[self getTimestamp]];
}


-(void)interstitialDidReciveError:(NSString*)errorMessage{
    [self logOut:errorMessage withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialLoadFailed {
    
}


/*      --------       */

/*      Rewarded       */



- (IBAction)loadRewarded:(id)sender {
    
    if([[KidozSDK instance]isRewardedInitialized]){
        [self logOut:@"Load Rewarded" withUITextView:logText withTimestamp:[self getTimestamp]];

        [[KidozSDK instance]loadRewarded];
    }
   // [[KidozSDK instance]loadRewarded];
}

- (IBAction)showRewarded:(id)sender {
    [self logOut:@"Show Rewarded" withUITextView:logText withTimestamp:[self getTimestamp]];
    [[KidozSDK instance]showRewarded];
}

-(void)rewardedDidInitialize{
    [self logOut:@"Rewarded Initialized" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedDidClose{
    if(player!= nil)
        [player setVolume:1.0];
    
    [self logOut:@"Rewarded Closed" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedDidOpen{
    if(player!= nil)
        [player setVolume:0.0];
    
    [self logOut:@"Rewarded Opened" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedIsReady{
    [self logOut:@"Rewarded Ready" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedReturnedWithNoOffers{
    [self logOut:@"Rewarded Returned With No Offers" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedDidPause{
    [self logOut:@"Rewarded Did Pause" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedDidResume{
    [self logOut:@"Rewarded Did Resume" withUITextView:logText withTimestamp:[self getTimestamp]];
}


-(void)rewardedDidReciveError:(NSString*)errorMessage{
    [self logOut:errorMessage withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardReceived{
    [self logOut:@"Reward Received" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void)rewardedStarted{
    [self logOut:@"Rewarded Started" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)rewardedLoadFailed {
    
}


/*      --------       */

-(NSString*)getTimestamp{
    
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"HHmmssSSS"];
    //[objDateformat setDateFormat:@"yyyyMMdd'T'HHmmss.SSS"];
    NSString *timestamp = [objDateformat stringFromDate:[NSDate date]];
    
    return timestamp;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBorder];
    
    [self logOut:@"Initilalizing SDK..." withUITextView:logText withTimestamp:[self getTimestamp]];
    [[KidozSDK instance]initializeWithPublisherID:@"8" securityToken:@"QVBIh5K3tr1AxO4A1d4ZWx1YAe5567os" withDelegate:self];
    
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/WarmTutorialExplainer.mp3",[[NSBundle mainBundle] resourcePath]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    player.numberOfLoops = -1;
    [player play];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
