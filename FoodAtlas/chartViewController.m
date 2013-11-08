//
//  ersFirstViewController.m
//  FoodAtlas
//
//  Created by Dina Li on 9/16/13.
//  Copyright (c) 2013 USDA ERS. All rights reserved.
//

#import "chartViewController.h"

@interface chartViewController ()

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *themeButton;
//@property (nonatomic, strong) CPTGraphHostingView *hostView;
@property (nonatomic, strong) CPTTheme *selectedTheme;

-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configurePlots;
-(void)configureAxes;
//-(IBAction)themeTapped:(id)sender;

@end

@implementation chartViewController

@synthesize toolbar = toolbar_;
@synthesize themeButton = themeButton_;
//@synthesize hostView = hostView_;
@synthesize selectedTheme = selectedTheme_;

#pragma mark - UIViewController lifecycle methods
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initPlot];
}

#pragma mark - Chart behavior
-(void)initPlot {
    [self configureHost];
    [self configureGraph];
    [self configurePlots];
    [self configureAxes];
}


#pragma mark - IBActions
//-(IBAction)themeTapped:(id)sender {
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Apply a Theme" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:CPDThemeNameDarkGradient, CPDThemeNamePlainBlack, CPDThemeNamePlainWhite, CPDThemeNameSlate, CPDThemeNameStocks, nil];
//    [actionSheet showFromTabBar:self.tabBarController.tabBar];
//}

-(void)configureHost {
    self.hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:self.view.bounds];
    self.hostView.allowPinchScaling = YES;
    [self.view addSubview:self.hostView];
}

-(void)configureGraph {
    // 1 - Create the graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    [graph applyTheme:[CPTTheme themeNamed:kCPTDarkGradientTheme]];
    self.hostView.hostedGraph = graph;
    // 2 - Set graph title
    NSString *title = @"Distance By Population Group";
    graph.title = title;
    // 3 - Create and set text style
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [CPTColor whiteColor];
    titleStyle.fontName = @"Helvetica-Bold";
    titleStyle.fontSize = 16.0f;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, 10.0f);
    // 4 - Set padding for plot area
    [graph.plotAreaFrame setPaddingLeft:30.0f];
    [graph.plotAreaFrame setPaddingBottom:30.0f];
    // 5 - Enable user interactions for plot space
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.allowsUserInteraction = YES;
}

-(void)configurePlots {
    // 1 - Get graph and plot space
    CPTGraph *graph = self.hostView.hostedGraph;
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    // 2 - Create the three plots
    CPTScatterPlot *aaplPlot = [[CPTScatterPlot alloc] init];
    aaplPlot.dataSource = self;
    aaplPlot.identifier = CPDTickerSymbolAAPL;
    CPTColor *aaplColor = [CPTColor redColor];
    [graph addPlot:aaplPlot toPlotSpace:plotSpace];
    CPTScatterPlot *googPlot = [[CPTScatterPlot alloc] init];
    googPlot.dataSource = self;
    googPlot.identifier = CPDTickerSymbolGOOG;
    CPTColor *googColor = [CPTColor greenColor];
    [graph addPlot:googPlot toPlotSpace:plotSpace];
    CPTScatterPlot *msftPlot = [[CPTScatterPlot alloc] init];
    msftPlot.dataSource = self;
    msftPlot.identifier = CPDTickerSymbolMSFT;
    CPTColor *msftColor = [CPTColor blueColor];
    [graph addPlot:msftPlot toPlotSpace:plotSpace];
    // 3 - Set up plot space
    [plotSpace scaleToFitPlots:[NSArray arrayWithObjects:aaplPlot, googPlot, msftPlot, nil]];
    CPTMutablePlotRange *xRange = [plotSpace.xRange mutableCopy];
    [xRange expandRangeByFactor:CPTDecimalFromCGFloat(1.1f)];
    plotSpace.xRange = xRange;
    CPTMutablePlotRange *yRange = [plotSpace.yRange mutableCopy];
    [yRange expandRangeByFactor:CPTDecimalFromCGFloat(1.2f)];
    plotSpace.yRange = yRange;
    // 4 - Create styles and symbols
    CPTMutableLineStyle *aaplLineStyle = [aaplPlot.dataLineStyle mutableCopy];
    aaplLineStyle.lineWidth = 2.5;
    aaplLineStyle.lineColor = aaplColor;
    aaplPlot.dataLineStyle = aaplLineStyle;
    CPTMutableLineStyle *aaplSymbolLineStyle = [CPTMutableLineStyle lineStyle];
    aaplSymbolLineStyle.lineColor = aaplColor;
    CPTPlotSymbol *aaplSymbol = [CPTPlotSymbol ellipsePlotSymbol];
    aaplSymbol.fill = [CPTFill fillWithColor:aaplColor];
    aaplSymbol.lineStyle = aaplSymbolLineStyle;
    aaplSymbol.size = CGSizeMake(6.0f, 6.0f);
    aaplPlot.plotSymbol = aaplSymbol;
    CPTMutableLineStyle *googLineStyle = [googPlot.dataLineStyle mutableCopy];
    googLineStyle.lineWidth = 1.0;
    googLineStyle.lineColor = googColor;
    googPlot.dataLineStyle = googLineStyle;
    CPTMutableLineStyle *googSymbolLineStyle = [CPTMutableLineStyle lineStyle];
    googSymbolLineStyle.lineColor = googColor;
    CPTPlotSymbol *googSymbol = [CPTPlotSymbol starPlotSymbol];
    googSymbol.fill = [CPTFill fillWithColor:googColor];
    googSymbol.lineStyle = googSymbolLineStyle;
    googSymbol.size = CGSizeMake(6.0f, 6.0f);
    googPlot.plotSymbol = googSymbol;
    CPTMutableLineStyle *msftLineStyle = [msftPlot.dataLineStyle mutableCopy];
    msftLineStyle.lineWidth = 2.0;
    msftLineStyle.lineColor = msftColor;
    msftPlot.dataLineStyle = msftLineStyle;
    CPTMutableLineStyle *msftSymbolLineStyle = [CPTMutableLineStyle lineStyle];
    msftSymbolLineStyle.lineColor = msftColor;
    CPTPlotSymbol *msftSymbol = [CPTPlotSymbol diamondPlotSymbol];
    msftSymbol.fill = [CPTFill fillWithColor:msftColor];
    msftSymbol.lineStyle = msftSymbolLineStyle;
    msftSymbol.size = CGSizeMake(6.0f, 6.0f);
    msftPlot.plotSymbol = msftSymbol;
}

-(void)configureAxes {
    // 1 - Create styles
    CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
    axisTitleStyle.color = [CPTColor whiteColor];
    axisTitleStyle.fontName = @"Helvetica-Bold";
    axisTitleStyle.fontSize = 12.0f;
    CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
    axisLineStyle.lineWidth = 2.0f;
    axisLineStyle.lineColor = [CPTColor whiteColor];
    CPTMutableTextStyle *axisTextStyle = [[CPTMutableTextStyle alloc] init];
    axisTextStyle.color = [CPTColor whiteColor];
    axisTextStyle.fontName = @"Helvetica-Bold";
    axisTextStyle.fontSize = 11.0f;
    CPTMutableLineStyle *tickLineStyle = [CPTMutableLineStyle lineStyle];
    tickLineStyle.lineColor = [CPTColor whiteColor];
    tickLineStyle.lineWidth = 2.0f;
    CPTMutableLineStyle *gridLineStyle = [CPTMutableLineStyle lineStyle];
    tickLineStyle.lineColor = [CPTColor blackColor];
    tickLineStyle.lineWidth = 1.0f;
    // 2 - Get axis set
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.hostView.hostedGraph.axisSet;
    // 3 - Configure x-axis
    CPTAxis *x = axisSet.xAxis;
    x.title = @"Groups";
    x.titleTextStyle = axisTitleStyle;
    x.titleOffset = 15.0f;
    x.axisLineStyle = axisLineStyle;
    x.labelingPolicy = CPTAxisLabelingPolicyNone;
    x.labelTextStyle = axisTextStyle;
    x.majorTickLineStyle = axisLineStyle;
    x.majorTickLength = 4.0f;
    x.tickDirection = CPTSignNegative;
    CGFloat dateCount = [[[CPDStockPriceStore sharedInstance] datesInMonth] count];
    NSMutableSet *xLabels = [NSMutableSet setWithCapacity:dateCount];
    NSMutableSet *xLocations = [NSMutableSet setWithCapacity:dateCount];
    NSInteger i = 0;
    for (NSString *date in [[CPDStockPriceStore sharedInstance] datesInMonth]) {
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:date  textStyle:x.labelTextStyle];
        CGFloat location = i++;
        label.tickLocation = CPTDecimalFromCGFloat(location);
        label.offset = x.majorTickLength;
        if (label) {
            [xLabels addObject:label];
            [xLocations addObject:[NSNumber numberWithFloat:location]];
        }
    }
    x.axisLabels = xLabels;
    x.majorTickLocations = xLocations;
    // 4 - Configure y-axis
    CPTAxis *y = axisSet.yAxis;
    y.title = @"Miles";
    y.titleTextStyle = axisTitleStyle;
    y.titleOffset = -40.0f;
    y.axisLineStyle = axisLineStyle;
    y.majorGridLineStyle = gridLineStyle;
    y.labelingPolicy = CPTAxisLabelingPolicyNone;
    y.labelTextStyle = axisTextStyle;
    y.labelOffset = 16.0f;
    y.majorTickLineStyle = axisLineStyle;
    y.majorTickLength = 4.0f;
    y.minorTickLength = 2.0f;
    y.tickDirection = CPTSignPositive;
    NSInteger majorIncrement = 100;
    NSInteger minorIncrement = 50;
    CGFloat yMax = 700.0f;  // should determine dynamically based on max price
    NSMutableSet *yLabels = [NSMutableSet set];
    NSMutableSet *yMajorLocations = [NSMutableSet set];
    NSMutableSet *yMinorLocations = [NSMutableSet set];
    for (NSInteger j = minorIncrement; j <= yMax; j += minorIncrement) {
        NSUInteger mod = j % majorIncrement;
        if (mod == 0) {
            CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:[NSString stringWithFormat:@"%i", j] textStyle:y.labelTextStyle];
            NSDecimal location = CPTDecimalFromInteger(j);
            label.tickLocation = location;
            label.offset = -y.majorTickLength - y.labelOffset;
            if (label) {
                [yLabels addObject:label];
            }
            [yMajorLocations addObject:[NSDecimalNumber decimalNumberWithDecimal:location]];
        } else {
            [yMinorLocations addObject:[NSDecimalNumber decimalNumberWithDecimal:CPTDecimalFromInteger(j)]];
        }
    }
    y.axisLabels = yLabels;    
    y.majorTickLocations = yMajorLocations;
    y.minorTickLocations = yMinorLocations;
}


#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return [[[CPDStockPriceStore sharedInstance] datesInMonth] count];
}


-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    NSInteger valueCount = [[[CPDStockPriceStore sharedInstance] datesInMonth] count];
    switch (fieldEnum) {
        case CPTScatterPlotFieldX:
            if (index < valueCount) {
                return [NSNumber numberWithUnsignedInteger:index];
            }
            break;
            
        case CPTScatterPlotFieldY:
            if ([plot.identifier isEqual:CPDTickerSymbolAAPL] == YES) {
                return [[[CPDStockPriceStore sharedInstance] monthlyPrices:CPDTickerSymbolAAPL] objectAtIndex:index];
            } else if ([plot.identifier isEqual:CPDTickerSymbolGOOG] == YES) {
                return [[[CPDStockPriceStore sharedInstance] monthlyPrices:CPDTickerSymbolGOOG] objectAtIndex:index];
            } else if ([plot.identifier isEqual:CPDTickerSymbolMSFT] == YES) {
                return [[[CPDStockPriceStore sharedInstance] monthlyPrices:CPDTickerSymbolMSFT] objectAtIndex:index];
            }
            break;
    }
    return [NSDecimalNumber zero];

}

//-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index {
//    // 1 - Define label text style
//    static CPTMutableTextStyle *labelText = nil;
//    if (!labelText) {
//        labelText= [[CPTMutableTextStyle alloc] init];
//        labelText.color = [CPTColor grayColor];
//    }
//    // 2 - Calculate portfolio total value
//    NSDecimalNumber *portfolioSum = [NSDecimalNumber zero];
//    for (NSDecimalNumber *price in [[CPDStockPriceStore sharedInstance] dailyPortfolioPrices]) {
//        portfolioSum = [portfolioSum decimalNumberByAdding:price];
//    }
//    // 3 - Calculate percentage value
//    NSDecimalNumber *price = [[[CPDStockPriceStore sharedInstance] dailyPortfolioPrices] objectAtIndex:index];
//    NSDecimalNumber *percent = [price decimalNumberByDividingBy:portfolioSum];
//    // 4 - Set up display label
//    NSString *labelValue = [NSString stringWithFormat:@"$%0.2f USD (%0.1f %%)", [price floatValue], ([percent floatValue] * 100.0f)];
//    // 5 - Create and return layer with label text
//    return [[CPTTextLayer alloc] initWithText:labelValue style:labelText];
//}
//
//-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index {
//    if (index < [[[CPDStockPriceStore sharedInstance] tickerSymbols] count]) {
//        return [[[CPDStockPriceStore sharedInstance] tickerSymbols] objectAtIndex:index];
//    }
//    return @"N/A";
//}

//#pragma mark - UIActionSheetDelegate methods
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//    // 1 - Get title of tapped button
//    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
//    // 2 - Get theme identifier based on user tap
//    NSString *themeName = kCPTPlainWhiteTheme;
//    if ([title isEqualToString:CPDThemeNameDarkGradient] == YES) {
//        themeName = kCPTDarkGradientTheme;
//    } else if ([title isEqualToString:CPDThemeNamePlainBlack] == YES) {
//        themeName = kCPTPlainBlackTheme;
//    } else if ([title isEqualToString:CPDThemeNamePlainWhite] == YES) {
//        themeName = kCPTPlainWhiteTheme;
//    } else if ([title isEqualToString:CPDThemeNameSlate] == YES) {
//        themeName = kCPTSlateTheme;
//    } else if ([title isEqualToString:CPDThemeNameStocks] == YES) {
//        themeName = kCPTStocksTheme;
//    }
//    // 3 - Apply new theme
//    [self.hostView.hostedGraph applyTheme:[CPTTheme themeNamed:themeName]];
//}

#pragma mark - Rotation

//  supportedInterfaceOrientations
//  Support either landscape orientation (iOS 6).

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
    //return UIInterfaceOrientationMaskPortrait;
}

//  Support either landscape orientation (iOS 5).
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    return (interfaceOrientation == UIInterfaceOrientationMaskPortrait);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
