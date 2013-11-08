// Copyright 2012 ESRI
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// You may freely redistribute and use this sample code, with or
// without modification, provided you include the original copyright
// notice and use restrictions.
//
// See the use restrictions at http://help.arcgis.com/en/sdk/10.0/usageRestrictions.htm
// ESRI sources: Geocoding Sample, TableOfContentsSample 

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>
#import "panelViewController.h"

@interface MainViewController : UIViewController <AGSMapViewLayerDelegate, UISearchBarDelegate, AGSLocatorDelegate, AGSCalloutDelegate, AGSMapViewTouchDelegate, AGSIdentifyTaskDelegate, AGSRouteTaskDelegate, ChildViewControllerDelegate>
{
	AGSMapView *_mapView;
	UIButton* _infoButton;
    
    // find adddress feature
    UISearchBar *_searchBar;
    AGSGraphicsLayer *_graphicsLayer;
	AGSLocator *_locator;
	AGSCalloutTemplate *_calloutTemplate;
    
    //Only used with iPad
	UIPopoverController* _popOverController;
    
    // location popup
    //AGSMapView *_mapView;
	//AGSGraphicsLayer *_graphicsLayer;
    AGSGraphic *_graphic;
	AGSIdentifyTask *_identifyTask;
	AGSIdentifyParameters *_identifyParams;
    AGSPoint* _mappoint;
}

@property (nonatomic, strong) IBOutlet AGSMapView *mapView;
//@property (nonatomic, strong) IBOutlet UIButton* infoButton;
@property (nonatomic, strong) UIPopoverController *popOverController;

// find address feature
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) AGSGraphicsLayer *graphicsLayer;
@property (nonatomic, strong) AGSLocator *locator;
@property (nonatomic, strong) AGSCalloutTemplate *calloutTemplate;

// activity
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

// location popup
//@property (nonatomic, retain) IBOutlet AGSMapView *mapView;
//@property (nonatomic, retain) AGSGraphicsLayer *graphicsLayer;
@property (nonatomic, retain) AGSIdentifyTask *identifyTask;
@property (nonatomic, retain) AGSIdentifyParameters *identifyParams;
@property (nonatomic, retain) AGSPoint* mappoint;
@property (nonatomic, retain) AGSGraphic *graphic;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *showHideBtn;
@property (weak, nonatomic) IBOutlet UIView *containerPanel;

// show the dropdown panel
- (IBAction)showPanel:(id)sender;

// routing and directions
//@property (nonatomic, retain) AGSRouteTask *routeTask;
//@property (nonatomic, retain) AGSRouteTaskResult *routeResult;
//@property (nonatomic, strong) AGSRouteTask *routeTask;
//@property (nonatomic, strong) AGSRouteResult *routeResult;

//@property (weak, nonatomic) IBOutlet UILabel *directionsLabel;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *prevButton;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

//@property (weak, nonatomic) IBOutlet UIBarButtonItem *prevBtn;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBtn;

//@property (weak, nonatomic) AGSRouteTaskResultGraphic

//@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
//@property (nonatomic, strong) AGSDirectionGraphic *currentDirectionGraphic;

//- (IBAction)prevBtnClicked:(id)sender;
//- (IBAction)nextBtnClicked:(id)sender;
//- (void) routeTo:(AGSGeometry*)destination;


// this is the original method when button was on main controller; replaced with method called by panelViewController
- (IBAction)presentTableOfContents:(id)sender;

- (void)showLayers:(panelViewController *)controller; // called by panelViewController

- (void)locationRequested:(panelViewController *)controller;

- (void) startAutoPan:(panelViewController *)controller;

//This is the method that starts the geocoding operation
- (void)startGeocoding;

@end

