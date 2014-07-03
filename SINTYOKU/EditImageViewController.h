//
//  EditImageViewController.h
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/03.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditImageViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
    
    //前の画面から受け取る引数
    NSString *_arguments;
}

// ライブラリから選んだ画像の変数を参照したい
//@property(nonatomic, assign) UIImage* SelectImage;
//@property(nonatomic, weak) UIImageView *imageView;

@property (nonatomic) NSString *arguments;
@property (weak, nonatomic) IBOutlet UILabel *argumentsLabel;


@end
