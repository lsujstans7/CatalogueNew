//
//  AddViewController.m
//  Catalogue
//
//  Created by kcfancher on 8/6/12.
//  Copyright (c) 2012 kcfancher. All rights reserved.
//

#import "AddViewController.h"
#import "Item.h"
#import "Book.h"
#import "CD.h"
@interface AddViewController ()

@end

@implementation AddViewController
@synthesize nameTextField;
@synthesize creatorTextField;
@synthesize priceTextField;
@synthesize idTextField;
@synthesize itemTypeSelector;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setCreatorTextField:nil];
    [self setPriceTextField:nil];
    [self setIdTextField:nil];
    [self setItemTypeSelector:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// An action method that is called whenever the done button is pressed
- (IBAction)done:(UIBarButtonItem *)sender {
    
    Item *newItem;
    
    // A very simplistic sample of testing the nameTextField to ensure that
    // some value has been added to the textfield
    if ([self.nameTextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"You need to add a name"
                                                       delegate:self cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Dismiss the AddViewController to show the previous view controller
    [self dismissModalViewControllerAnimated:YES];

    
    // Selected Book Type
    if (self.itemTypeSelector.selectedSegmentIndex == 0) {
        newItem = [Book bookWithTitle:self.nameTextField.text
                               author:self.creatorTextField.text
                                price:[self.priceTextField.text floatValue]
                 identificationNumber:[self.idTextField.text intValue]];
    }
    // Selected CD Type
    else if (self.itemTypeSelector.selectedSegmentIndex == 1) {
        newItem = [CD cdWithArtist:self.creatorTextField.text
                             label:self.nameTextField.text
                             price:[self.priceTextField.text floatValue]
              identificationNumber:[self.idTextField.text intValue]];
    }
    
    // Call the addViewController:didSaveitem: method on our delegate
    [self.delegate addViewController:self didSaveItem:newItem];
}

// An action method that is called whenever the cancel button is pressed
- (IBAction)cancel:(UIBarButtonItem *)sender {
    // Dismiss the AddViewController to show the previous view controller
    [self dismissModalViewControllerAnimated:YES];
    // Call the addViewControllerDidCancel: method on our delegate
    [self.delegate addViewControllerDidCancel:self];
}
@end
