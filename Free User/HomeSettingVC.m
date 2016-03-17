//
//  HomeSettingVC.m
//  KeyIdManager
//
//  Created by design_offshore on 4/9/14.
//  Copyright (c) 2014 Key_id_Manager. All rights reserved.
//

#import "HomeSettingVC.h"

@interface HomeSettingVC ()

@end

@implementation HomeSettingVC
@synthesize MyTableView;
@synthesize menuArray,submenuArray,TYPE;

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
    UserDataModel *model=[[UserDataModel alloc] init];
    NSLog(@"user_tye:%@",TYPE);
    if([TYPE isEqualToString:@"Free User"]){
      //  self.menuArray=[[NSMutableArray alloc]initWithObjects:@"Dashboard",@"Manage",@"Compare Keys",@"Access Logs",@"Duplicate Logs",@"Log Out",nil];
        self.menuArray=[[NSMutableArray alloc]initWithObjects:@"Compare Keys",@"Upload Keys",@"My Keys",@"Log Out",nil] ;
    }
    self.menuArray=[[NSMutableArray alloc]initWithObjects:@"Compare Keys",@"Upload Keys",@"My Keys",@"Log Out",nil] ;

    }
    
//self.submenuArray=[[NSMutableArray alloc]initWithObjects:@"Power Users",@"Users",@"Keys",nil];    // Do any additional setup after loading the view from its nib.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
	
        return [menuArray count];
    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"HomeSettingCell";
    
    HomeSettingCell *cell = (HomeSettingCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeSettingCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //self.cell.backgroundColor=[UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1.0];
    // cell.label.font=FONT_ROBOTO(15);
    
    cell.myLabel.text = [self.menuArray objectAtIndex:indexPath.row];
    switch (indexPath.row) {
        case 0:
            cell.myImage.image=[UIImage imageNamed:@"menu-icon-home.png"];
            break;
            
        case 1:
            cell.myImage.image=[UIImage imageNamed:@"icon-manage(menu).png"];
            break;
        case 2:
            cell.myImage.image=[UIImage imageNamed:@"icon-compare_keys(menu).png"];
            break;
        case 3:
            cell.myImage.image=[UIImage imageNamed:@"icon-access_logs(menu).png"];

            break;
        case 4:
            cell.myImage.image=[UIImage imageNamed:@"icon-duplicate_logs(menu).png"];
            
            break;
        case 5:
            cell.myImage.image=[UIImage imageNamed:@"icon-logout(menu).png"];
            
            break;
        default:
            break;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"test");
    if(indexPath.row==0){
        DashboardVC *se=[[DashboardVC alloc] init];
        UINavigationController *o=[[UINavigationController alloc] initWithRootViewController:se];
        [self.revealSideViewController popViewControllerWithNewCenterController:o animated:YES];
    }
    if(indexPath.row==1){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@" Message " message:@"Are you sure want to Logout??" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
        alert.tag=6;
        [alert show];
        
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0&&alertView.tag==6){
        
        [FBSession.activeSession close];
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
       // [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
          LoginVC *lg=[[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
        //UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:lg];
        //[self presentViewController:nav animated:YES completion:Nil];
       // lg.Mynav=self.navigationController;
       // [self presentViewController:lg animated:YES completion:nil];
      //  [self.navigationController pushViewController:lg animated:NO];
        [self.revealSideViewController pushViewController:lg onDirection:PPRevealSideDirectionRight animated:YES];
        
    }
    
}
@end
