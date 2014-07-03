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
}

@end
