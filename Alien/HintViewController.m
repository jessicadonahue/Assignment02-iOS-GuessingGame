//
//  HintViewController.m
//  Alien
//
//  Created by Jessica Donahue on 3/6/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "HintViewController.h"

@interface HintViewController ()

@end

@implementation HintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)displayAnswer:(id)sender {
    
    self.answer.text = self.answerMessage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
