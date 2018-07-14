//
//  DataBaseLib.m
//  IOSShopKipper_GroceryItemRecord_MachineTest
//
//  Created by Student P_02 on 21/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "DataBaseLib.h"

@implementation DataBaseLib
+(instancetype)getSharedObject
{
    static DataBaseLib *sharedObject;
    if(sharedObject==nil)
    {
        sharedObject=[[DataBaseLib alloc]init];
    }
    
    return sharedObject;
}
-(NSString *)getDatabasePath
{
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"sqliteDatabase.db"];
    return dbpath;
}

-(int)executeQuery:(NSString *)query
{
    int success=0;
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath,&taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
        {
            NSLog(@"Prepare v2  Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
            }
        }
    }
    return success;
}
-(void)createDatabase
{
    NSString *query=@"create table if not exists Item(taskItemID text,taskItemName text,taskItemRate text)";
    
    int isSuccess=[self executeQuery:query];
    if(isSuccess)
    {
        NSLog(@"Database created successfully");
    }
    else
    {
        NSLog(@"Database creation failed");
    }
}
-(void)getAllTasks:(NSString *)query
{
    self.taskItemIDArray=[[NSMutableArray alloc]init];
    self.taskItemNameArray=[[NSMutableArray alloc]init];
    self.taskItemRateArray=[[NSMutableArray alloc]init];
    
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath,&taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
            
        }
        else
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *task=(const char *)sqlite3_column_text(stmt,0);
                NSString *myTask=[NSString stringWithFormat:@"%s",task];
                [self.taskItemIDArray addObject:myTask];
                
                const char *task1=(const char *)sqlite3_column_text(stmt,1);
                NSString *myTask1=[NSString stringWithFormat:@"%s",task1];
                [self.taskItemNameArray addObject:myTask1];
                
                const char *task2=(const char *)sqlite3_column_text(stmt,2);
                NSString *myTask2=[NSString stringWithFormat:@"%s",task2];
                [self.taskItemRateArray addObject:myTask2];
                
                
                
            }
        }
        
    }
}

@end
