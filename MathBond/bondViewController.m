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
    
    [self createNumberBond];
    [self displayNumberBond];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Go
{
    [self createNumberBond];
    [self displayNumberBond];
    
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
-(int)getRandomNumber :(int)upperBound :(int)lowerBound
{
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
    one = [self getRandomNumber:max:1];
    two = [self getRandomNumber:one:0];
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
    NSLog(@"one %d", one);
    NSLog(@"two %d", two);
    NSLog(@"three %d", three);
}

-(void)displayNumberBond
{
    if(first)
    {
        self.One.text = @"";
        self.One.enabled = YES;
    }
    else
    {
        NSString *strFromInt = [NSString stringWithFormat:@"%d",one];
        self.One.text = strFromInt;
        self.One.enabled = NO;

    }
    
    if(second)
    {
        self.Two.text = @"";
        self.Two.enabled = YES;
    }
    else
    {
        NSString *strFromInt = [NSString stringWithFormat:@"%d",two];
        self.Two.text = strFromInt;
        self.Two.enabled = NO;
        
    }
    
    if(third)
    {
        self.Three.text = @"";
        self.Three.enabled = YES;
    }
    else
    {
        NSString *strFromInt = [NSString stringWithFormat:@"%d",three];
        self.Three.text = strFromInt;
        self.Three.enabled = NO;
        
    }
}

@end
