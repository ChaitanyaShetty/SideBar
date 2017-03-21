//
//  SidebarTableViewController.m
//  SideBar
//
//  Created by test on 3/21/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "PhotoViewController.h"
#import "SWRevealViewController.h"

@interface SidebarTableViewController (){
    NSArray *menuItems;
}

@end

@implementation SidebarTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   menuItems = @[@"title", @"news", @"comments", @"map", @"calendar", @"bookmark"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
//    UINavigationController *controller = (UINavigationController *)segue.destinationViewController;
//    controller.title = [[menuItems objectAtIndex:path.row]capitalizedString];
//    
//    if ([segue.identifier isEqualToString:@"showPhoto"]) {
//        UINavigationController *nvc = (UINavigationController *)segue.destinationViewController;
//        PhotoViewController *vc = [nvc childViewControllers].firstObject;
//        NSString *photosFilename = [NSString stringWithFormat:@"%@.png", [menuItems objectAtIndex:path.row]];
//        vc.photoFilename = photosFilename;
//        
//    }
////    if ([segue isKindOfClass:[SWRevealViewControllerSegue class]]) {
////        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue *)segue;
////        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController *dvc) {
////            UINavigationController *navController = (UINavigationController *)self.revealViewController.frontViewController;
////            [navController setViewControllers:@[dvc] animated:NO];
////            [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
////        };
////    }
    
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"showPhoto"]) {
        PhotoViewController *photoController = (PhotoViewController*)segue.destinationViewController;
        NSString *photoFilename = [NSString stringWithFormat:@"%@_photo.jpg", [menuItems objectAtIndex:indexPath.row]];
        photoController.photoFilename = photoFilename;
    }
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }

}


@end
