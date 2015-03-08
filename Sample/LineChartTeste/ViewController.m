//
//  ViewController.m
//  LineChartTeste
//
//  Created by Rondinelli Morais on 29/08/14.
//  Copyright (c) 2014 Rondinelli Morais. All rights reserved.
//

#import "ViewController.h"
#import "LineChartView.h"

@interface ViewController () <LineChartViewDataSource>

@property (nonatomic, retain) NSMutableArray * dataSource;
@property (weak, nonatomic) IBOutlet LineChartView *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.chartView setTitle:@"October / 1987"];
}

#pragma mark - LineChartViewDataSource
- (NSMutableArray *)dataValuesLineChartView:(LineChartView *)lineChartView {
    
    _dataSource = [NSMutableArray new];
    [self.dataSource addObject:@{ @"percentValue" : @10.5f,     @"text" : @1,   @"value": @"50"   }];
    [self.dataSource addObject:@{ @"percentValue" : @21.f,      @"text" : @2,   @"value": @"104"  }];
    [self.dataSource addObject:@{ @"percentValue" : @8.5f,      @"text" : @3,   @"value": @"40"   }];
    [self.dataSource addObject:@{ @"percentValue" : @93.5f,     @"text" : @4,   @"value": @"480"  }];
    [self.dataSource addObject:@{ @"percentValue" : @65.3f,     @"text" : @5,   @"value": @"200"  }];
    [self.dataSource addObject:@{ @"percentValue" : @24.7f,     @"text" : @6,   @"value": @"224"  }];
    [self.dataSource addObject:@{ @"percentValue" : @80.7f,     @"text" : @7,   @"value": @"300"  }];
    [self.dataSource addObject:@{ @"percentValue" : @5.2564f,   @"text" : @8,   @"value": @"430"  }];
    [self.dataSource addObject:@{ @"percentValue" : @10.5f,     @"text" : @9,   @"value": @"450"  }];
    [self.dataSource addObject:@{ @"percentValue" : @21.f,      @"text" : @10,  @"value": @"104"  }];
    [self.dataSource addObject:@{ @"percentValue" : @8.5f,      @"text" : @11,  @"value": @"40"   }];
    [self.dataSource addObject:@{ @"percentValue" : @93.5f,     @"text" : @12,  @"value": @"480"  }];
    [self.dataSource addObject:@{ @"percentValue" : @0.f,       @"text" : @13,  @"value": @"0"    }];
    return _dataSource;
}

@end
