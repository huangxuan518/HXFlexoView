//
//  HXFlexoView.h
//  HXFlexoView
//
//  Created by 黄轩 on 16/1/13.
//  Copyright © 2015年 IT小子. All rights reserved.
//


#import <UIKit/UIKit.h>

#define HXUIColorWithHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1]

@interface HXFlexoView : UIView

#pragma mark 左边部分 VS 右边部分 对其方式
@property (nonatomic,assign) NSInteger alignment;//对其方式 0.都靠左对其 1.都靠右对其 2.各自靠边对其 默认都靠左
@property (nonatomic,assign) float leftPartAndRightPartMinSpace;//左边部分和右边部分的最小间距

#pragma mark 左边部分 包括一个UILabel 一个UIImageView
@property (nonatomic,strong) UILabel *leftLabel;//左边部分 UILabel UILabel在前
@property (nonatomic,strong) UIImageView *leftImageView;//左边部分 UIImageView UIImageView在后
@property (nonatomic,assign) float leftLabelAndImageViewSpace;//左边部分UILabel和左边部分UIImageView的空隙
@property (nonatomic,assign) NSInteger leftPartIcoWithTextAlignment;//左边部分UIImageView相对UILabel对其方式 0.居中对其 1.顶部对其 2.底部对其

#pragma mark 右边部分 VS 包括一个UIImageView 一个UILabel
@property (nonatomic,strong) UIImageView *rightImageView;//右边部分UIImageView UIImageView在前
@property (nonatomic,strong) UILabel *rightLabel;//右边部分UILabel UILabel在后
@property (nonatomic,assign) float rightLabelAndImageViewSpace;//右边部分UILabel和右边部分UIImageView的空隙
@property (nonatomic,assign) NSInteger rightPartIcoWithTextAlignment;//右边部分UIImageView相对UILabel对其方式 0.居中对其 1.顶部对其 2.底部对其

- (void)refresh;

@end

#pragma mark - 扩展方法

@interface NSString (HXExtention)
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
