//
//  NextViewController.m
//  IOSShopKipper_GroceryItemRecord_MachineTest
//
//  Created by Student P_02 on 21/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ItemIDTextField.delegate = self;
    self.ItemNameTextField.delegate = self;
    self.ItemRateTextField.delegate= self;
    
    self.ItemIDTextField.text=self.SelectedItemID;
    self.ItemNameTextField.text=self.SelectedItemName;
    self.ItemRateTextField.text=self.SelectedItemRate;

    // Do any additional setup after loading the view.
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

- (IBAction)SaveButton:(UIButton *)sender
{
    NSString *ItemIDText,*ItemNameText,*ItemRateText;
    ItemIDText=self.ItemIDTextField.text;
    ItemNameText=self.ItemNameTextField.text;
    ItemRateText=self.ItemRateTextField.text;
    
    
    
    NSString *query=[NSString stringWithFormat:@"insert into Item(taskItemID ,taskItemName ,taskItemRate)values('%@','%@','%@')",ItemIDText,ItemNameText,ItemRateText];
    
    int isSuccess=[[DataBaseLib getSharedObject]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"insertion:success");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
    }
    else
    {
        NSLog(@"insertion:Failed");
        
    }
    
    
    

}

- (IBAction)DeleteButton:(UIButton *)sender
{
    NSString *ItemIDText,*ItemNameText,*ItemRateText;
    ItemIDText=self.ItemIDTextField.text;
    ItemNameText=self.ItemNameTextField.text;
    ItemRateText=self.ItemRateTextField.text;

    
    NSString *query=[NSString stringWithFormat:@"DELETE FROM Item WHERE Item.taskItemID = '%@'",ItemIDText];
    
    int isSuccess=[[DataBaseLib getSharedObject]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Delete:success");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
    }
    else
    {
        NSLog(@"Delete:Failed");
        
    }
    
  
}

- (IBAction)UpdateButton:(UIButton *)sender
{
    NSString *ItemIDText,*ItemNameText,*ItemRateText;
    ItemIDText=self.ItemIDTextField.text;
    ItemNameText=self.ItemNameTextField.text;
    ItemRateText=self.ItemRateTextField.text;
    
    
    
    NSString *query=[NSString stringWithFormat:@"Update Item set taskItemName='%@',taskItemRate='%@' where  taskItemID='%@'",ItemNameText,ItemRateText,ItemIDText];
    
    int isSuccess=[[DataBaseLib getSharedObject]executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Update:success");
        ViewController *v=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:v animated:YES];
    }
    else
    {
        NSLog(@"Update:Failed");
        
    }

}
@end
