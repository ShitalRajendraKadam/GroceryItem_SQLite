//
//  ViewController.h
//  IOSShopKipper_GroceryItemRecord_MachineTest
//
//  Created by Student P_02 on 21/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "NextViewController.h"
#import "DataBaseLib.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)NextButton:(UIBarButtonItem *)sender;

@property NSArray *myItemIDArray;
@property NSArray *myItemNameArray;
@property NSArray *myItemRateArray;

@end

