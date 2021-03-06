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

#import <UIKit/UIKit.h>

@interface JSTokenButton : UIButton {

	BOOL _toggled;
	
	UIImage *_normalBg;
	UIImage *_highlightedBg;
    
    UIColor *_topShadeColor;
    UIColor *_lowShadeColor;
    UIColor *_topStrokeColor;
    UIColor *_lowStrokeColor;

    UIColor *_topHighlightShadeColor;
    UIColor *_lowHighlightShadeColor;
    UIColor *_topHighlightStrokeColor;
    UIColor *_lowHighlightStrokeColor;
    
	id _representedObject;
    
    CGFloat _maxWidth;
}

@property (nonatomic, getter=isToggled) BOOL toggled;

@property (nonatomic, retain) UIImage *normalBg;
@property (nonatomic, retain) UIImage *highlightedBg;

@property (nonatomic, retain) UIColor *topShadeColor;
@property (nonatomic, retain) UIColor *lowShadeColor;
@property (nonatomic, retain) UIColor *topStrokeColor;
@property (nonatomic, retain) UIColor *lowStrokeColor;

@property (nonatomic, retain) UIColor *topHighlightShadeColor;
@property (nonatomic, retain) UIColor *lowHighlightShadeColor;
@property (nonatomic, retain) UIColor *topHighlightStrokeColor;
@property (nonatomic, retain) UIColor *lowHighlightStrokeColor;

@property (nonatomic, retain) id representedObject;

@property (nonatomic, assign) CGFloat maxWidth;

+ (JSTokenButton *)tokenWithString:(NSString *)string representedObject:(id)obj;

- (void)sizeToFitWithMargin:(CGSize)margin;

@end
