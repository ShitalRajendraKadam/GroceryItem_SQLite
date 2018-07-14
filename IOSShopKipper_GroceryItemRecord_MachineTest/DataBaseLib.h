//
//  DataBaseLib.h
//  IOSShopKipper_GroceryItemRecord_MachineTest
//
//  Created by Student P_02 on 21/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewCell.h"
#import "ViewController.h"
#import "NextViewController.h"
#import "DataBaseLib.h"
#import <sqlite3.h>
@interface DataBaseLib : NSObject
{
    sqlite3 *taskDatabase;
}
+(instancetype)getSharedObject;
-(void)createDatabase;
-(NSString *)getDatabasePath;
-(int)executeQuery:(NSString *)query;
-(void)getAllTasks:(NSString *)query;
@property  NSMutableArray *taskItemIDArray;
@property NSMutableArray *taskItemNameArray;
@property NSMutableArray *taskItemRateArray;


@end
