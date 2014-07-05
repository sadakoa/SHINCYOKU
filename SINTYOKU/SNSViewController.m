//
//  SNSViewController.m
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/05.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <Social/Social.h>
#import "SNSViewController.h"

@interface SNSViewController ()

@end

@implementation SNSViewController

@synthesize ShareImage = _ShareImage;

// ==================================================================================

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// ==================================================================================

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self->imageView.image = _ShareImage;

    // _shareImageをjpgファイルに変換してSNSシェアに渡す
}


// ==================================================================================

// Facebookへ投稿
- (IBAction)postToFacebook:(id)sender
{
    [DCSocial postToFacebook:self text:POST_TEXT imageName:POST_IMG_NAME url:POST_URL];
}

// ==================================================================================

// Twitterで投稿
- (IBAction)postToTwitter:(id)sender
{
    [DCSocial postToTwitter:self text:POST_TEXT imageName:POST_IMG_NAME url:POST_URL];
}

// ==================================================================================

// LINEへ JPEG画像投稿
- (IBAction)postImageToLine:(id)sender
{
    typedef NS_ENUM(NSUInteger, imageExtId) {
        JPEG = 0,
        PNG  = 1
    };
    
    [DCSocial postImageToLine:POST_IMG_NAME imageType:JPEG];
}

// ==================================================================================

// メール/Twitter/Facebook共有
- (IBAction)share:(id)sender
{
    [DCSocial socialShare:self shareText:POST_TEXT shareImage:[UIImage imageNamed:POST_IMG_NAME]];
}

// ==================================================================================

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ==================================================================================



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
