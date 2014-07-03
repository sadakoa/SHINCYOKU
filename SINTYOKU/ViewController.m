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


@interface ViewController ()

@end

@implementation ViewController

// ==================================================================================

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    
    
    _argumentsImage = savedImage;

    
    // 選択された画像を表示
    //imageView.image = originalImage;
    
    // 次の画面に渡す引数をセット
    // _testImage = originalImage;
    

    
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
       EditImageViewController.arguments = _argumentsImage;
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
