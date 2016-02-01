//
//  HXViewController.m
//  HXSuperLabel
//
//  Created by 黄轩 on 16/1/14.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import "HXViewController.h"
#import "HXFlexoView.h"

@interface HXViewController ()

@property (nonatomic,strong) UIImageView *icoImageView;

@end

@implementation HXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"多功能View";
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            int index = i*3+j;
            if (index > 6) {
                break;
            }
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(10 + (100+10)*j, 100+(30+10)*i, 100, 30);
            if (index < 6) {
                [button setTitle:[NSString stringWithFormat:@"应用%d",index] forState:UIControlStateNormal];
            } else {
                [button setTitle:@"常用样式" forState:UIControlStateNormal];
            }
            button.tag = index;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
    
    _icoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 250, 40, 40)];
    _icoImageView.image = [UIImage imageNamed:@"ico_xinwen"];
    [self.view addSubview:_icoImageView];
}

- (void)buttonAction:(UIButton *)sender {
    //先移除之前的View
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[HXFlexoView class]]) {
            [view removeFromSuperview];
        }
    }
    
    _icoImageView.frame = CGRectMake(10, 250, 40, 40);
    _icoImageView.image = [UIImage imageNamed:@"ico_touxiang"];

    switch (sender.tag) {
        case 0: {
            _icoImageView.image = [UIImage imageNamed:@"qq_xinwen"];
            [self addStyleOne];
        }
            break;
            
        case 1: {
            [self addStyleTwo];
        }
            break;
            
        case 2: {
            [self addStyleThree];
        }
            break;
            
        case 3: {
            _icoImageView.frame = CGRectMake(10, 250, 75, 60);
            _icoImageView.image = [UIImage imageNamed:@"zhouheiya"];
            [self addStyleFour];
        }
            break;
            
        case 4: {
            [self addStyleFive];
        }
            break;
            
        case 5: {
            _icoImageView.image = [UIImage imageNamed:@"weibo_touxiang"];
            [self addStyleSix];
        }
            break;
            
        case 6: {
            _icoImageView.frame = CGRectMake(10, 250, 0, 0);
            [self addStyleAll];
        }
            break;
            
        default:
            break;
    }
}

- (void)addStyleOne {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, _icoImageView.frame.origin.y, self.view.frame.size.width-20 - _icoImageView.frame.size.width - 10, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"腾讯新闻";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x00000);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:17];
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_renzheng"]];
    flexoView.rightLabel.text = @"昨天";
    flexoView.rightLabel.textColor = HXUIColorWithHex(0x9d9d9d);
    flexoView.rightLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"小芈月与小小龙女度假晒美照";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x777777);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:flexoView];
}

- (void)addStyleTwo {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, _icoImageView.frame.origin.y, self.view.frame.size.width-20 - _icoImageView.frame.size.width - 10, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"小丸子";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x00000);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:17];
    flexoView.rightLabel.text = @"上午12:00";
    flexoView.rightLabel.textColor = HXUIColorWithHex(0x9d9d9d);
    flexoView.rightLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"hello,world!";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x777777);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:flexoView];
}

- (void)addStyleThree {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, _icoImageView.frame.origin.y, self.view.frame.size.width-20 - _icoImageView.frame.size.width - 10, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"小不点";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x00000);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:17];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_wifi"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"[在线]";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x777777);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:14];
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_kongjian"]];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_tupian"]];
    flexoView.rightLabel.text = @"上传10张照片到《我的相册》";
    [self.view addSubview:flexoView];
}

- (void)addStyleFour {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, _icoImageView.frame.origin.y, self.view.frame.size.width-20 - _icoImageView.frame.size.width - 10, 15)];
    flexoView.leftLabel.text = @"周黑鸭(世界之窗店)";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x333333);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 8, flexoView.frame.size.width, 13)];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    flexoView.rightLabel.text = @"人均60元";
    flexoView.rightLabel.textColor = HXUIColorWithHex(0xaeaeae);
    flexoView.rightLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 8, 300, 15)];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhifubao_jian"]];
    flexoView.rightLabel.text = @"随机立减,最高优惠30元";
    flexoView.rightLabel.textColor = HXUIColorWithHex(0xaeaeae);
    flexoView.rightLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:flexoView];
}

- (void)addStyleFive {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, _icoImageView.frame.origin.y, self.view.frame.size.width-20 - _icoImageView.frame.size.width - 10, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"黄轩";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x00000);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:17];
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_xunzhang"]];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_wifi"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"昨天18:00";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x777777);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:14];
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_yinyue"]];
    flexoView.rightLabel.text = @"冬季到台北来看雨";
    [self.view addSubview:flexoView];
}

- (void)addStyleSix {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, _icoImageView.frame.origin.y, self.view.frame.size.width-20 - _icoImageView.frame.size.width - 10, 17)];
    flexoView.leftLabel.text = @"我的损友是个极品";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x00000);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:17];
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_membership"]];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redenvelope_tips_small"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(_icoImageView.frame.origin.x + _icoImageView.frame.size.width + 10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"来自微博";
    flexoView.leftLabel.textColor = HXUIColorWithHex(0x777777);
    flexoView.leftLabel.font = [UIFont systemFontOfSize:14];
    flexoView.rightLabel.text = @"weibo.com";
    [self.view addSubview:flexoView];
}

- (void)addStyleAll {
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, _icoImageView.frame.origin.y, self.view.frame.size.width - 20, 17)];
    flexoView.leftLabel.text = @"小芈月与小小龙女度假晒美照";
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"来自微博";
    flexoView.rightLabel.text = @"weibo.com";
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"小丸子";
    flexoView.rightLabel.text = @"上午12:00";
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 17)];
    flexoView.leftLabel.text = @"小不点";
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_vip"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"小不点";
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_wifi"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 8, flexoView.frame.size.width, 15)];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhifubao_jian"]];
    flexoView.rightLabel.text = @"随机立减,最高优惠30元";
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"腾讯新闻";
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_renzheng"]];
    flexoView.rightLabel.text = @"昨天";
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 17)];
    flexoView.alignment = 2;//对齐方式 0.左对齐
    flexoView.leftLabel.text = @"黄轩";
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_xunzhang"]];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_wifi"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"昨天18:00";
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_yinyue"]];
    flexoView.rightLabel.text = @"冬季到台北来看雨";
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 17)];
    flexoView.leftLabel.text = @"我的损友是个极品";
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_membership"]];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redenvelope_tips_small"]];
    [self.view addSubview:flexoView];
    
    flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, flexoView.frame.origin.y + flexoView.frame.size.height + 10, flexoView.frame.size.width, 14)];
    flexoView.leftLabel.text = @"[在线]";
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_kongjian"]];
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_tupian"]];
    flexoView.rightLabel.text = @"上传10张照片到《我的相册》";
    [self.view addSubview:flexoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
