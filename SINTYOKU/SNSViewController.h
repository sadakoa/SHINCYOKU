//
//  SNSViewController.h
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/05.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "DCSocial.h"
#import "NADView.h"
//#define POST_TEXT     @"#進捗どうですか"
// #define POST_IMG_NAME  @"share.png"
// #define POST_URL      @""

@interface SNSViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, NADViewDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
    IBOutlet UIView *UIView;
    
}

// シェアの画像
@property (nonatomic) UIImage *ShareImage;
@property (nonatomic) UIImage *oni;
@property (weak, nonatomic) IBOutlet UIImageView *ShareLabelImage;

// facebook投稿
- (IBAction)postToFacebook:(id)sender;

// twitter投稿
- (IBAction)postToTwitter:(id)sender;
//
// ライン画像投稿
- (IBAction)postImageToLine:(id)sender;

// 広告枠
@property (nonatomic, retain) NADView * nadView;


@end
