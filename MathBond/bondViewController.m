//
//  bondViewController.m
//  MathBond
//
//  Created by Joseph Fedor on 4/2/14.
//  Copyright (c) 2014 Joseph Fedor. All rights reserved.
//

#import "bondViewController.h"

@interface bondViewController ()

@end

@implementation bondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"numberBon
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"numberBond.png"]];
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
