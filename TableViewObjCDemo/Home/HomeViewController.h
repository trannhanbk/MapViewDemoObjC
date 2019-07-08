//
//  HomeViewController.h
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/3/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {

    IBOutlet UITableView *_tableView;
    IBOutlet CustomCell *_customCell;

    int count;

}

-(IBAction)doViewProfile:(id)sender;

@end
