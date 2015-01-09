//
//  ViewController.m
//  ExcludedShareExtensions
//
//  Created by John Szumski on 1/9/15.
//  Copyright (c) 2015 John Szumski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[[NSURL URLWithString:@"http://apple.com"]]
																			 applicationActivities:nil];
	activityVC.excludedActivityTypes = @[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, @"com.tumblr.tumblr.Share-With-Tumblr"];
	
	activityVC.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
		NSLog(@"Finished with activity %@", activityType);
	};
	
	[self presentViewController:activityVC animated:YES completion:NULL];
}

@end
