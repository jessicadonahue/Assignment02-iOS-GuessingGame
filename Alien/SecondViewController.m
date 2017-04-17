//
//  SecondViewController.m
//  Alien
//
//  Created by Jessica Donahue on 3/6/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import <AudioToolbox/AudioToolbox.h>


@interface SecondViewController ()

@property (strong, nonatomic) NSString *randCardNum;
@property (strong, nonatomic) NSString *randCardSuit;

@property (strong, nonatomic) NSString *guessCardNum;
@property (strong, nonatomic) NSString *guessCardSuit;
@property (strong, nonatomic) IBOutlet UIImageView *alienImage;

@property (weak, nonatomic) IBOutlet UITextField *numGuessesField;

@property (assign, nonatomic) SystemSoundID winSoundID;

@property int numGuesses;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _alienImage= [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"alien.png"]];
    _alienImage.frame = CGRectMake(60, 220, 250, 210);
    [self.view addSubview:_alienImage];
    
    _numGuesses = 0;


}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    _numGuesses++;
    NSString * guessString = [[NSString alloc] initWithFormat: @"%d", _numGuesses];
    self.numGuessesField.text = guessString;
    
    //IF the player won play the sound here
    if (_win == YES) {
        
        [self performSelector:@selector(playWinSound)
                   withObject:nil
                   afterDelay:.5];

        double delayInSeconds = 5.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [[UIApplication sharedApplication] terminateWithSuccess];
            
        });
        
    }

}




- (void)playWinSound {
    if (_winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win"
                                                  withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,
                                         &_winSoundID);
    }
    AudioServicesPlaySystemSound(_winSoundID);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
