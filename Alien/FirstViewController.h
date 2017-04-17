//
//  FirstViewController.h
//  Alien
//
//  Created by Jessica Donahue on 3/6/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "HintViewController.h"

@interface FirstViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate,UITabBarControllerDelegate>

@property(strong, nonatomic) SecondViewController *svc;
@property(strong, nonatomic) HintViewController *hvc;

@end

