//
//  EditImageViewController.m
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/03.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import "EditImageViewController.h"

// 遷移先
#import "ImagePreviewViewController.h"

@interface EditImageViewController ()


@end

@implementation EditImageViewController

@synthesize arguments = _argumentsImage;

// イニシャライズ
@synthesize stampUIImageView = _stampUIImageView;


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
    
    self.navigationItem.title = @"編集";
    [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:236/255.0 green:112/255.0 blue:97/255.0 alpha:1];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};

    //　labelの色

    //[UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.000 green:0.549 blue:0.890 alpha:1.000];

    // Do any additional setup after loading the view.
    
    self->imageView.image = _argumentsImage;
    NSLog(@"imageViewにライブラリから選んだ画像をセット");
    
    // スタンプ画像は最初はセットしない
    currentStampView = nil;
    
    // 最初はスタンプモードではない
    _isPressStamp = NO;
        
}

// ==================================================================================

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ==================================================================================

-(IBAction)testSegue {
    [self performSegueWithIdentifier:@"StampImageCollection" sender:self];
}

// ==================================================================================

// ユーザによりViewへのタッチが開始したときに呼び出されるメソッド
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // タッチされた座標を取得
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:imageView];
    
    // スタンプ画像を取得、貼り付ける
    currentStampView = [[UIImageView alloc]
                        initWithFrame:CGRectMake(point.x-5, point.y-5, 280, 130)];
    currentStampView.image = [UIImage imageNamed:@"test01.png"];
    [self.view addSubview:currentStampView];
    
    // スタンプモード起動
     _isPressStamp = YES;
}

// ==================================================================================

// ユーザがドラッグしたときに呼び出されるメソッド
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // タッチされた座標を取得
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:imageView];
    
    // スタンプの位置を変更する
    if (_isPressStamp) {
        currentStampView.frame = CGRectMake(point.x-5, point.y-5, 280, 130);
    }
}

// ==================================================================================

// ユーザがタッチを終了したときに呼び出されるメソッド
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // スタンプモード終了（スタンプを確定する）
    _isPressStamp = NO;
}

// ==================================================================================

// ユーザーが他のアクションで完全に終了した時に呼び出されるメソッド
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // スタンプモード終了（スタンプを確定する）
    _isPressStamp = NO;
    
}

// ==================================================================================

// 領域を指定して画像を切り抜く
-(UIImage *)captureImage
{
    // 描画領域の設定
    CGSize size = CGSizeMake(imageView.frame.size.width , imageView.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    NSLog(@"きてるか");
    
    // グラフィックスコンテキスト取得
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // コンテキストの位置を切り取り開始位置に合わせる
    CGPoint point = imageView.frame.origin;
    CGAffineTransform affineMoveLeftTop
    = CGAffineTransformMakeTranslation(
                                       -(int)point.x ,
                                       -(int)point.y );
    CGContextConcatCTM(context , affineMoveLeftTop );
    
    // viewから切り取る
    [(CALayer*)self.view.layer renderInContext:context];
    
    // 切り取った内容をUIImageとして取得
    UIImage *cnvImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // コンテキストの破棄
    UIGraphicsEndImageContext();
    
    return cnvImg;
}

// ==================================================================================

-(IBAction)test {
    // 画像を取得
    UIImage *saveImage = [self captureImage];
    
    // カメラロールに保存
   if (saveImage != nil) {
       UIImageWriteToSavedPhotosAlbum(saveImage,
                                      self,
                                       @selector(targetImage:didFinishSavingWithError:contextInfo:),
            
                                      NULL);
   }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"ImagePreviewSegue"] ) {
        ImagePreviewViewController *ImagePreviewViewController = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
        UIImage *saveImage = [self captureImage];
        
        _editPreviewImage = saveImage;
        ImagePreviewViewController.PreviewImage = _editPreviewImage;
    }
}

// ==================================================================================

// 画像の保存完了時に呼ばれるメソッド
- (void)targetImage:(UIImage *)image didFinishSavingWithError:(NSError *)error
        contextInfo:(void *)context
{
    NSString *message = [NSString string];
    if (error) {
        // 保存失敗時の処理
        message = @"保存に失敗した。";
    } else {
        // 保存成功時の処理
        message = @"保存に成功しました";
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
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
