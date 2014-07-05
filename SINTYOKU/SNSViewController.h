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

#define POST_TEXT     @"#進捗どうですか"
 #define POST_IMG_NAME   @"image.png"
 #define POST_URL      @""

@interface SNSViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
    IBOutlet UIView *UIView;
    
}

// シェアの画像
@property (nonatomic) UIImage *ShareImage;
@property (weak, nonatomic) IBOutlet UIImageView *ShareLabelImage;

// facebook投稿
- (IBAction)postToFacebook:(id)sender;

// twitter投稿
- (IBAction)postToTwitter:(id)sender;

// ライン画像投稿
- (IBAction)postImageToLine:(id)sender;

// メール投稿(及びTwitterとFacebook)
- (IBAction)share:(id)sender;


@end
