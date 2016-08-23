//
//  xklProgressView.m
//  testForTableViewCell
//
//  Created by iOS Tedu on 16/8/23.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "xklProgressView.h"

@implementation xklProgressView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _width = 0;
        _percent = 0;
    }
    return self;
}

- (void)setPercent:(CGFloat)percent {
    _percent = percent;
    if (percent > 1.0) {
        _percent = 1.0;
    }
    if (percent < 0.0) {
        _percent = 0.0;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self addMyBackGroundColor];
    [self addMyProgressColor];
    [self addMyFrontColor];
    [self addMyFrontText];
}

- (void)addMyBackGroundColor {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat radius = (self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height) / 2;
    CGPoint center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2, self.bounds.origin.y + self.bounds.size.height / 2);
    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    _backColor = _backColor == nil ? [UIColor lightGrayColor] : _backColor;
    [_backColor setFill];
    [path fill];
}

- (void)addMyProgressColor {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat radius = (self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height) / 2;
    CGPoint center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2, self.bounds.origin.y + self.bounds.size.height / 2);
    [path addArcWithCenter:center radius:radius startAngle:-M_PI_2 endAngle:(-M_PI_2 +  M_PI * 2 * _percent) clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    if (_percent == 1) {
        _progressColor = _progressColor == nil ? [UIColor greenColor] : _progressColor;
    } else {
        _progressColor = _progressColor == nil ? [UIColor blueColor] : _progressColor;
    }
    
    [_progressColor setFill];
    [path fill];
}

- (void)addMyFrontColor {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat radius = (self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height) / 2;
    _width = (_width == 0 ? 5 : _width);
    CGPoint center = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2, self.bounds.origin.y + self.bounds.size.height / 2);
    [path addArcWithCenter:center radius:(radius - _width) startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    [[UIColor whiteColor] setFill];
    [path fill];
}

- (void)addMyFrontText {
    NSString *percent = @"";
    UIFont *font = [UIFont boldSystemFontOfSize:14];
    
    if (_percent == 1) {
        _frontTextColor = _frontTextColor == nil ? [UIColor greenColor] : _frontTextColor;
        percent = @"100%";
    } else {
        _frontTextColor = _frontTextColor == nil ? [UIColor blueColor] : _frontTextColor;
        percent = [NSString stringWithFormat:@"%.2f%%", _percent * 100];
    }
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                font,NSFontAttributeName,
                                _frontTextColor,NSForegroundColorAttributeName,
                                [UIColor clearColor],NSBackgroundColorAttributeName,
                                paragraph,NSParagraphStyleAttributeName, nil];
    
    [percent drawInRect:CGRectMake(5, (self.bounds.size.height - 14) / 2, self.bounds.size.width - 10, 14) withAttributes:attributes];
}

@end
