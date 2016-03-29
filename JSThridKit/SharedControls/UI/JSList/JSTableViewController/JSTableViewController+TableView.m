//
//  SWTableViewController+TableView.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableViewController+TableView.h"

@implementation JSTableViewController (TableView)




#pragma mark ----------------------TableView 代理方法----------------------------------------


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.date.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    self.JSTableViewCellDelegate=[tableView dequeueReusableCellWithIdentifier:KSWIdentifier forIndexPath:indexPath];
    
    id content=self.date[indexPath.row];
    [self.JSTableViewCellDelegate JSTableViewController:self TableViewDateArr:self.date cellValue:content indexPath:indexPath];
    
    return (UITableViewCell *)self.JSTableViewCellDelegate;
}



#pragma mark -tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(self.delegate==nil || ![self.delegate respondsToSelector:@selector(JSTableViewController:didSelectRowAtIndexPath:)]){
        
    }
    else{
        
        [self.delegate JSTableViewController:self didSelectRowAtIndexPath:indexPath];
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(self.delegate==nil || ![self.delegate respondsToSelector:@selector(JSTableViewController:heightForRowAtIndexPath:)]){
        return 50;
    }
    else{
        return  [self.delegate JSTableViewController:self heightForRowAtIndexPath:indexPath];
    }
}


#pragma mark ----------------------TableView 头部---------------------------------------

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if ([self.delegate respondsToSelector:@selector(JSTableViewController:viewForHeaderInSection:)]) {
        
        return [self.delegate JSTableViewController:self viewForHeaderInSection:section];
    }
    else{
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        return v;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if ([self.delegate respondsToSelector:@selector(JSTableViewController:heightForHeaderInSection:)]) {
        return [self.delegate JSTableViewController:self heightForHeaderInSection:section];
    }
    else{
        return 0.0;
    }
}






#pragma mark ----------------------TableView 刷新方法----------------------------------------


-(void)reloadHeader{
    
    [self.tableView cyl_reloadData];
    [self.tableView.header endRefreshing];
    
}


-(void)reloadFooter{
    
    [self.tableView cyl_reloadData];
    [self.tableView.footer endRefreshing];
    
}

#pragma mark ----------------------TableView 隐藏与显示方法----------------------------------------
#pragma mark -隐藏头部
-(void)hiddenFooter{
    
    self.tableView.footer.hidden=YES;
}


#pragma mark -添加头部
-(void)showFooter{
    
    //    [self TableViewFooter];
    self.tableView.footer.hidden=NO;
}




@end
