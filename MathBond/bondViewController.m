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

@synthesize One, Two, Three;
static int max, one, two, three, answer;
static bool first, second, third;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"numberBon
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"numberBond7.png"]];
    [self.view addSubview:imgView];
    
    max = 10;  //set the highest number to see on the screen.
    
    //NSLog(@"Random Number %d", [self choosePosition]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Go
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.One)
    {
        [theTextField resignFirstResponder];
    }
    
    if (theTextField == self.Two)
    {
        [theTextField resignFirstResponder];
    }
    
    if (theTextField == self.Three)
    {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

//helper methods, not declared in .h file
-(int)getRandomNumber :(int)limit
{
    int lowerBound = 0;
    int upperBound = limit;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    return rndValue;
}

-(int)choosePosition
{
    int lowerBound = 1;
    int upperBound = 3;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    
    return rndValue;
}

-(void)createNumberBond
{
    int positionChosen;
    positionChosen = [self choosePosition];
    
    //set values
    one = [self getRandomNumber:max];
    two = [self getRandomNumber:one];
    three = one - two;
    
    switch (positionChosen)
    
    {
        case 1:
            first = TRUE;
            second = FALSE;
            third = FALSE;
            answer = one;
            break;
        case 2:
            first = FALSE;
            second = TRUE;
            third = FALSE;
            answer = two;
            break;
        case 3:
            first = FALSE;
            second = FALSE;
            third = TRUE;
            answer = three;
            break;
            
        default:
            
            NSLog(@"Error: a value of %d was chosen as a position", positionChosen);
            break;
    }
}


@end
