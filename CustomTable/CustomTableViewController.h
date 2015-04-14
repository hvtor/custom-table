//
//  CustomTableViewController.h
//  
//
//  Created by Hemant V. Torsekar on 2015-04-14.
//
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"

@interface CustomTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
