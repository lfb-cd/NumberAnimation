# NumberAnimation
A simple digital growth animation 简单数字增长动画

#简单实现数字增长动画 
#####整个代码完全由swift书写 暂不支持小数
主要用到NSTimer()函数
```
NSTimer.scheduledTimerWithTimeInterval(tiCallRate, target: self, selector:"numberTo:",userInfo: nil, repeats: true)
//第一个参数表示调用numberTo（）函数的频率
```
####我第一次用NSTimer简单实现了一下，但是如果数据比较大，NSTimer最快频率也只有0.0001（还是0.001哦，搞忘了）秒调用一次，所以效果不好。
解决的办法：将字符串三位一组地进行拆分
根据位置不同，调整数字增长快慢。

比如19000。拆分成【190】，【00】数据的前部分（00）增长快些，【190】增长得慢些。
并且，数据并不是从0开始增长，应该从一个较大的数据开始增长，以19000为例，应该从9089开始增长，这样效果会比较好。



![image](https://github.com/lfb-cd/NumberAnimation/blob/master/2015-03-28%2019.31.59.png)

简单效果浏览：

![image](https://github.com/lfb-cd/NumberAnimation/blob/master/2015-03-28%2019_55_50.gif)
