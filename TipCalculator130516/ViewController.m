//
//  ViewController.m
//  TipCalculator130516
//
//  Created by Yasmin Ahmad on 2016-05-13.
//  Copyright © 2016 YasminA. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>


@interface ViewController ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UITextField *tipAmount;
@property (weak, nonatomic) IBOutlet UITextField *totalAmount;
@property (strong, nonatomic) IBOutlet UIButton *pressCalc;
@property (strong, nonatomic) IBOutlet UIButton *selectTip;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UITextField *tipValue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.billAmount.placeholder = @"Bill Amount";
    self.billAmount.textColor = [UIColor blackColor];
    self.billAmount.delegate = self;
    
    self.tipAmount.placeholder = @"15% Tip";
    self.tipAmount.textColor = [UIColor blackColor];
    self.tipAmount.delegate = self;
    
    self.totalAmount.placeholder = @"Total Amount";
    self.totalAmount.textColor = [UIColor blueColor];
    self.totalAmount.delegate = self;
    
 }

//User can select Calc Tip and it will automatically calculate 15% tip

-(BOOL)billAmountEntered:(UITextField*)billAmount{
    [billAmount resignFirstResponder];
    return YES;
    
}

-(IBAction)calcTip:(id)sender{
    
    float finalBill = [self.billAmount.text floatValue];
    float tip = finalBill * 0.15;
    self.tipAmount.text = [NSString stringWithFormat:@"%.2f", tip];
    float totalBill = finalBill + tip;
    self.totalAmount.text = [NSString stringWithFormat:@"%.2f", totalBill];
    
}

//User can enter their own tip amount

-(BOOL)tipAmountEntered:(UITextField*)tipAmount{
    [tipAmount resignFirstResponder];
    return YES;
}

-(IBAction)selectTip:(id)sender{
    
    float finalBill = [self.billAmount.text floatValue];
    float tipAmount = [self.tipAmount.text floatValue]/100;
    float tip = finalBill * tipAmount;
    float totalBill = finalBill + tip; 
    self.totalAmount.text = [NSString stringWithFormat:@"%.2f", totalBill];
}

//User can select tip amount using slider

-(BOOL)slideChangeTip:(UITextField*)tipValue{
    [tipValue resignFirstResponder];
    return YES;
}

- (IBAction)changeSlider:(id)sender {
    
    float finalBill = [self.billAmount.text floatValue];
    self.tipValue.text = [NSString stringWithFormat:@"%.2f", self.slider.value];
    self.tipAmount.text = [NSString stringWithFormat:@"%.2f", ([self.tipValue.text floatValue]*0.10)];
    float tip = [self.tipAmount.text floatValue];
    float totalBill = finalBill + tip;
    self.totalAmount.text = [NSString stringWithFormat:@"%.2f", totalBill];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
