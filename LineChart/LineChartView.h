//
//  LineChartView.h
//  
//
//  Created by Rondinelli Morais on 29/08/14.
//  Copyright (c) 2014 Rondinelli Morais. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LineChartView;
@protocol LineChartViewDataSource <NSObject>

@required
- (NSMutableArray *)dataValuesLineChartView:(LineChartView *)lineChartView;

@end

@interface LineChartView : UIView

// -----------------------------------------------------------------------------
// LineChartViewDataSource
// -----------------------------------------------------------------------------
@property (nonatomic, retain) IBOutlet id<LineChartViewDataSource> dataSource;

// -----------------------------------------------------------------------------
// Public Methods
// -----------------------------------------------------------------------------
#pragma mark - Public Methods
- (void)reloadData;
- (void)reloadAnimation;

/* top title of chart */
@property (nonatomic, retain) NSString * title;

/* Color of view indicator point. By default this value is [UIColor whiteColor] */
@property (nonatomic, retain) UIColor * pointColor UI_APPEARANCE_SELECTOR;

/* Color of base line chart. By default this value is [UIColor whiteColor] */
@property (nonatomic, retain) UIColor * baseLineColor UI_APPEARANCE_SELECTOR;

/* height of the base line chart. By default this value is 1px */
@property (nonatomic, assign) CGFloat baseLineHeight UI_APPEARANCE_SELECTOR;

/* Size of view indicator point. By default this value is {10.f, 10.f} */
@property (nonatomic, assign) CGSize viewPointSize UI_APPEARANCE_SELECTOR;

/* Color of the text above the base line. By default this value is [UIColor whiteColor] */
@property (nonatomic, retain) UIColor * titleColor UI_APPEARANCE_SELECTOR;

/* Color of the text below the view indicator point. By default this value is [UIColor whiteColor] */
@property (nonatomic, retain) UIColor * valueColor UI_APPEARANCE_SELECTOR;

/* Title of the top title chart. By default this value is [UIColor whiteColor] */
@property (nonatomic, retain) UIColor * chartTitleColor UI_APPEARANCE_SELECTOR;

/* font of the top title chart. By default [UIFont fontWithName:@"Arial-BoldMT" size:16.f] */
@property (nonatomic, retain) UIFont * chartFont UI_APPEARANCE_SELECTOR;

/* speed of animation draw line between view points. By default this value is 1s */
@property (nonatomic, assign) CGFloat drawLineAnimationDuration UI_APPEARANCE_SELECTOR;

/* indique if animation line is begin when chart is shown. By default this value is YES */
@property (nonatomic, assign) BOOL drawLine;

@end
