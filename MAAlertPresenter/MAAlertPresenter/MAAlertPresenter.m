//
//  MAAlertPresenter.m
//  MAAlertPresenter
//
//  Created by Milan Agarwal on 10/08/16.
//  Copyright © 2016 Milan Agarwal. All rights reserved.
//

#import "MAAlertPresenter.h"

@interface MAAlertPresenter ()

@property (nonatomic, strong) NSMutableArray *arrAlertsQueue;

@end

static MAAlertPresenter *alertPresenter;

@implementation MAAlertPresenter


//****************************************************
#pragma mark - Public Methods
//****************************************************

+(instancetype)sharedPresenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!alertPresenter) {
            
            alertPresenter = [[MAAlertPresenter alloc]init];
            
        }
    });
    
    return alertPresenter;
}

-(void)enqueueAlert:(UIAlertController *)alertController
{
    if (alertController) {
        
        ///Insert alert controller to the queue
        [self.arrAlertsQueue addObject:alertController];
        
        ///Show alert if this is the first alert
        if (self.arrAlertsQueue.count == 1) {
            
            [self showAlertController:[self.arrAlertsQueue firstObject]];
            
        }
    }
    
    
}

-(void)dequeueAlert
{
    if (self.arrAlertsQueue.count > 0) {
        
        ///remove first object following FIFO
        [self.arrAlertsQueue removeObjectAtIndex:0];
        
        ///Check if there are more alerts in the queue dislay the next alert
        if (self.arrAlertsQueue.count > 0) {
            
            [self showAlertController:[self.arrAlertsQueue firstObject]];
            
        }
        
    }
}


//****************************************************
#pragma mark - Property Initializers
//****************************************************

-(NSMutableArray *)arrAlertsQueue
{
    if (!_arrAlertsQueue) {
        
        _arrAlertsQueue = [NSMutableArray array];
    }
    
    return _arrAlertsQueue;
}

//****************************************************
#pragma mark - Private Methods
//****************************************************

-(void)showAlertController:(UIAlertController *)alertController
{
    if (alertController) {
        
        UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
        
        [rootVC presentViewController:alertController animated:YES completion:NULL];
        
        
    }
}


@end
