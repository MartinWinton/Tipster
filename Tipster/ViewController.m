//
//  ViewController.m
//  Tipster
//
//  Created by Martin Winton on 6/26/18.
//  Copyright © 2018 Martin Winton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double defaultIndex = [defaults doubleForKey:@"default_tip_index"];
    
    [self.tipControl setSelectedSegmentIndex:defaultIndex];
    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"View did disappear");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    
    NSArray *percentages = @[@(.15), @(.2), @(.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    
    double bill = [self.billField.text doubleValue];
    double tip = tipPercentage*bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f",total];

    
}
- (IBAction)onEditingBegin:(id)sender {
    
  
   
        CGRect newFrame = self.billField.frame;
        
        newFrame.origin.y +=20;
        
        
        [UIView animateWithDuration:.2 animations:^{
            self.billField.frame = newFrame;

        }];
        
    [UIView animateWithDuration:1 animations:^{
        
        self.tipLabel.alpha = 0;
        
    }];


    
    
    
    
}


- (IBAction)onEditingEnd:(id)sender {
    
    
    CGRect newFrame = self.billField.frame;
    
    newFrame.origin.y -=20;
   
    
    [UIView animateWithDuration:.2 animations:^{
         self.billField.frame = newFrame;
        
        
    }];
    
    [UIView animateWithDuration:1 animations:^{
        
        self.tipLabel.alpha = 1;
        
    }];
    
    
}

@end
