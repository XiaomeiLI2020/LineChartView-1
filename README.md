# LineChartView

<div>
  <img width=50% src="http://rondinelliharris.xpg.uol.com.br/images/chartLine1.png" />
  <img width=80% src="http://rondinelliharris.xpg.uol.com.br/images/charLine2.png" />
</div>

# LineChartView

<div>
  <img width=50% src="http://rondinelliharris.xpg.uol.com.br/images/chartLine1.png" />
  <img width=80% src="http://rondinelliharris.xpg.uol.com.br/images/charLine2.png" />
</div>

# LineChartView

<div>
  <img width=50% src="http://rondinelliharris.xpg.uol.com.br/images/chartLine1.png" />
  <img width=80% src="http://rondinelliharris.xpg.uol.com.br/images/charLine2.png" />
</div>


# LineChartView

<div>
  <img width=50% src="http://rondinelliharris.xpg.uol.com.br/images/chartLine1.png" />
  <img width=80% src="http://rondinelliharris.xpg.uol.com.br/images/charLine2.png" />
</div>

### whats is this? ###

It is a subclass of `UIView` that shows a simple line graph with animation.

### Basic Usage ###

```objective-c
// create LineChartView
LineChartView * lineChartView = [[LineChartView alloc] initWithFrame:(CGRect){
    {0, CGRectGetHeight(self.view.frame)/2},//origin
    {self.view.frame.size.width, 120.f}//size
}];
lineChartView.dataSource = self;
lineChartView.backgroundColor = [UIColor clearColor];
lineChartView.title = @"October / 1987";
lineChartView.drawLineAnimationDuration = .5f;

[self.view addSubview:lineChartView];
````
Configure your delegate:

```objective-c
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
```

### Configure appearance ###

```objective-c
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
```
