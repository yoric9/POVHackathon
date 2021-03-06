//
//  TabRootViewController.h
//  Hackathon
//
//  Created by Josh Klobe on 4/13/13.
//  Copyright (c) 2013 Josh Klobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YouViewController.h"
#import "TheMapViewController.h"
#import "InventoryViewController.h"
#import "TrophyViewController.h"
@interface TabRootViewController : UITabBarController
{
    YouViewController *youViewController;
    TheMapViewController *mapViewController;
    
    InventoryViewController *inventoryViewController;
    TrophyViewController *trophyViewController;
    
    
    UIImageView *alignImageView;
    UIButton *doneButton;
}

-(void)journeyCompleted;

-(void)presentMediaPlayer;

@property (nonatomic, retain) YouViewController *youViewController;
@property (nonatomic, retain) TheMapViewController *mapViewController;

@property (nonatomic, retain) InventoryViewController *inventoryViewController;
@property (nonatomic, retain) TrophyViewController *trophyViewController;

@property (nonatomic, retain) UIImageView *alignImageView;
@property (nonatomic, retain) UIButton *doneButton;
@end
