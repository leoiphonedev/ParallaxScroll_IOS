//
//  ParallaxViewController.h
//  ParralaxDetailView
//
//  Created by apple on 29/04/16.
//  Copyright © 2016 ClickApps. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ParallaxViewController : UIViewController



/**
 @property contentViewHeight
 @description height for contentview palced in bottom scroll so that we can make it scrollable by increasing this height value
 */
@property(nonatomic, weak) IBOutlet NSLayoutConstraint *contentViewHeight;


/**
 @property headerImageView
 @description showing header image view for the post
 */
@property(nonatomic, weak) IBOutlet UIImageView *headerImageView;

/**
 @property contentView
 @description view where we add our other controls
 */
@property(nonatomic, weak)  IBOutlet UIView *contentView;

/**
 @property headerImageViewHeight
 @description value for setting header image height
 */
@property(nonatomic, weak)  IBOutlet NSLayoutConstraint *headerImageViewHeight; //default half of screen size


/**
 @method adjustContentViewHeight
 @description this will adjust content view height
 */
-(void)adjustContentViewHeight;


@end
