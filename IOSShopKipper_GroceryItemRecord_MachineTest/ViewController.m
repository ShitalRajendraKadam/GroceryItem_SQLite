//
//  ViewController.m
//  IOSShopKipper_GroceryItemRecord_MachineTest
//
//  Created by Student P_02 on 21/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *query=@"select * from Item";
    [[DataBaseLib getSharedObject]getAllTasks:query];
    self.myItemIDArray=[[DataBaseLib getSharedObject]taskItemIDArray];
    self.myItemNameArray=[[DataBaseLib getSharedObject]taskItemNameArray];
    self.myItemRateArray=[[DataBaseLib getSharedObject]taskItemRateArray];
    
    [self.myTableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myItemIDArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.ItemIDLableCell.text=[self.myItemIDArray objectAtIndex:indexPath.row];
    
    cell.ItemNameLableCell.text=[self.myItemNameArray objectAtIndex:indexPath.row];
    
    cell.ItemRateLableCell.text=[self.myItemRateArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    NextViewController *next=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    
    
    next.SelectedItemID=cell.ItemIDLableCell.text;
    next.SelectedItemName=cell.ItemNameLableCell.text;
    next.SelectedItemRate=cell.ItemRateLableCell.text;
    
    [self.navigationController pushViewController:next animated:YES];
    
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    return @"GROCERY ITEM DETAILS";
}



- (IBAction)NextButton:(UIBarButtonItem *)sender

{
    NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    
    [self.navigationController pushViewController:nvc animated:YES];

}
@end
