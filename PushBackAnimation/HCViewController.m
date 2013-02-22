//
//  HCViewController.m
//  PushBackAnimation
//
//  Created by 김형철 on 13. 2. 22..
//  Copyright (c) 2013년 Tictoc Planet, Inc. All rights reserved.
//

#import "HCViewController.h"
#import "UIViewController+HCPushBackAnimation.h"

@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSArray* color = [NSArray arrayWithObjects:
					  [UIColor redColor],
					  [UIColor orangeColor],
					  [UIColor yellowColor],
					  [UIColor greenColor],
					  [UIColor blueColor],
					  [UIColor cyanColor],
					  [UIColor purpleColor],
					  nil];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(clickClose:)];
	
	static int i;
	i++;
	self.view.backgroundColor = [color objectAtIndex:i%7];
	
	UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"modalView" forState:UIControlStateNormal];
	button.frame = CGRectMake(0, 0, 100, 100);
	[button addTarget:self action:@selector(clickModalView:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	UIButton* push = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[push setTitle:@"push" forState:UIControlStateNormal];
	push.frame = CGRectMake(200, 0, 100, 100);
	[push addTarget:self action:@selector(clickPush:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:push];
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	//////////////////////////////////////////
	// call this method where viewWillAppear
	//////////////////////////////////////////
	[self animationPopFrontScaleUp];
}

-(void) clickPush:(id)sender {
	HCViewController* viewController = [[HCViewController alloc] init];
	[self.navigationController pushViewController:viewController animated:YES];
}

-(void)clickModalView:(id)sender {
	HCViewController* viewController = [[HCViewController alloc] init];
	UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[self presentViewController:navigationController animated:YES completion:nil];
	
	/////////////////////////////////////////////////////
	// Call the method where you want to put animation.
	/////////////////////////////////////////////////////
	[self animationPushBackScaleDown];
}

-(void) clickClose:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end