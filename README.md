# HXFlexoView 如果对你有一点点帮助,请给一颗★,你的支持是对我的最大鼓励！推荐工具 iOS打包机器人 https://github.com/huangxuan518/HXPackRobot
![image](https://github.com/huangxuan518/HXFlexoView/blob/master/HXFlexoView/1.png)

上面11种样式想必大家都有遇到过,如果让你来实现,你会用多少代码呢,如果是文字的长度都是固定的可能计算还会简单点,如果是动态的呢,你需要多少代码来实现,大家可以试一下!

因为这些图文混排的样式都非常常见,每个项目都有遇到过,所以我写了这么一个非常牛B的View!

HXFlexoView的牛B之处是只需5句代码即可实现上面的所有样式效果,这里采用的是默认参数,如果你需要更改参数,可能需要多几行代码,但是比起你自己的固有方式来写,还是简便很多的.

如果你觉得对你有用,记得给点个赞哦,谢谢!您的支持,是我最大的动力.欢迎关注本人博客: http://blog.libuqing.com/

# 效果图
![image](https://github.com/huangxuan518/HXFlexoView/blob/master/HXFlexoView/xiaoguo.gif)

# 参数说明图
![image](https://github.com/huangxuan518/HXFlexoView/blob/master/HXFlexoView/tushi.png)

# 用法示例
    HXFlexoView *flexoView = [[HXFlexoView alloc] initWithFrame:CGRectMake(10, 10, 200, 100)];
    flexoView.alignment = 2;//对齐方式 默认左对齐,可不设置
    flexoView.leftLabel.text = @"黄轩";//设置则显示,不设置则不显示
    flexoView.leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_xunzhang"]];//设置则显示,不设置则不显示
    flexoView.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq_wifi"]];//设置则显示,不设置则不显示
    flexoView.rightLabel.text = @"冬季到台北来看雨";//设置则显示,不设置则不显示
    [self.view addSubview:flexoView];
