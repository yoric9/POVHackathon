//
//  SetupViewController.m
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import "SetupViewController.h"
#import "AppDelegate.h"
#import "UserProfileObject.h"
@interface SetupViewController ()

@end

@implementation SetupViewController

@synthesize uip, backgroundImageView, textLabel, photoImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)takePhotoButtonHit
{
    NSLog(@"takePhotoButtonHit");
    
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] && self.uip == nil)
    {
        self.uip = [[UIImagePickerController alloc] init];
        self.uip.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.uip.showsCameraControls = YES;
        self.uip.delegate = self;
        CGRect frame = uip.view.frame;
        frame.origin.y += 30;
        frame.size.height -= 30;
        self.uip.view.frame = frame;
        [self.view addSubview:self.uip.view];
        
        self.uip.view.transform = CGAffineTransformMakeRotation(-3.141592/2);
        self.uip.view.frame = CGRectMake(+560,-5,580,310);
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.35];
        self.uip.view.frame = CGRectMake(0,self.uip.view.frame.origin.y,self.uip.view.frame.size.width,self.uip.view.frame.size.height);
        [UIView commitAnimations];
        
        
    }

    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0,0,520,320);
    
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont fontWithName:@"SignPainter" size:20];
    self.textLabel.text = @"Tap to Take a Photo of yourself";
    // Do any additional setup after loading the view from its nib.
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo: %@", info);
    
    self.textLabel.text = @"Tap to retake photo";
    
    self.photoImageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];



    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextButton setImage:[UIImage imageNamed:@"use_button.png"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonHit) forControlEvents:UIControlEventTouchUpInside];
    nextButton.frame = CGRectMake(420,240,100,50);
    [self.view addSubview:nextButton];

    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.35];
    self.uip.view.frame = CGRectMake(+580,00,self.uip.view.frame.size.width,self.uip.view.frame.size.height);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(pickerExitedOut)];
    [UIView commitAnimations];
    
    [UserProfileObject getSharedProfileObject].userImage = self.photoImageView.image;
    
}

-(void)pickerExitedOut
{
    [self.uip.view removeFromSuperview];
    [self.uip release];
    self.uip = nil;
}
-(void)nextButtonHit
{
    
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [del transitionToRootTabBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
