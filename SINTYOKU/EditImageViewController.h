//
//  EditImageViewController.h
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/03.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditImageViewController : UIViewController\
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
    IBOutlet UIView *UIView;
    
    //前の画面から受け取る引数 要らないかも
    // UIImage *_arguments;
    
    UIImageView *currentStampView;  // 貼り付け中のスタンプ画像
    BOOL _isPressStamp;  // スタンプ貼り付け中かどうか
    
    
}

-(IBAction)test;



// ライブラリから選んだ画像の変数を参照したい
//@property(nonatomic, assign) UIImage* SelectImage;
//@property(nonatomic, weak) UIImageView *imageView;

@property (nonatomic) UIImage *arguments;
@property (nonatomic) UIImage *editPreviewImage;

// 画面に表示するためのもの
 @property (weak, nonatomic) IBOutlet UIImageView *argumentsLabelImage;


@end
