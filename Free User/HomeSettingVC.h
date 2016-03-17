//
//  HomeSettingVC.h
//  KeyIdManager
//
//  Created by design_offshore on 4/9/14.
//  Copyright (c) 2014 Key_id_Manager. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeSettingCell.h"
#import "AboutusVC.h"
#import <FacebookSDK/FacebookSDK.h>
#import "DashboardVC.h"
#import "UserDataModel.h"
@interface HomeSettingVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
@property(nonatomic,strong)NSMutableArray *menuArray;
@property(nonatomic,strong)NSMutableArray *submenuArray;
@property(nonatomic,strong)NSString *TYPE;

@end
