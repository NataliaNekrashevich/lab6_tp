//
//  ViewController.h
//  lab6-2
//
//  Created by admin on 25/05/17.
//  Copyright (c) 2017 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *indicator;
- (IBAction)refresh:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cityBox;

@end
