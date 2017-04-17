//
//  FirstViewController.m
//  Alien
//
//  Created by Jessica Donahue on 3/6/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "FirstViewController.h"


#define cardNumComponent 0
#define cardSuitComponent   1

@class SecondViewController;

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *cardPicker;
@property (strong, nonatomic) NSArray *cardNums;
@property (strong, nonatomic) NSArray *cardSuits;

@property (strong, nonatomic) NSString *randCardNum;
@property (strong, nonatomic) NSString *randCardSuit;

@property (strong, nonatomic) IBOutlet UIImageView *alienImage;



@end


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.delegate = self;
    
    self.cardNums = @[@"The Two of", @"The Three of", @"The Four of", @"The Five of", @"The Six of",
                      @"The Seven of", @"The Eight of", @"The Nine of", @"The Ten of", @"The Jack of", @"The Queen of", @"The King of", @"The Ace of",];
    self.cardSuits = @[@"Clubs", @"Diamonds", @"Hearts",
                        @"Spades"];
    
    _alienImage= [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"alien.png"]];
    _alienImage.frame = CGRectMake(60, 220, 250, 210);
    [self.view addSubview:_alienImage];
    
    // Pick a random card - one from each array
    srandom(time(NULL));
    int numIndex = random() % 13;
    int suitIndex = random() % 4;
    
    _randCardNum = _cardNums[numIndex];
    _randCardSuit = _cardSuits[suitIndex];
    
    
    // Now set the random card property of the second view controller
    // so it check to see 
    FirstViewController *secondView= (FirstViewController*)  [self.tabBarController.viewControllers objectAtIndex:1];
    secondView.randCardNum = _randCardNum;
    secondView.randCardSuit = _randCardSuit;
    
    
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    self.svc = (SecondViewController *) [tabBarController.viewControllers objectAtIndex:1];

    
    //lets send the value of the picker over to the second view controller
    NSInteger numRow = [_cardPicker selectedRowInComponent:
                            cardNumComponent];
    NSInteger suitRow = [_cardPicker selectedRowInComponent:
                          cardSuitComponent];
    NSString *pickedNum = self.cardNums[numRow];
    NSString *pickedSuit = self.cardSuits[suitRow];
    NSString *message = [[NSString alloc] initWithFormat:
                         @"%@ %@!", pickedNum, pickedSuit];
    
    self.svc.youGuessed.text = message;
    
    if (pickedNum == _randCardNum && pickedSuit == _randCardSuit) {
        // then the player guessed the random card
        // write the message you won!
        
        NSString *won = @"You won!";
        self.svc.winOrNot.text = won;
        self.svc.win = YES;
        
    }
    else {
        // they didnt guess the card
        NSString *wrong = @"Guess again!";
        self.svc.winOrNot.text = wrong;
    }
    
    // if the user clicks the hint view controller --> tell them the answer
    self.hvc = (HintViewController *) [tabBarController.viewControllers objectAtIndex:2];
    
    NSString *randMessage = [[NSString alloc] initWithFormat:
                             @"%@ %@!", _randCardNum, _randCardSuit];
    //self.hvc.answer.text = randMessage;
    self.hvc.answerMessage = randMessage;
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2; }

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == cardNumComponent) {
        return [self.cardNums count];
    } else {
        return [self.cardSuits count];
    } }
#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if (component == cardNumComponent) {
        return self.cardNums[row];
    } else {
        return self.cardSuits[row];
    } }


@end
