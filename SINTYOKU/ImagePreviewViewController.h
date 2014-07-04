//
//  ImagePreviewViewController.h
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/04.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePreviewViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
    IBOutlet UIView *UIView;
    
    //前の画面から受け取る引数
    UIImage *_arguments;
    
    UIImageView *currentStampView;  // 貼り付け中のスタンプ画像
    BOOL _isPressStamp;  // スタンプ貼り付け中かどうか
}

@property (nonatomic) UIImage *arguments;
@property (weak, nonatomic) IBOutlet UIImageView *argumentsLabelImage;

@end
