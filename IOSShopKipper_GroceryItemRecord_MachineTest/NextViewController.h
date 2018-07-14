//
//  NextViewController.h
//  IOSShopKipper_GroceryItemRecord_MachineTest
//
//  Created by Student P_02 on 21/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DataBaseLib.h"
#import "TableViewCell.h"
@interface NextViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *ItemIDTextField;

@property (weak, nonatomic) IBOutlet UITextField *ItemNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *ItemRateTextField;
- (IBAction)SaveButton:(UIButton *)sender;
- (IBAction)DeleteButton:(UIButton *)sender;
- (IBAction)UpdateButton:(UIButton *)sender;

@property NSString *SelectedItemID;
@property NSString *SelectedItemName;
@property NSString *SelectedItemRate;
@end
