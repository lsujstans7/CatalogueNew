//
//  WebsiteViewController.m
//  Catalogue
//
//  Created by kcfancher on 8/6/12.
//  Copyright (c) 2012 kcfancher. All rights reserved.
//

#import "WebsiteViewController.h"

@interface WebsiteViewController ()

@end

@implementation WebsiteViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Here we are going to create an NSURL object
    // This is used to specify a url to a site or resource
    // In this case we are using the URLWithString: method
    // to create a url based on a string
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    
    // Here we are going to create an NSURLRequest object
    // using the just created url.
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // Now we tell the webView to load the just created request
    [self.webView loadRequest:request];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
