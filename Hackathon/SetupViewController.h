//
//  SetupViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/14/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImageView *backgroundImageView;
    
    UIImagePickerController *uip;
    
    UIImageView *photoImageView;
    UILabel *textLabel;
    
}

-(IBAction)takePhotoButtonHit;

@property (nonatomic, retain) UIImagePickerController *uip;

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;

@property (nonatomic, retain) IBOutlet UIImageView *photoImageView;
@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@end
