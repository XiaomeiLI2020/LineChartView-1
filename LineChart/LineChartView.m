//
//  LineChartView.m
//
//
//  Created by Rondinelli Morais on 29/08/14.
//  Copyright (c) 2014 Rondinelli Morais. All rights reserved.
//

#import "LineChartView.h"

#define kPaddingTop     50.f
#define kPaddingBottom  30.f
#define kStartPadding   10.f

@interface LineChartView ()

@property (nonatomic, assign) NSInteger numberOfItens;
@property (nonatomic, assign) CGFloat startPadding;

@property (nonatomic, retain) NSMutableArray * source;
@property (nonatomic, retain) NSMutableArray * points;
@property (nonatomic, strong) UIView * baseLine;

@property (nonatomic, retain) UIBezierPath * path;
@property (nonatomic, retain) CAShapeLayer * shapeLayer;

@end

@implementation LineChartView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultValues];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self defaultValues];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultValues];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self reloadData];
}

// -----------------------------------------------------------------------------
// Private Methods
// -----------------------------------------------------------------------------
#pragma mark - Private Methods
- (void)defaultValues {
    _pointColor = [UIColor whiteColor];
    _viewPointSize = (CGSize){10.f, 10.f};
    _baseLineColor = [UIColor colorWithWhite:1.f alpha:.5f];
    _baseLineHeight = 1.f;
    _titleColor = [UIColor whiteColor];
    _valueColor = [UIColor whiteColor];
    _chartTitleColor = [UIColor whiteColor];
    _chartFont = [UIFont fontWithName:@"Arial-BoldMT" size:16.f];
    _drawLineAnimationDuration = 1.f;
    _drawLine = YES;
}

- (void)initialize {
    [self setPoints:[NSMutableArray new]];
    
    if(!_source){
        [self setSource:[self.dataSource dataValuesLineChartView:self]];
    }
    
    [self setNumberOfItens:self.source.count];
    [self setStartPadding:kStartPadding];
}

- (void)createPoints {
    
    CGFloat leftPadding = 0.f;
    
    // Grazy Calcule
    leftPadding = (CGRectGetWidth(self.frame) - (_viewPointSize.width + _startPadding));
    leftPadding = leftPadding - ((_viewPointSize.width * (_numberOfItens - 1)) + _startPadding);
    leftPadding = leftPadding / (_numberOfItens - 1);
    
    UIView * baseView = nil;
    
    for (int i = 0; i < _numberOfItens; i++)
    {
        // cria a view point
        UIView * point = [self createViewPoint];
        
        // obtem os dados
        NSDictionary * data = _source[i];
        
        // calcula posicao do y
        CGFloat basePercent = (CGRectGetHeight(self.frame) - kPaddingBottom - CGRectGetHeight(_baseLine.frame) - _viewPointSize.height/2);
        CGFloat newY = ((basePercent - kPaddingTop) * [[data valueForKey:@"percentValue"] floatValue]) / 100;
        
        // calcula a frame da view
        CGRect pointRect = point.frame;
        pointRect.origin.x = (!baseView) ? _startPadding : (baseView.frame.origin.x + baseView.frame.size.width + leftPadding);
        pointRect.origin.y = (basePercent - newY);
        [point setFrame:pointRect];
        baseView = point;
        
        // adiciona a view
        [[self points] addObject:point];
        [self addSubview:point];
    }
}

- (UIView*)createViewPoint {
    
    UIView * point = [[UIView alloc] initWithFrame:(CGRect){0, 0, _viewPointSize}];
    
    [point setBackgroundColor:_pointColor];
    
    [[point layer] setMasksToBounds:YES];
    [[point layer] setCornerRadius:CGRectGetWidth(point.frame)/2];
    
    return point;
}

- (void)createBaseLine {
    
    _baseLine = [[UIView alloc] initWithFrame:(CGRect){
        {self.startPadding, CGRectGetHeight(self.frame) - kPaddingBottom}, {CGRectGetWidth(self.frame) - (self.startPadding * 2), _baseLineHeight}
    }];
    
    _baseLine.backgroundColor = _baseLineColor;

    [self addSubview:_baseLine];
}

- (void)drawLines {
    
    [self.path removeAllPoints];
    [self.shapeLayer removeFromSuperlayer];
    
    for (int i = 0; i < _points.count; i++)
    {
        UIView * v = _points[i];
        
        if(i == 0)
        {
            self.path = [UIBezierPath bezierPath];
            [self.path moveToPoint:v.center];
            
            self.shapeLayer = [[CAShapeLayer alloc] initWithLayer:self.layer];
            self.shapeLayer.lineWidth = 1.f;
            self.shapeLayer.strokeColor = v.backgroundColor.CGColor;
            self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
            
            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = _drawLineAnimationDuration;
            pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
            pathAnimation.repeatCount = 0;
            pathAnimation.autoreverses = NO;
            [self.shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
            
            [self.layer addSublayer:self.shapeLayer];
        }
        else
        {
            [self.path addLineToPoint:v.center];
            self.shapeLayer.path = self.path.CGPath;
        }
    }
}

- (void)cleanView {
    
    for (UIView * subView in self.points) {
        [subView removeFromSuperview];
    }
    
    for (UIView * subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
}

- (void)addTitles {
    
    for (int i = 0; i < _points.count; i++)
    {
        UIView * v = _points[i];
        
        // obtem os dados
        NSDictionary * data = _source[i];
        
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectZero];
        [title setBackgroundColor:[UIColor clearColor]];
        [title setTextColor:_titleColor];
        [title setFont:[UIFont fontWithName:@"Arial-BoldMT" size:13.f]];
        [title setText:[NSString stringWithFormat:@"%.2i", (int)[[data valueForKey:@"text"] integerValue]]];
        [title sizeToFit];
        
        // calcula a frame
        CGRect titleRect = title.frame;
        titleRect.origin.y = _baseLine.frame.origin.y + 8.f;
        titleRect.origin.x = (v.frame.origin.x - (CGRectGetWidth(title.frame)/5));
        [title setFrame:titleRect];
        
        // adiciona label
        [self addSubview:title];
    }
}

- (void)addValues {
    
    for (int i = 0; i < _points.count; i++)
    {
        UIView * v = _points[i];
        
        // obtem os dados
        NSDictionary * data = _source[i];
        
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectZero];
        [title setBackgroundColor:[UIColor clearColor]];
        [title setTextColor:_valueColor];
        [title setFont:[UIFont fontWithName:@"Arial" size:12.f]];
        [title setText:[data valueForKey:@"value"]];
        [title sizeToFit];
        
        // calcula a frame
        CGRect titleRect = title.frame;
        titleRect.origin.y = (v.frame.origin.y - v.frame.size.height) - 8.f;
        titleRect.origin.x = (v.frame.origin.x - (CGRectGetWidth(title.frame)/5));
        [title setFrame:titleRect];
        
        // adiciona label
        [self addSubview:title];
    }
}

- (void)createChartTitle {
    
    if(!_title)return;
    
    UILabel * chartTitle = [UILabel new];

    [chartTitle setFont:_chartFont];
    [chartTitle setTextColor:_chartTitleColor];
    [chartTitle setText:_title];
    [chartTitle sizeToFit];
    
    CGRect titleRect = chartTitle.frame;
    titleRect.origin = CGPointMake((CGRectGetWidth(self.frame)/2 - titleRect.size.width/2), 5.f);
    chartTitle.frame = titleRect;
    
    [self addSubview:chartTitle];
}

// -----------------------------------------------------------------------------
// Public Methods
// -----------------------------------------------------------------------------
#pragma mark - Public Methods
- (void)reloadData {
    
    [self cleanView];
    
    [self initialize];
    
    [self createBaseLine];
    
    [self createPoints];
    
    if(_drawLine)[self drawLines];
    
    [self addTitles];
    
    [self addValues];
    
    [self createChartTitle];
}

- (void)reloadAnimation {
    if(_drawLine)[self drawLines];
}

@end















