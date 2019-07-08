//
//  HomeViewController.m
//  TableViewObjCDemo
//
//  Created by MBA0145 on 7/3/19.
//  Copyright © 2019 MBA0145. All rights reserved.
//

#import "HomeViewController.h"
#import "ProfileVC.h"

@interface HomeViewController ()

-(void)configView;

@end

@implementation HomeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self  configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)doDone {
    self.navigationItem.rightBarButtonItem = nil;
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle: @"Edit" style:UIBarButtonItemStylePlain target:self action: @selector(doEdit)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    [_tableView setEditing:   NO animated: YES];
}

-(void)doEdit {
    self.navigationItem.rightBarButtonItem = nil;
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doDone)];
    self.navigationItem.rightBarButtonItem = done;
    
    [_tableView setEditing:YES animated:YES];
}

-(void)configView {
    self.title = @"CustomTable";
    count = 10;
    
    UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(doEdit)];
    self.navigationItem.rightBarButtonItem = edit;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell * cellR = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if (cellR == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cellR = _customCell;
        _customCell = nil;
    }
    
    cellR.button.tag = indexPath.row;
    return cellR;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Cell edit index %ld", (long)indexPath.row);
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        count--;
        
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath]
                          withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(IBAction)doViewProfile:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSLog(@"index %ld", (long)button.tag);
    ProfileVC * profileVC = [[ProfileVC alloc] initWithNibName:@"ProfileVC" bundle:nil];
    profileVC.name = [NSString stringWithFormat:@"%ld", button.tag + 1 ];
    [self.navigationController pushViewController:profileVC animated:YES];
}


@end
