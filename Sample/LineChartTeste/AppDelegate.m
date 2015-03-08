//
//  AppDelegate.m
//  LineChartTeste
//
//  Created by Rondinelli Morais on 29/08/14.
//  Copyright (c) 2014 Rondinelli Morais. All rights reserved.
//

#import "AppDelegate.h"
#import "LineChartView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //
    // With appearance customization
    //
    [[LineChartView appearance] setChartFont:[UIFont fontWithName:@"Cochin-BoldItalic" size:18.f]];
    [[LineChartView appearance] setChartTitleColor:[UIColor orangeColor]];
    [[LineChartView appearance] setPointColor:[UIColor redColor]];
    [[LineChartView appearance] setBaseLineColor:[UIColor blueColor]];
    [[LineChartView appearance] setBaseLineHeight:1.f];
    [[LineChartView appearance] setViewPointSize:CGSizeMake(10.f, 10.f)];
    [[LineChartView appearance] setTitleColor:[UIColor yellowColor]];
    [[LineChartView appearance] setValueColor:[UIColor greenColor]];
    
    return YES;
}

@end
