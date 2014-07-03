//
//  ViewController.h
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/03.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
}

@property(nonatomic, assign) UIImage* originalImage;


// カメラを開く
-(IBAction)openCameraButton;

// フォトストリームを開く
-(IBAction)openStreamButton;

// ブラウザを開く
-(IBAction)openBrowserButton;

// テスト遷移
-(IBAction)testSegue;

@end
