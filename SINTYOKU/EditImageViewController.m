//
//  EditImageViewController.m
//  SINTYOKU
//
//  Created by sadakoa on 2014/07/03.
//  Copyright (c) 2014年 sadakoa. All rights reserved.
//

#import "EditImageViewController.h"

@interface EditImageViewController ()

@end

@implementation EditImageViewController

//@synthesize SelectImage = _testImage;
@synthesize arguments = _arguments;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //imageView.image = _testImage;
     self.argumentsLabel.text = _arguments;
    NSLog(@"imageViewにライブラリから選んだ画像をセット");
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
