//
//  ParallaxViewController.m
//  ParralaxDetailView
//
//  Created by apple on 29/04/16.
//  Copyright © 2016 ClickApps. All rights reserved.
//

#import "ParallaxViewController.h"

#define HEADER_IMAGE_HEIGHT  300;

@interface ParallaxViewController ()<UIScrollViewDelegate>


/**
 @property bottomScroll
 @description UIScrollView place at bottom of View holding labels and text and other controls one want to place on it
 */
@property(nonatomic, weak) IBOutlet UIScrollView *bottomScroll;

/**
 @property topScroll
 @description UIScrollView place at top of View holding post image
 */
@property(nonatomic, weak) IBOutlet UIScrollView *topScroll;
/**
 @property scrollDirectionValue
 @description holding value to determine scroll direction
 */
@property(nonatomic, assign) float scrollDirectionValue;

/**
 @property yoffset
 @description set scroll contentoffset based on this offest value
 */
@property(nonatomic, assign) float yoffset;


/**
 @property alphaValue
 @description alpha to  fade in fade out nav color
 */
@property(nonatomic, assign) CGFloat alphaValue;
/**
 @property bottomViewTopConstraint
 @description constraint for aligning bottom view as per our post imageview height
 */
@property(nonatomic, weak) IBOutlet NSLayoutConstraint *bottomViewTopConstraint;



@end

@implementation ParallaxViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
  
   // self.contentViewHeight.constant = self.contentViewHeight.constant +100;
    
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"ParallaxViewController" owner:self options:nil] objectAtIndex:0];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view insertSubview:view atIndex:0];

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.bottomScroll.delegate = self;
    self.headerImageViewHeight.constant = HEADER_IMAGE_HEIGHT;
    self.bottomViewTopConstraint.constant = self.headerImageViewHeight.constant;
    self.contentViewHeight.constant = [UIScreen mainScreen].bounds.size.height - HEADER_IMAGE_HEIGHT;

}

-(void)adjustContentViewHeight{
    self.bottomViewTopConstraint.constant = self.headerImageViewHeight.constant;
    self.contentViewHeight.constant = [UIScreen mainScreen].bounds.size.height -  self.headerImageViewHeight.constant;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGFloat offset=scrollView.contentOffset.y;
    CGFloat percentage=offset/self.headerImageViewHeight.constant;
    CGFloat value=self.headerImageViewHeight.constant*percentage; // negative when scrolling up more than the top
    
    /* if (value > scrollDirectionValue || value == scrollDirectionValue) {
     //moving upward
     //  alphaValue=fabs(percentage);
     }
     else {
     // NSLog(@"Moving Downward");
     //alphaValue=2-fabs(percentage);
     }*/
    
    self.alphaValue=fabs(percentage);
    
    
    self.scrollDirectionValue = value;
    
    
    if (percentage < 0.00) {
        [self.bottomScroll setContentOffset:CGPointMake(0, 0)];
        
    }
    else {
        
        self.yoffset = self.bottomScroll.contentOffset.y*0.3;
        [self.topScroll setContentOffset:CGPointMake(scrollView.contentOffset.x,self.yoffset) animated:NO];
        

    }
}

@end
