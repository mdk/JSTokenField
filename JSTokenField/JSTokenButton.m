//
//	Copyright 2011 James Addyman (JamSoft). All rights reserved.
//	
//	Redistribution and use in source and binary forms, with or without modification, are
//	permitted provided that the following conditions are met:
//	
//		1. Redistributions of source code must retain the above copyright notice, this list of
//			conditions and the following disclaimer.
//
//		2. Redistributions in binary form must reproduce the above copyright notice, this list
//			of conditions and the following disclaimer in the documentation and/or other materials
//			provided with the distribution.
//
//	THIS SOFTWARE IS PROVIDED BY JAMES ADDYMAN (JAMSOFT) ``AS IS'' AND ANY EXPRESS OR IMPLIED
//	WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
//	FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JAMES ADDYMAN (JAMSOFT) OR
//	CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
//	ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//	NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//	The views and conclusions contained in the software and documentation are those of the
//	authors and should not be interpreted as representing official policies, either expressed
//	or implied, of James Addyman (JamSoft).
//

#import "JSTokenButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation JSTokenButton

@synthesize toggled = _toggled;
@synthesize normalBg = _normalBg;
@synthesize highlightedBg = _highlightedBg;
@synthesize representedObject = _representedObject;
@synthesize maxWidth = _maxWidth;

@synthesize topShadeColor = _topShadeColor;
@synthesize lowShadeColor = _lowShadeColor;
@synthesize topStrokeColor = _topStrokeColor;
@synthesize lowStrokeColor = _lowStrokeColor;
@synthesize topHighlightShadeColor = _topHighlightShadeColor;
@synthesize lowHighlightShadeColor = _lowHighlightShadeColor;
@synthesize topHighlightStrokeColor = _topHighlightStrokeColor;
@synthesize lowHighlightStrokeColor = _lowHighlightStrokeColor;

+ (JSTokenButton *)tokenWithString:(NSString *)string representedObject:(id)obj
{
	JSTokenButton *button = (JSTokenButton *)[self buttonWithType:UIButtonTypeCustom];
    [button setTopShadeColor:[UIColor colorWithRed:0.792 green:0.933 blue:1.0 alpha:1.0]];
    [button setLowShadeColor:[UIColor colorWithRed:0.600 green:0.874 blue:1.0 alpha:1.0]];
    [button setTopStrokeColor:[UIColor colorWithRed:0.20 green:0.55 blue:0.65 alpha:0.25]];
    [button setLowStrokeColor:[UIColor colorWithRed:0.3 green:0.65 blue:0.75 alpha:0.25]];

    [button setTopHighlightShadeColor:[UIColor colorWithRed:0.505 green:0.823 blue:1.952 alpha:1.0]];
    [button setLowHighlightShadeColor:[UIColor colorWithRed:0.282 green:0.606 blue:0.737 alpha:1.0]];
    [button setTopHighlightStrokeColor:[UIColor colorWithRed:0.313 green:0.647 blue:0.792 alpha:1]];
    [button setLowHighlightStrokeColor:[UIColor colorWithRed:0.298 green:0.619 blue:0.749 alpha:1]];
    
    [button setAdjustsImageWhenHighlighted:NO];
	[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[[button titleLabel] setFont:[UIFont fontWithName:@"Helvetica Neue" size:15]];
	[[button titleLabel] setLineBreakMode:UILineBreakModeTailTruncation];
	[button setTitleEdgeInsets:UIEdgeInsetsMake(2, 10, 0, 10)];
	
	[button setTitle:string forState:UIControlStateNormal];
	
    [button sizeToFitWithMargin:CGSizeMake(20, 5)];
	
	[button setToggled:NO];
	
	[button setRepresentedObject:obj];
	
	return button;
}

- (void)setToggled:(BOOL)toggled
{
	_toggled = toggled;
	
	if (_toggled)
	{
		[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	}
	else
	{
		[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	}
    
    [self setNeedsDisplay];
}

- (void)setMaxWidth:(CGFloat)maxWidth
{
    _maxWidth = maxWidth;
    [self sizeToFitWithMargin:CGSizeMake(20, 5)];
}

- (void)sizeToFitWithMargin:(CGSize)margin
{
	[self sizeToFit];
    CGRect frame = [self frame];
	frame.size.width += margin.width;
	frame.size.height += margin.height;
    
    if (_maxWidth > 0 && frame.size.width > _maxWidth) {
        frame.size.width = _maxWidth;
    }
    
	[self setFrame:frame];
}

- (void)addRoundedRect:(CGRect)rect withRadius:(CGFloat)radius inContext:(CGContextRef)context
{

    
    // Make sure corner radius isn't larger than half the shorter side
    if (radius > rect.size.width / 2.0)
        radius = rect.size.width / 2.0;
    if (radius > rect.size.height / 2.0)
        radius = rect.size.height / 2.0;    
    
    CGFloat minx = CGRectGetMinX(rect);
    CGFloat midx = CGRectGetMidX(rect);
    CGFloat maxx = CGRectGetMaxX(rect);
    CGFloat miny = CGRectGetMinY(rect);
    CGFloat midy = CGRectGetMidY(rect);
    CGFloat maxy = CGRectGetMaxY(rect);
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
    
}

- (CGGradientRef)createGradientForColor:(UIColor*)color1 andColor:(UIColor*)color2
{
    CGColorRef c1 = [color1 CGColor];
    CGColorRef c2 = [color2 CGColor];
    
    // Create the gradient
    const float *components1 = CGColorGetComponents(c1);
    const float *components2 = CGColorGetComponents(c2);
    
    CGFloat gradientLocations[2] = { 0.0, 1.0 };
    CGFloat gradientComponents[8] = { components1[0], components1[1], components1[2], components1[3],
        components2[0], components2[1], components2[2], components2[3] };    
    
    static CGColorSpaceRef space = nil;
    if (! space)
        space = CGColorSpaceCreateDeviceRGB();
    
    return CGGradientCreateWithColorComponents(space, gradientComponents, gradientLocations, 2);
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGGradientRef strokeGradient;
    if (_toggled)
        strokeGradient = [self createGradientForColor:_topHighlightStrokeColor andColor:_lowHighlightStrokeColor];
    else 
        strokeGradient = [self createGradientForColor:_topStrokeColor andColor:_lowStrokeColor];
    
    [self addRoundedRect:[self bounds] withRadius:[self bounds].size.height / 2 inContext:context];
    CGContextSaveGState(context);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, strokeGradient, CGPointMake(0, 0), CGPointMake(0, [self bounds].size.height), 0);
    CFRelease(strokeGradient);
    CGContextRestoreGState(context);

    CGGradientRef shadeGradient;
    if (_toggled)
        shadeGradient = [self createGradientForColor:_topHighlightShadeColor andColor:_lowHighlightShadeColor];
    else 
        shadeGradient = [self createGradientForColor:_topShadeColor andColor:_lowShadeColor];

    [self addRoundedRect:CGRectInset([self bounds], 1, 1) withRadius:[self bounds].size.height / 2 inContext:context];
    CGContextSaveGState(context);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, shadeGradient, CGPointMake(0, 1), CGPointMake(0, [self bounds].size.height - 1), 0);
    CFRelease(shadeGradient);
    CGContextRestoreGState(context);    
}

- (void)dealloc
{
	self.representedObject = nil;
	self.highlightedBg = nil;
	self.normalBg = nil;
    self.topHighlightShadeColor = nil;
    self.lowHighlightShadeColor = nil;
    self.topShadeColor = nil;
    self.lowShadeColor = nil;
    [super dealloc];
}

@end