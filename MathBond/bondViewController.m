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

@synthesize One, Two, Three, GoButton;
static int max, one, two, three, answer;
static bool first, second, third;

//NOTE:  to get this to move "Simply uncheck "Use Autolayout" in the file inspector.."
//      click on the button (or item to move) in the story board.  The "file inspector" is
//      the first of the six small icons.  
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        GoButton.frame = CGRectMake(755, 395, 94, 54);
        NSLog(@"landscape");
    }
    else
    {
        GoButton.frame = CGRectMake(342, 830, 94, 54);
        NSLog(@"portrait");
    }
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.GoButton = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CALayer *btnLayer = [GoButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
   //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"numberBon
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"numberBond7.png"]];
    [self.view addSubview:imgView];
    
    max = 12;  //set the highest number to see on the screen.
    
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
    int rndValue = lowerBound + arc4random() % upperBound;
    
    return rndValue;
}

-(int)choosePosition
{
    int lowerBound = 1;
    int upperBound = 3;
    int rndValue = lowerBound + arc4random() % upperBound;
    
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

-(id)validateIsNumber
{
    NSLog(@"validateIsNumber");
    NSString *errorText = @"";
    
    BOOL valid;
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];

    if(first)
    {
        NSLog(@"self.One.text %@", self.One.text);
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:self.One.text];
        valid = [alphaNums isSupersetOfSet:inStringSet];
        if (valid == NO)
        {
            
            errorText = [errorText stringByAppendingString:@"Please enter a number 0 to \n"];
            NSString *strFromInt = [NSString stringWithFormat:@"%d",max];
            errorText = [errorText stringByAppendingString:strFromInt];
        }
    }
    
    if(second)
    {
        NSLog(@"self.Two.text %@", self.Two.text);
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:self.Two.text];
        valid = [alphaNums isSupersetOfSet:inStringSet];
        if (valid == NO)
        {
            
            errorText = [errorText stringByAppendingString:@"Please enter a number 0 to \n"];
            NSString *strFromInt = [NSString stringWithFormat:@"%d",max];
            errorText = [errorText stringByAppendingString:strFromInt];
        }

    }
    
    if(third)
    {
        NSLog(@"self.Three.text %@", self.Three.text);
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:self.Three.text];
        valid = [alphaNums isSupersetOfSet:inStringSet];
        if (valid == NO)
        {
            
            errorText = [errorText stringByAppendingString:@"Please enter a number 0 to \n"];
            NSString *strFromInt = [NSString stringWithFormat:@"%d",max];
            errorText = [errorText stringByAppendingString:strFromInt];
        }

    }
    
    NSLog(@"errorText %@", errorText);
    return errorText;
}


-(id)validateIsEmpty
{
    NSLog(@"validateIsEmpty");
    NSString *errorText = @"";
    
    if(first)
    {
        if (self.One.text && self.One.text.length > 0)
        {
            errorText = [errorText stringByAppendingString:@"Please enter a number 0 to \n"];
            NSString *strFromInt = [NSString stringWithFormat:@"%d",max];
            errorText = [errorText stringByAppendingString:strFromInt];
        }
    }
    
    if(second)
    {
        if (self.Two.text && self.Two.text.length > 0)
        {
            errorText = [errorText stringByAppendingString:@"Please enter a number 0 to \n"];
            NSString *strFromInt = [NSString stringWithFormat:@"%d",max];
            errorText = [errorText stringByAppendingString:strFromInt];
        }
    }
    
    if(third)
    {
        if (self.Three.text && self.Three.text.length > 0)
        {
            errorText = [errorText stringByAppendingString:@"Please enter a number 0 to \n"];
            NSString *strFromInt = [NSString stringWithFormat:@"%d",max];
            errorText = [errorText stringByAppendingString:strFromInt];
        }
    }
    
    NSLog(@"errorText %@", errorText);
    return errorText;
}

-(id)validateIsIncorrectAnswer
{
    NSLog(@"validateIsIncorrectAnswer");
    NSString *errorText = @"";
    
    if(first)
    {
        if([self.One.text intValue] > answer)
        {
            errorText = [errorText stringByAppendingString:@"Sorry that answer is too high.  Try again"];
        }
        if([self.One.text intValue] < answer)
        {
            errorText = [errorText stringByAppendingString:@"Sorry that answer is too low.  Try again"];
        }
    }
    
    if(second)
    {
        if([self.Two.text intValue] > answer)
        {
            errorText = [errorText stringByAppendingString:@"Sorry that answer is too high.  Try again"];
        }
        if([self.Two.text intValue] < answer)
        {
            errorText = [errorText stringByAppendingString:@"Sorry that answer is too low.  Try again"];
        }
    }
    
    if(third)
    {
        if([self.Three.text intValue] > answer)
        {
            errorText = [errorText stringByAppendingString:@"Sorry that answer is too high.  Try again"];
        }
        if([self.Three.text intValue] < answer)
        {
            errorText = [errorText stringByAppendingString:@"Sorry that answer is too low.  Try again"];
        }
    }
    
    NSLog(@"errorText %@", errorText);
    return errorText;
}

@end
