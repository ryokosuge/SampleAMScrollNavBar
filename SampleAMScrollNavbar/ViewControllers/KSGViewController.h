//
//  KSGViewController.h
//  SampleAMScrollNavbar
//
//  Created by Ryo Kosuge on 2014/07/05.
//  Copyright (c) 2014年 kosuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSGViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
