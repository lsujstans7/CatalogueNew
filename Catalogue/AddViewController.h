//
//  AddViewController.h
//  Catalogue
//
//  Created by kcfancher on 8/6/12.
//  Copyright (c) 2012 kcfancher. All rights reserved.
//

#import <UIKit/UIKit.h>

// Tells the compiler to ignore the error messages caused
// by not recognizing AddViewController or Item in
// our protocal methods
@class AddViewController;
@class Item;


// Create a protocol for our delegate
@protocol AddViewControllerDelegate <NSObject>
// Define to methods to be called on our delegate
- (void)addViewController:(AddViewController *)addVC didSaveItem:(Item *)newItem;
- (void)addViewControllerDidCancel:(AddViewController *)addVC;
@end


@interface AddViewController : UITableViewController
- (IBAction)done:(UIBarButtonItem *)sender;

- (IBAction)cancel:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *creatorTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *itemTypeSelector;

// Define a delegate property
// Delegate properties must always be weak and of type id
// with the Delegate protocal name specified in <>
@property (weak, nonatomic) id <AddViewControllerDelegate> delegate;

@end
