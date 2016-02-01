//
//  HXFlexoView.m
//  HXFlexoView
//
//  Created by 黄轩 on 16/1/13.
//  Copyright © 2015年 IT小子. All rights reserved.

#import "HXFlexoView.h"

@implementation HXFlexoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 16)];
        _leftLabel.textColor = HXUIColorWithHex(0x3D3E40);
        _leftLabel.backgroundColor = [UIColor clearColor];
        _leftLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_leftLabel];

        _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 16)];
        _rightLabel.textColor = HXUIColorWithHex(0x999999);
        _rightLabel.textAlignment = NSTextAlignmentRight;
        _rightLabel.backgroundColor = [UIColor clearColor];
        _rightLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_rightLabel];

        _leftLabelAndImageViewSpace = 5;
        _rightLabelAndImageViewSpace = 5;
        _leftPartAndRightPartMinSpace = 10;
    }
    return self;
}

- (void)setLeftLabel:(UILabel *)leftLabel {
    _leftLabel = nil;
    _leftLabel = leftLabel;
    if (_leftLabel) {
        [self addSubview:_leftLabel];
    } else {
        [_leftLabel removeFromSuperview];
    }
}

- (void)setLeftImageView:(UIImageView *)leftImageView {
    _leftImageView = nil;
    _leftImageView = leftImageView;
    if (_leftImageView) {
        [self addSubview:_leftImageView];
    } else {
        [_leftImageView removeFromSuperview];
    }
}

- (void)setRightLabel:(UILabel *)rightLabel {
    _rightLabel = nil;
    _rightLabel = rightLabel;
    if (_rightLabel) {
        [self addSubview:_rightLabel];
    } else {
        [_rightLabel removeFromSuperview];
    }
}

- (void)setRightImageView:(UIImageView *)rightImageView {
    _rightImageView = nil;
    _rightImageView = rightImageView;
    if (_rightImageView) {
        [self addSubview:_rightImageView];
    } else {
        [_rightImageView removeFromSuperview];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self refresh];
}

- (void)refresh {
    //左边 右边部分的整体宽度
    float leftPartWidth = 0;
    float rightPartWidth = 0;
    
    //左边 右边Label的宽度
    float leftLabelWidth = 0;
    float rightLabelWidth = 0;
    
    //左边Label
    if (_leftLabel && _leftLabel.text.length > 0) {
        leftLabelWidth = [_leftLabel.text sizeWithFont:_leftLabel.font constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT)].width;
        leftPartWidth += leftLabelWidth;
    }
    
    //左边ImageView
    if (_leftImageView) {
        if (leftPartWidth > 0) {
            //如果有Label和ico同事存在,左边部分的整体宽度需要加上之间的空隙
            leftPartWidth += _leftLabelAndImageViewSpace;
        }
        leftPartWidth += _leftImageView.image.size.width;
    }

    //右边ImageView
    if (_rightImageView) {
        rightPartWidth += _rightImageView.image.size.width;
    }
    
    //右边Label
    if (_rightLabel && _rightLabel.text.length > 0) {
        //如果有Label和ico同事存在,左边部分的整体宽度需要加上之间的空隙
        if (rightPartWidth > 0) {
            rightPartWidth += _rightLabelAndImageViewSpace;
        }
        
        rightLabelWidth = [_rightLabel.text sizeWithFont:_rightLabel.font constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT)].width;
        rightPartWidth += rightLabelWidth;
    }
    
    //当左边部分 + 右边部分 + 间隙 > 整个View的宽度时
    if (leftPartWidth + rightPartWidth + _leftPartAndRightPartMinSpace > self.frame.size.width) {
        //右边优先显示完整
        leftPartWidth = self.frame.size.width - rightPartWidth - _leftPartAndRightPartMinSpace;
        if (_leftImageView) {
            leftLabelWidth = leftPartWidth - _leftImageView.frame.size.width - _leftLabelAndImageViewSpace;
        }
    }
    
    //左边部分 X坐标
    float leftPartOriginX = 0;
    //右边部分 X坐标
    float rightPartOriginX = 0;
    
    switch (_alignment) {
            
        case 0: {
            //都靠左对其
            leftPartOriginX = 0;
            
            //右边部分的X坐标 = 左边部分的X坐标 + 左边部分的宽度 + 左右部分之间的最小间距
            if (leftPartWidth > 0) {
                rightPartOriginX = leftPartOriginX + leftPartWidth + _leftPartAndRightPartMinSpace;
            } else {
                rightPartOriginX = leftPartOriginX;
            }
        }
            break;
            
        case 1: {
            //都靠右对其
            rightPartOriginX = self.frame.size.width - rightPartWidth;
            
            //当右边的一部分有的时候才需要减去最小间隔
            if (rightPartWidth > 0) {
                leftPartOriginX = rightPartOriginX - _leftPartAndRightPartMinSpace - leftPartWidth;
            } else {
                leftPartOriginX = rightPartOriginX - leftPartWidth;
            }
        }
            break;
            
        case 2: {
            //各自靠边对其
            leftPartOriginX = 0;
            rightPartOriginX = self.frame.size.width - rightPartWidth;
        }
            break;
            
        default:
            break;
    }
    
    //左边部分
    if (_leftLabel && _leftLabel.text.length > 0) {
        _leftLabel.frame = CGRectMake(leftPartOriginX, _leftLabel.frame.origin.y, leftLabelWidth, _leftLabel.font.pointSize);
    } else {
        [_leftLabel removeFromSuperview];
    }
    
    if (_leftImageView) {
        _leftImageView.frame = CGRectMake(leftPartOriginX + leftPartWidth - _leftImageView.frame.size.width, _leftImageView.frame.origin.y, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
    }
    
    if (_rightImageView) {
        _rightImageView.frame = CGRectMake(rightPartOriginX, _rightImageView.frame.origin.y, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
        rightPartOriginX += _rightImageView.frame.size.width + _rightLabelAndImageViewSpace;
    }
    
    //右边部分
    if (_rightLabel && _rightLabel.text.length > 0) {
        _rightLabel.frame = CGRectMake(rightPartOriginX, _rightLabel.frame.origin.y, rightLabelWidth, _rightLabel.font.pointSize);
    } else {
        [_rightLabel removeFromSuperview];
    }
    
    [self setLeftPartAlignment:_leftPartIcoWithTextAlignment];
    [self setRightPartAlignment:_rightPartIcoWithTextAlignment];
}

//设置左边部分文字和图片的对其方式
- (void)setLeftPartAlignment:(NSInteger)leftPartAlignment {
    switch (leftPartAlignment) {
        case 0: {
            //居中对其
            if (_leftImageView) {
                if (_leftLabel && _leftLabel.text.length > 0) {
                    _leftImageView.frame = CGRectMake(_leftImageView.frame.origin.x, _leftLabel.center.y - _leftImageView.frame.size.height/2, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
                } else {
                    _leftImageView.frame = CGRectMake(_leftImageView.frame.origin.x, 0, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
                }
            }
        }
            break;
            
        case 1: {
            //顶部对其
            if (_leftImageView) {
                if (_leftLabel && _leftLabel.text.length > 0) {
                    _leftImageView.frame = CGRectMake(_leftImageView.frame.origin.x, _leftLabel.frame.origin.y, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
                } else {
                    _leftImageView.frame = CGRectMake(_leftImageView.frame.origin.x, 0, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
                }
            }
            
        }
            break;
            
        case 2: {
            //底部对其
            if (_leftImageView) {
                if (_leftLabel && _leftLabel.text.length > 0) {
                    _leftImageView.frame = CGRectMake(_leftImageView.frame.origin.x, _leftLabel.frame.size.height - _leftImageView.frame.size.height, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
                } else {
                    _leftImageView.frame = CGRectMake(_leftImageView.frame.origin.x, 0, _leftImageView.frame.size.width, _leftImageView.frame.size.height);
                }
            }
        }
            break;
            
        default:
            break;
    }
}

//设置右边部分文字和图片的对其方式
- (void)setRightPartAlignment:(NSInteger)rightPartAlignment {
    switch (rightPartAlignment) {
            
        case 0: {
            //居中对其
            if (_rightImageView) {
                if (_rightLabel && _rightLabel.text.length > 0) {
                    _rightImageView.frame = CGRectMake(_rightImageView.frame.origin.x, _rightLabel.center.y - _rightImageView.frame.size.height/2, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
                } else {
                    _rightImageView.frame = CGRectMake(_rightImageView.frame.origin.x, 0, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
                }
            }
        }
            break;
            
        case 1: {
            //顶部对其
            if (_rightImageView) {
                if (_rightLabel && _rightLabel.text.length > 0) {
                    _rightImageView.frame = CGRectMake(_rightImageView.frame.origin.x, _rightLabel.frame.origin.y, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
                } else {
                    _rightImageView.frame = CGRectMake(_rightImageView.frame.origin.x, 0, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
                }
            }
            
        }
            break;
            
        case 2: {
            //底部对其
            if (_rightImageView) {
                if (_rightLabel && _rightLabel.text.length > 0) {
                    _rightImageView.frame = CGRectMake(_rightImageView.frame.origin.x, _rightLabel.frame.size.height - _rightImageView.frame.size.height, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
                } else {
                    _rightImageView.frame = CGRectMake(_rightImageView.frame.origin.x, 0, _rightImageView.frame.size.width, _rightImageView.frame.size.height);
                }
            }
        }
            break;
            
        default:
            break;
    }
}

@end

#pragma mark - 扩展方法

@implementation NSString (HXExtention)

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    CGSize resultSize;
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(boundingRectWithSize:options:attributes:context:)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:@selector(boundingRectWithSize:options:attributes:context:)];
        NSDictionary *attributes = @{ NSFontAttributeName:font };
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        NSStringDrawingContext *context;
        [invocation setArgument:&size atIndex:2];
        [invocation setArgument:&options atIndex:3];
        [invocation setArgument:&attributes atIndex:4];
        [invocation setArgument:&context atIndex:5];
        [invocation invoke];
        CGRect rect;
        [invocation getReturnValue:&rect];
        resultSize = rect.size;
    } else {
        NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(sizeWithFont:constrainedToSize:)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:@selector(sizeWithFont:constrainedToSize:)];
        [invocation setArgument:&font atIndex:2];
        [invocation setArgument:&size atIndex:3];
        [invocation invoke];
        [invocation getReturnValue:&resultSize];
    }
    return resultSize;
}

@end
