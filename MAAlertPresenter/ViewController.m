//
//  ViewController.m
//  MAAlertPresenter
//
//  Created by Milan Agarwal on 10/08/16.
//  Copyright © 2016 Milan Agarwal. All rights reserved.
//

#import "ViewController.h"
#import "MAAlertPresenter/MAAlertPresenter.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtAlertsCount;
- (IBAction)btnPresentAlertsTapped:(UIButton *)sender;
@end

@implementation ViewController

//****************************************************
#pragma mark - Life Cycle Methods
//****************************************************

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//****************************************************
#pragma mark - Private Methods
//****************************************************

-(void)showAlertWithTitle:(NSString *)strTitle andMessage:(NSString *)strMessage
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:strTitle message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        ///Do anything required on OK action
        [[MAAlertPresenter sharedPresenter]dequeueAlert];
        
    }];
    
    [alertController addAction:okAction];
    //[self presentViewController:alertController animated:YES completion:NULL];
    [[MAAlertPresenter sharedPresenter]enqueueAlert:alertController];
    
    
}


//****************************************************
#pragma mark - Action Methods
//****************************************************

- (IBAction)btnPresentAlertsTapped:(UIButton *)sender {
    [self.txtAlertsCount resignFirstResponder];
    
    NSInteger alertsCount = [self.txtAlertsCount.text integerValue];
    if (alertsCount > 0) {
        
        for (NSInteger index = 1; index <= alertsCount; index++) {
            NSString *strTitle = [NSString stringWithFormat:@"Alert %d",(int)index];
            NSString *strMsg = [NSString stringWithFormat:@"Message %d",(int)index];
            
            [self showAlertWithTitle:strTitle andMessage:strMsg];

        }
        
    }
}
@end
