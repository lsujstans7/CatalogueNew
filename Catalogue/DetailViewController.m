//
//  DetailViewController.m
//  Catalogue
//
//  Created by kcfancher on 8/6/12.
//  Copyright (c) 2012 kcfancher. All rights reserved.
//

#import "DetailViewController.h"
#import "CD.h"
#import "Book.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize addImageButton;
@synthesize nameLabel;
@synthesize creatorLabel;
@synthesize priceLabel;
@synthesize idLabel;
@synthesize item = _item;
@synthesize imageView;

// Initialize the labels with the values for the item that we have been assigned
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.priceLabel.text = [NSString stringWithFormat:@"$%.2f",self.item.price];
    self.idLabel.text = [NSString stringWithFormat:@"%d",self.item.identificationNumber];
    
    if ([self.item isMemberOfClass:[Book class]]) {
        self.addImageButton.hidden = NO;
        Book *book = (Book *)self.item;
        self.nameLabel.text = book.title;
        self.creatorLabel.text = book.author;
    } else if ([self.item isMemberOfClass:[CD class]]) {
        self.addImageButton.hidden = YES;
        CD *cd = (CD *)self.item;
        self.nameLabel.text = cd.label;
        self.creatorLabel.text = cd.artist;
    }
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setCreatorLabel:nil];
    [self setPriceLabel:nil];
    [self setIdLabel:nil];
    [self setImageView:nil];
    [self setAddImageButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addImage:(UIButton *)sender {
}
@end
