//
//  DetailViewController.h
//  Catalogue
//
//  Created by kcfancher on 8/6/12.
//  Copyright (c) 2012 kcfancher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@property (strong, nonatomic) Item *item;
@end
