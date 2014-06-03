//
//  bondViewController.h
//  MathBond
//
//  Created by Joseph Fedor on 4/2/14.
//  Copyright (c) 2014 Joseph Fedor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bondViewController : UIViewController

//numbered like reading:  start at top then left to right.
@property (weak, nonatomic) IBOutlet UITextField *One;
@property (weak, nonatomic) IBOutlet UITextField *Two;
@property (weak, nonatomic) IBOutlet UITextField *Three;
@property (weak, nonatomic) IBOutlet UIButton *GoButton;

-(IBAction)Go;

@end
