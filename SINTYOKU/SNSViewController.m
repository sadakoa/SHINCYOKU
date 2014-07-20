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

// ここから
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self->imageView.image = _ShareImage;

        // share imgを作らなければいけない
   

    // _shareImageをjpgファイルに変換してSNSシェアに渡す
}


// ==================================================================================

// Facebookへ投稿
- (IBAction)postToFacebook:(id)sender
{
//    [DCSocial postToFacebook:self text:POST_TEXT imageName:POST_IMG_NAME url:POST_URL];
    SLComposeViewController *vc = [SLComposeViewController
                                   composeViewControllerForServiceType:SLServiceTypeFacebook];
    [vc setInitialText:@"進捗どうですか"];
    [vc addImage:_ShareImage];
    [vc addURL:[NSURL URLWithString:@""]];
    [self presentViewController:vc animated:YES completion:nil];
}

// ==================================================================================
//
//// Twitterで投稿
- (IBAction)postToTwitter:(id)sender
{
    //[DCSocial postToTwitter:self text:POST_TEXT imageName:POST_IMG_NAME url:POST_URL];
        SLComposeViewController *vc = [SLComposeViewController
                                       composeViewControllerForServiceType:SLServiceTypeTwitter];
        [vc setInitialText:@"#進捗どうですか"];
        [vc addImage:_ShareImage];
        [vc addURL:[NSURL URLWithString:@""]];
        [self presentViewController:vc animated:YES completion:nil];
    
}
//
//// ==================================================================================
//
//// LINEへ JPEG画像投稿
- (IBAction)postImageToLine:(id)sender
{
    // この例ではUIImageクラスの_resultImageを送る
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setData:UIImagePNGRepresentation(_ShareImage)
     　　forPasteboardType:@"public.png"];
    
       // pasteboardを使ってパスを生成
    NSString *LineUrlString = [NSString stringWithFormat:@"line://msg/image/%@",
                               　　　　　　　　　　　　　　　pasteboard.name];
    // URLスキームを使ってLINEを起動
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LineUrlString]];
    
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
