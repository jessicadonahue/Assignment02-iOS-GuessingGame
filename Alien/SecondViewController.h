//
//  SecondViewController.h
//  Alien
//
//  Created by Jessica Donahue on 3/6/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *winOrNot;

@property (weak, nonatomic) IBOutlet UITextField *youGuessed;

@property BOOL win;

@end

@interface UIApplication (extended)
-(void) terminateWithSuccess;
@end
