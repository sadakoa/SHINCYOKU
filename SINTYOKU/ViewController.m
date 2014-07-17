//
//  ViewController.m
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/03.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import "ViewController.h"

//遷移先ビューのクラスをインポート
#import "EditImageViewController.h"
#import <QuartzCore/QuartzCore.h>

static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";



@interface ViewController () {
    UIView *rootView;
}
@end

@implementation ViewController

// ==================================================================================

- (void)viewDidLoad
{
    [super viewDidLoad];
    rootView = self.navigationController.view;
	// Do any additional setup after loading the view, typically from a nib.
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    // self.navigationItem.title = @"進捗!!";
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SINTYOKU.png"]];
    self.navigationItem.titleView = titleImageView;
    self.navigationController.navigationBar.tintColor =
    [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:236/255.0 green:112/255.0 blue:97/255.0 alpha:1];

}

// ==================================================================================

- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    
    [intro showInView:rootView animateDuration:0.3];
}

// ==================================================================================

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ==================================================================================

-(IBAction)openCameraButton {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // UIImagePickerControllerを作成し new = alloc + init
        UIImagePickerController* imagePicker = [UIImagePickerController new];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = YES;
        imagePicker.delegate = self;
        
        //カメラライブラリを開く
        [self presentViewController:imagePicker animated:YES
                         completion:^{
                             NSLog(@"カメラを開く。");
                         }];
    }
}

// ==================================================================================

-(IBAction)openStreamButton {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        // UIImagePickerControllerを作成し new = alloc + init
        UIImagePickerController* imagePicker = [UIImagePickerController new];
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.allowsEditing = YES;
        imagePicker.delegate = self;
        
        
        //フォトライブラリを開く
        [self presentViewController:imagePicker animated:YES
                         completion:^{
                             NSLog(@"ストリームを開いた");
                         }];
    }
}

// ==================================================================================

-(IBAction)openBrowserButton {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.google.co.jp/search?q=%E3%81%8D%E3%82%93%E3%81%84%E3%82%8D%E3%83%A2%E3%82%B6%E3%82%A4%E3%82%AF+%E3%82%B7%E3%83%B3%E3%83%81%E3%83%A7%E3%82%AF&lr=lang_ja&safe=off&hl=ja&tbs=lr:lang_1ja&source=lnms&tbm=isch&sa=X&ei=oQywU_OfC4bnkAXl64D4Dg&ved=0CAgQ_AUoAQ&biw=1680&bih=952#hl=ja&lr=lang_ja&q=%E3%81%8D%E3%82%93%E3%81%84%E3%82%8D%E3%83%A2%E3%82%B6%E3%82%A4%E3%82%AF%E3%80%80%E9%80%B2%E6%8D%97&safe=off&tbm=isch&tbs=lr:lang_1ja"]];
    
}

// ==================================================================================

// 撮影後、もしくは選択後に行われる処理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // オリジナル画像
    UIImage* originalImage = (UIImage *) [info objectForKeyedSubscript:UIImagePickerControllerOriginalImage];
    
    // 編集画像
    // ここは別にSavedImageじゃなくてoriginalImageでも問題ない！
    
    UIImage* editedImage = (UIImage *) [info objectForKeyedSubscript:UIImagePickerControllerEditedImage];
    
   UIImage* savedImage;
   if (editedImage) {
       savedImage = editedImage;
   } else {
        savedImage = originalImage;
   }
    
    
    _beforeStampEditImage = savedImage;

    
    // 選択された画像を表示
    //imageView.image = originalImage;
    
    //カメラロールに保存する
    // UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // 編集画面に遷移
    [self performSegueWithIdentifier:@"EditImageViewSegue" sender:self];
    
    // 開いているカメラ、ストリームライブラリを閉じる
    [self dismissViewControllerAnimated:YES completion:^ {}];

}

// ==================================================================================


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"EditImageViewSegue"] ) {
        EditImageViewController *EditImageViewController = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
       EditImageViewController.arguments = _beforeStampEditImage;
    }
}

// ==================================================================================

// カメラロールに保存する
-(void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo {
    
    // 保存したか、失敗したか
    NSString *message = @"画像を保存しました！";
    if (error) message = @"画像の保存に失敗しました・・・";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @""
                                                    message: message
                                                   delegate: nil
                                          cancelButtonTitle: @"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

// ==================================================================================

-(IBAction)testSegue {
    [self performSegueWithIdentifier:@"EditImageViewSegue" sender:self];
}

@end
