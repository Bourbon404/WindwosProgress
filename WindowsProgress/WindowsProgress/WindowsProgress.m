//
//  WindowsProgress.m
//  WindowsProgress
//
//  Created by ZhengWei on 16/5/6.
//  Copyright © 2016年 Bourbon. All rights reserved.
//

#import "WindowsProgress.h"

@interface WindowsProgress ()
/**
 *  以下三个属性对应的是
    1,底层灰色渐变层
    2,表示进度的绿色渐变层
    3,绿色上边表示动画的白色渐变层    
    4,用来展示动画的BaseicAnimation
 */
@property (nonatomic,strong) CAGradientLayer *backGradientLayer;
@property (nonatomic,strong) CAGradientLayer *greenGradientLayer;
@property (nonatomic,strong) CAGradientLayer *whiteGradientLayer;
@property (nonatomic,strong) CABasicAnimation *animation;
@end
@implementation WindowsProgress


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setFrame:CGRectMake(0, 0, 400, 30)];
        [self.backGradientLayer setFrame:CGRectMake(0, 0, 400, 30)];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setFrame:CGRectMake(0, 0, 400, 30)];
        [self.backGradientLayer setFrame:CGRectMake(0, 0, 400, 30)];
    }
    return self;
}
#pragma mark 设置三个渐变层用来展示效果
-(CAGradientLayer *)backGradientLayer
{
    if (_backGradientLayer == nil) {
        _backGradientLayer = [CAGradientLayer layer];
        _backGradientLayer.colors = @[
                                          (id)[UIColor whiteColor].CGColor,
                                          (id)[UIColor lightGrayColor].CGColor,
                                          (id)[UIColor whiteColor].CGColor
                                          ];
        _backGradientLayer.locations = @[
                                             @0.0,
                                             @0.5,
                                             @1
                                             ];
        _backGradientLayer.startPoint = CGPointMake(0.5, 0);
        _backGradientLayer.endPoint = CGPointMake(0.5, 1);
        [self.layer addSublayer:_backGradientLayer];

    }
    return _backGradientLayer;
}
-(CAGradientLayer *)greenGradientLayer
{
    if (_greenGradientLayer == nil) {
        
        _greenGradientLayer = [CAGradientLayer layer];
        _greenGradientLayer.colors = @[
                                      (id)[UIColor whiteColor].CGColor,
                                      (id)[UIColor greenColor].CGColor,
                                      (id)[UIColor whiteColor].CGColor
                                      ];
        _greenGradientLayer.locations = @[
                                         @0.0,
                                         @0.5,
                                         @1
                                         ];
        _greenGradientLayer.startPoint = CGPointMake(0.5, 0);
        _greenGradientLayer.endPoint = CGPointMake(0.5, 1);
        _greenGradientLayer.masksToBounds = YES;
        [self.layer addSublayer:_greenGradientLayer];
        [_greenGradientLayer addSublayer:self.whiteGradientLayer];

        
    }
    return _greenGradientLayer;
}
-(CAGradientLayer *)whiteGradientLayer
{
    if (_whiteGradientLayer == nil) {
        
        _whiteGradientLayer = [CAGradientLayer layer];
        _whiteGradientLayer.colors = @[
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0].CGColor,
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor,
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0].CGColor
                                       ];
        _whiteGradientLayer.locations = @[
                                          @0.0,
                                          @0.5,
                                          @1
                                          ];
        _whiteGradientLayer.startPoint = CGPointMake(0, 0.5);
        _whiteGradientLayer.endPoint = CGPointMake(1, 0.5);
        _whiteGradientLayer.zPosition = 1.8;
        [_whiteGradientLayer setFrame:CGRectMake(0, 0, 40, self.frame.size.height)];
        [_whiteGradientLayer addAnimation:self.animation forKey:@"move"];
    }
    return _whiteGradientLayer;
}
#pragma mark 白色渐变层的一个位移动画
-(CABasicAnimation *)animation
{
    if (_animation == nil) {
        
        _animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
        _animation.fromValue = 0;
        _animation.toValue = @(self.frame.size.width);
        _animation.duration = 2;
        _animation.repeatCount = CGFLOAT_MAX;
    }
    return _animation;
}
#pragma mark 设置当前值的属性
-(void)setCurrentValue:(NSInteger)currentValue
{
    _currentValue = currentValue;
    [self.greenGradientLayer setFrame:CGRectMake(0, 0, self.frame.size.width * self.currentValue / 100.0, self.frame.size.height)];
    [self setNeedsDisplay];
}
@end
