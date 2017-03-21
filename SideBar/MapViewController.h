//
//  MapViewController.h
//  SideBar
//
//  Created by test on 3/21/17.
//  Copyright © 2017 com.neorays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@end
