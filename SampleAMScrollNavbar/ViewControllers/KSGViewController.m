//
//  KSGViewController.m
//  SampleAMScrollNavbar
//
//  Created by Ryo Kosuge on 2014/07/05.
//  Copyright (c) 2014年 kosuge. All rights reserved.
//

#import "KSGViewController.h"
#import <AMScrollingNavbar/UIViewController+ScrollingNavbar.h>

@interface KSGViewController ()

@property (nonatomic) NSArray *data;

@end

@implementation KSGViewController

static const NSString *kDataTitleKey = @"title";
static const NSString *kDataDetailKey = @"detail";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self followScrollView:self.tableView withDelay:6.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)data
{
    if (!_data) {
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 30; i ++) {
            NSString *title = [NSString stringWithFormat:@"title_%d", i];
            NSString *detail = [NSString stringWithFormat:@"detail_%d", i];
            NSDictionary *dic = @{kDataTitleKey:title, kDataDetailKey:detail};
            [mutableArray addObject:dic];
        }
        _data = [mutableArray copy];
    }
    return _data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    NSDictionary *dic = self.data[indexPath.row];
    cell.textLabel.text = dic[kDataTitleKey];
    cell.detailTextLabel.text = dic[kDataDetailKey];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
