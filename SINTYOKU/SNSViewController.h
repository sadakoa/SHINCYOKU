//
//  SNSViewController.h
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/05.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import "DCSocial.h"

@interface SNSViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    IBOutlet UILabel *label;
    IBOutlet UIImageView *imageView;
    IBOutlet UIView *UIView;
    
}


@end
