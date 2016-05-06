# iOS仿Windows的进度条

标签（空格分隔）： progress windows 进度条 iOS 

---

最近喜欢上了windows上的进度条，蛮有感觉的，决定仿照着自己写一个
先看原图

![这是windows的](http://www.bourbonz.cn/wp-content/uploads/2016/05/windows.gif)

然后看下我弄的

![这是我弄的](http://www.bourbonz.cn/wp-content/uploads/2016/05/ios.gif)

颜色比例就不要去追求了吧

接下来说下这个是怎么做的

1, 建立了三个渐变图层,分别是灰色，绿色，和白色的三个图层
2, 创建一个位移动画，用来移动白色渐变图层
3, 每次更改进度条的当前值得同时,对绿色渐变层的大小进行更改

这样一个仿照windows的进度条就完成了.下面说下这个有一个缺陷
* 这个东西我没处理好白色渐变层的移动，现在只不过是白色渐变层在整个区域的移动，如果超出绿色边界，在设置了`maskToBounds`的情况下使其不显示了而已
算是一个取巧吧

>欢饮大家访问我的博客进行留言，我会第一时间回复的，谢谢
[点我有惊喜](http://www.bourbonz.cn)

[代码下载](https://github.com/zhwe130205/WindwosProgress)


