//
//  ImagePreviewViewController.m
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/04.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import "ImagePreviewViewController.h"

@interface ImagePreviewViewController ()

@end

@implementation ImagePreviewViewController

@synthesize PreviewImage = _PreviewSaveImage;

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
    self.navigationItem.title = @"Preview";
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.000 green:0.549 blue:0.890 alpha:1.000];
    
    self->imageView.image = _PreviewSaveImage;
    NSLog(@"プレビュー画面");
}

// ==================================================================================

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ==================================================================================

-(IBAction)saveImage {
    
    // このErrorは気にしなくていい
    UIImage *image = _PreviewSaveImage;
    // カメラロールに保存する
    if (_PreviewSaveImage != nil) {
        UIImageWriteToSavedPhotosAlbum(_PreviewSaveImage,
                                       self,
                                       @selector(targetImage:didFinishSavingWithError:contextInfo:),
                                       
                                       NULL);
    }
    
}

// ==================================================================================

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
    
    // 画面遷移
    [self performSegueWithIdentifier:@"SNSModalSegue" sender:self];
}


// ==================================================================================

// ==================================================================================

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
